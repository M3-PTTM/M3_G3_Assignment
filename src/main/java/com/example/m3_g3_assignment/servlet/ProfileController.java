package com.example.m3_g3_assignment.servlet;

import com.example.m3_g3_assignment.dao.ICustomerDAO;
import com.example.m3_g3_assignment.dao.impl.CustomerDAO;
import com.example.m3_g3_assignment.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ProfileController", urlPatterns = "/profile")
public class ProfileController extends HttpServlet {
    private ICustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        if (customer != null) {
            int customerId = customer.getCustomer_id();
            Customer fullCustomerInfo;
            try {
                fullCustomerInfo = customerDAO.selectCustomer(customerId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("customer", fullCustomerInfo);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/profile.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String name = req.getParameter("customer_name");
        String email = req.getParameter("customer_email");  // Kiểm tra giá trị email
        String phone = req.getParameter("customer_phone");
        String citizen = req.getParameter("customer_citizen");
        String password = req.getParameter("password");

        System.out.println("Email: " + email);  // Thêm logging để kiểm tra giá trị email

        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        if (customer != null) {
            int customerId = customer.getCustomer_id();

            Customer customerToUpdate = new Customer();
            customerToUpdate.setCustomer_id(customerId);
            customerToUpdate.setUsername(username);
            customerToUpdate.setCustomer_name(name);
            customerToUpdate.setCustomer_email(email);  // Gán giá trị email
            customerToUpdate.setCustomer_phone(phone);
            customerToUpdate.setCustomer_citizen(citizen);
            customerToUpdate.setPassword(password);

            if (password == null || password.isEmpty()) {
                password = customer.getPassword();  // Giữ nguyên mật khẩu nếu không có mật khẩu mới
            }

            try {
                boolean rowUpdated = customerDAO.updateCustomer(customerToUpdate);
                if (rowUpdated) {
                    Customer updatedCustomer = customerDAO.selectCustomer(customerId);
                    session.setAttribute("customer", updatedCustomer);
                    resp.sendRedirect("profile");
                } else {
                    req.setAttribute("errorMessage", "Không thể cập nhật thông tin");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/profile.jsp");
                    dispatcher.forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Error updating customer", e);
            }
        } else {
            resp.sendRedirect("login.jsp");
        }
    }

}
