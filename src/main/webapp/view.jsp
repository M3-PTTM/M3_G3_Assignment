<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="/man/library/head.jsp"/>
<body>
<div class="header_section header_bg">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a href="/home" class="logo"><img src="/man/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon text-success"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thông Tin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Mới</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.customer.customer_role=='ADMIN'}">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Quản Lý</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Liên Hệ</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <div class="login_menu">
                    <ul>
                        <c:if test="${sessionScope.customer != null}">
                            <li><a href="logout">Đăng Xuất</a></li>
                        </c:if>
                        <c:if test="${sessionScope.customer == null}">
                            <li><a href="login.jsp">Đăng Nhập</a></li>
                        </c:if>
                        <li><a href="/home?action=cart"><img src="/man/images/trolly-icon.png"></a></li>
                        <li>
                            <form method="get" action="/search"><input class="form-control me-2" type="search"
                                                                       placeholder="Search"
                                                                       aria-label="Search" name="search"
                                                                       oninput="searchByNameOrModel(this)">
                                <button class="btn btn-outline-success" type="submit"><img
                                        src="/man/images/search-icon.png">
                                </button>
                            </form>
                        </li>
                        <c:if test="${sessionScope.customer != null}">
                            <li><a href="#">Xin Chào ${sessionScope.customer.username}</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div id="main">
            <span style="font-size:36px;cursor:pointer; color: #fff" onclick="openNav()"><img
                    src="/man/images/toggle-icon.png" style="height: 30px;"></span>
        </div>
    </nav>
    <div class="banner_section layout_padding">
        <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <c:forEach var="product" items="${products}" varStatus="status">
                    <c:choose>
                        <c:when test="${status.count==1}">
                            <div class="carousel-item active">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <a href="/home?action=view&id=${product.id}">
                                                <div class="best_text">Mới</div>
                                                <div class="image_1"><img src="/man/images/${product.img}"></div>
                                            </a>
                                        </div>
                                        <div class="col-md-5">
                                            <a href="/home?action=view&id=${product.id}"><h1 class="banner_taital">Mô
                                                Hình Mới</h1>
                                                <p class="banner_text">${product.description}</p></a>
                                            <div class="contact_bt"><a href="#" class="buy-now" data-id="${product.id}">Giỏ
                                                Hàng</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <a href="/home?action=view&id=${product.id}">
                                                <div class="best_text">Mới</div>
                                                <div class="image_1"><img src="/man/images/${product.img}"></div>
                                            </a>
                                        </div>
                                        <div class="col-md-5">
                                            <a href="/home?action=view&id=${product.id}"><h1 class="banner_taital">Mô
                                                Hình Mới</h1>
                                                <p class="banner_text">${product.description}</p></a>
                                            <div class="contact_bt"><a href="#" class="buy-now" data-id="${product.id}">Giỏ
                                                Hàng</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div>
</div>
<div class="cycle_section layout_padding">
    <div id="content" class="container">
        <h1 class="cycle_taital">Đánh Giá</h1>
        <p class="cycle_text">Một thực tế đã được xác lập từ lâu là độc giả sẽ bị phân tâm bởi</p>
        <div class="product cycle_section_3 layout_padding">
            <div class="row">
                <div class="col-md-6">
                    <div class="box_main_3">
                        <h6 class="number_text"></h6>
                        <div class="image_2"><img src="/man/images/${product.img}"></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h1 class="cycles_text">${product.category} ${product.name}</h1>
                    <p class="lorem_text">${product.description}</p>
                    <div class="btn_main">
                        <div class="buy_bt"><a href="#" class="buy-now" data-id="${product.id}">Giỏ Hàng</a></div>
                        <h4 class="price_text"><span style=" color: #325662"><fmt:formatNumber
                                value="${product.price}" pattern="###,###"/></span><span
                                style=" color: #f7c17b">VND</span>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="read_btn_main">
            <div class="read_bt">
                <a href="/home">Trở Về</a>
            </div>
        </div>
    </div>
