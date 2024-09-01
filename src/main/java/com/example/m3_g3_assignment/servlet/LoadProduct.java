package com.example.m3_g3_assignment.servlet;

import com.example.m3_g3_assignment.dao.ServiceProduct;
import com.example.m3_g3_assignment.dao.impl.ServiceProductImpl;
import com.example.m3_g3_assignment.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/load")
public class LoadProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final ServiceProduct SERVICE_PRODUCT = new ServiceProductImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        int exits = Integer.parseInt(req.getParameter("exits"));
        try {
            Map<Product, Integer> map = SERVICE_PRODUCT.getProductsNextLimit3(exits);
            PrintWriter out = resp.getWriter();
            int count = exits;
            for (Map.Entry<Product, Integer> entry : map.entrySet()) {
                if (entry.getValue() > 0) {
                    if (count % 2 == 0) {
                        out.println("<div class=\"product cycle_section_3 layout_padding\">\n" +
                                "                            <div class=\"row\">\n" +
                                "                                <div class=\"col-md-6\">\n" +
                                "                                    <div class=\"box_main_3\">\n" +
                                "                                        <h6 class=\"number_text\">"+count+"</h6>\n" +
                                "                                        <div class=\"image_2\"><img src=\"/man/images/" + entry.getKey().getImg() + "\"></div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                                <div class=\"col-md-6\">\n" +
                                "                                    <h1 class=\"cycles_text\">" + entry.getKey().getCategory() + " " + entry.getKey().getName() + "</h1>\n" +
                                "                                    <p class=\"lorem_text\">" + entry.getKey().getDescription() + "</p>\n" +
                                "                                    <div class=\"btn_main\">\n" +
                                "                                        <div class=\"buy_bt\"><a href=\"#\">Buy Now</a></div>\n" +
                                "                                        <h4 class=\"price_text\">Price <span style=\" color: #f7c17b\">$</span> <span\n" +
                                "                                                style=\" color: #325662\">" + entry.getKey().getPrice() + "</span></h4>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>\n" +
                                "                        </div>\n");
                        count++;
                    } else {
                        out.println("<div class=\"product cycle_section_3 layout_padding\">\n" +
                                "                            <div class=\"row\">\n" +
                                "                                <div class=\"col-md-6\">\n" +
                                "                                    <h1 class=\"cycles_text\">" + entry.getKey().getCategory() + " " + entry.getKey().getName() + "</h1>\n" +
                                "                                    <p class=\"lorem_text\">" + entry.getKey().getDescription() + "</p>\n" +
                                "                                    <div class=\"btn_main\">\n" +
                                "                                        <div class=\"buy_bt\"><a href=\"#\">Buy Now</a></div>\n" +
                                "                                        <h4 class=\"price_text\">Price <span style=\" color: #f7c17b\">$</span> <span\n" +
                                "                                                style=\" color: #325662\">" + entry.getKey().getPrice() + "</span></h4>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                                <div class=\"col-md-6\">\n" +
                                "                                    <div class=\"box_main_3\">\n" +
                                "                                        <h6 class=\"number_text\">"+count+"</h6>\n" +
                                "                                        <div class=\"image_2\"><img src=\"/man/images/" + entry.getKey().getImg() + "\"></div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>\n" +
                                "                        </div>");
                        count++;
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
