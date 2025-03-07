<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                cursor: pointer;
            }
            .dropdown-menu {
                min-width: 150px;
            }
        </style>
    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid bg-dark">
            <div class="row py-2 px-lg-5">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center text-white">
                        <small><i class="fa fa-phone-alt mr-2"></i>+012 345 6789</small>
                        <small class="px-3">|</small>
                        <small><i class="fa fa-envelope mr-2"></i>info@example.com</small>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-white px-2" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="text-white px-2" href=""><i class="fab fa-twitter"></i></a>
                        <a class="text-white px-2" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="text-white px-2" href=""><i class="fab fa-instagram"></i></a>
                        <a class="text-white pl-2" href=""><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 px-lg-5">
                <a href="index.jsp" class="navbar-brand ml-lg-3">
                    <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-book-reader mr-3"></i>Edukate</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
                    <div class="navbar-nav mx-auto py-0">
                        <a href="index" class="nav-item nav-link active">Home</a>
                        <a href="about" class="nav-item nav-link">About</a>
                        <a href="course" class="nav-item nav-link">Courses</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="detail" class="dropdown-item">Course Detail</a>
                                <a href="feature" class="dropdown-item">Our Features</a>
                                <a href="team" class="dropdown-item">Instructors</a>
                                <a href="myenrollment" class="dropdown-item">My Enrollments</a>
                            </div>
                        </div>
                        <a href="contact" class="nav-item nav-link">Contact</a>
                    </div>
                    <%
                        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
                        if (isLoggedIn != null && isLoggedIn) {
                    %>
                    <!-- Nếu đã đăng nhập, hiển thị avatar dropdown -->
                    <div class="dropdown">
                        <img src="https://toquoc.mediacdn.vn/280518851207290880/2022/12/15/p0dnxrcv-16710704848821827978943.jpg" alt="Avatar" class="avatar" id="avatarDropdown" data-bs-toggle="dropdown">
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="avatarDropdown">
                            <li><a class="dropdown-item" href="ChangePasswordServlet">View profile</a></li>
                              <li><a class="dropdown-item" href="myenrollment">View My Enrollments</a></li>
                            <li><a class="dropdown-item" href="ChangePasswordServlet">Change Password</a></li>
                         
                            <li><a class="dropdown-item" href="LogoutServlet">View history of transaction</a></li>
                            <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                        </ul>
                    </div>
                    <%
                        } else {
                    %>
                    <!-- Nếu chưa đăng nhập, hiển thị nút Login -->
                    <a href="LoginServlet" class="btn btn-primary py-2 px-4 d-none d-lg-block">Login</a>
                    <%
                        }
                    %>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>