</div>
<div class="client_section layout_padding">
    <div id="my_slider" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="client_main">
                        <h1 class="client_taital">Says Customers</h1>
                        <div class="client_section_2">
                            <div class="client_left">
                                <div><img src="/man/images/client-img.png" class="client_img"></div>
                            </div>
                            <div class="client_right">
                                <div class="quote_icon"><img src="/man/images/quote-icon.png"></div>
                                <p class="client_text">It is a long established fact that a reader will be distracted by
                                    the readable content of a page when looking at its layout. The point of using Lorem
                                    Ipsum is that it has a more-or-less normal distribution of letters</p>
                                <h3 class="client_name">Channery</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="client_main">
                        <h1 class="client_taital">Says Customers</h1>
                        <div class="client_section_2">
                            <div class="client_left">
                                <div><img src="/man/images/client-img.png" class="client_img"></div>
                            </div>
                            <div class="client_right">
                                <div class="quote_icon"><img src="/man/images/quote-icon.png"></div>
                                <p class="client_text">It is a long established fact that a reader will be distracted by
                                    the readable content of a page when looking at its layout. The point of using Lorem
                                    Ipsum is that it has a more-or-less normal distribution of letters</p>
                                <h3 class="client_name">Channery</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="client_main">
                        <h1 class="client_taital">Says Customers</h1>
                        <div class="client_section_2">
                            <div class="client_left">
                                <div><img src="/man/images/client-img.png" class="client_img"></div>
                            </div>
                            <div class="client_right">
                                <div class="quote_icon"><img src="/man/images/quote-icon.png"></div>
                                <p class="client_text">It is a long established fact that a reader will be distracted by
                                    the readable content of a page when looking at its layout. The point of using Lorem
                                    Ipsum is that it has a more-or-less normal distribution of letters</p>
                                <h3 class="client_name">Channery</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</div>
<div id="notification"
     style="display: none; position: fixed; top: 10px; right: 10px; background-color: #4CAF50; color: white; padding: 15px; border-radius: 5px;">
    Sản phẩm đã được thêm vào giỏ hàng thành công!
</div>
<div class="footer_section layout_padding">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-sm-12 padding_0">
                <div class="map_main">
                    <div class="map-responsive">
                        <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&amp;q=Eiffel+Tower+Paris+France"
                                width="600" height="400" frameborder="0" style="border:0; width: 100%;"
                                allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-12">
                <div class="call_text"><a href="#"><img src="/man/images/map-icon.png"><span class="padding_left_0">Page when looking at its layou</span></a>
                </div>
                <div class="call_text"><a href="#"><img src="/man/images/call-icon.png"><span class="padding_left_0">Call Now  +01 123467890</span></a>
                </div>
                <div class="call_text"><a href="#"><img src="/man/images/mail-icon.png"><span class="padding_left_0">demo@gmail.com</span></a>
                </div>
                <div class="social_icon">
                    <ul>
                        <li><a href="#"><img src="/man/images/fb-icon1.png"></a></li>
                        <li><a href="#"><img src="/man/images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="/man/images/linkedin-icon.png"></a></li>
                        <li><a href="#"><img src="/man/images/instagram-icon.png"></a></li>
                    </ul>
                </div>
                <div class="container-fluid">
                    <input type="text" class="email_text" placeholder="Enter Your Email" name="Enter Your Email">
                    <div class="subscribe_bt"><a href="#">Subscribe</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="copyright_section">
    <div class="container">
        <p class="copyright_text">Copyright 2019 All Right Reserved By.<a href="https://html.design"> Free html
            Templates</a></p>
        <p class="copyright_text">Disrtributed By. <a href="https://themewagon.com">ThemeWagon </a></p>
    </div>
</div>
<c:import url="/man/library/add_product.jsp"/>
<c:import url="/man/library/script.jsp"/>
</body>
</html>