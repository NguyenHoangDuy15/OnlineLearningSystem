<%-- 
    Document   : team.jsp
    Created on : Mar 3, 2025, 10:53:30 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Edukate - Online Education Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <!-- Favicon -->
        <link href="../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <!-- Header Start -->
        <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
            <div class="container text-center py-5">
                <h1 class="text-white display-1">Instructors</h1>
                <div class="d-inline-flex text-white mb-5">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">Instructors</p>
                </div>
                <div class="mx-auto mb-5" style="width: 100%; max-width: 600px;">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-light bg-white text-body px-4 dropdown-toggle" type="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">Courses</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Courses 1</a>
                                <a class="dropdown-item" href="#">Courses 2</a>
                                <a class="dropdown-item" href="#">Courses 3</a>
                            </div>
                        </div>
                        <input type="text" class="form-control border-light" style="padding: 30px 25px;" placeholder="Keyword">
                        <div class="input-group-append">
                            <button class="btn btn-secondary px-4 px-lg-5">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <!-- Team Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="section-title text-center position-relative mb-5">
                    <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Instructors</h6>
                    <h1 class="display-4">Meet Our Instructors</h1>
                </div>
                <div class="owl-carousel team-carousel position-relative" style="padding: 0 30px;">
                    <div class="team-item">
                        <img class="img-fluid w-100" src="../img/team-1.jpg" alt="">
                        <div class="bg-light text-center p-4">
                            <h5 class="mb-3">Instructor Name</h5>
                            <p class="mb-2">Web Design & Development</p>
                            <div class="d-flex justify-content-center">
                                <a class="mx-1 p-1" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-instagram"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-item">
                        <img class="img-fluid w-100" src="../img/team-2.jpg" alt="">
                        <div class="bg-light text-center p-4">
                            <h5 class="mb-3">Instructor Name</h5>
                            <p class="mb-2">Web Design & Development</p>
                            <div class="d-flex justify-content-center">
                                <a class="mx-1 p-1" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-instagram"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-item">
                        <img class="img-fluid w-100" src="../img/team-3.jpg" alt="">
                        <div class="bg-light text-center p-4">
                            <h5 class="mb-3">Instructor Name</h5>
                            <p class="mb-2">Web Design & Development</p>
                            <div class="d-flex justify-content-center">
                                <a class="mx-1 p-1" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-instagram"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="team-item">
                        <img class="img-fluid w-100" src="../img/team-4.jpg" alt="">
                        <div class="bg-light text-center p-4">
                            <h5 class="mb-3">Instructor Name</h5>
                            <p class="mb-2">Web Design & Development</p>
                            <div class="d-flex justify-content-center">
                                <a class="mx-1 p-1" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-instagram"></i></a>
                                <a class="mx-1 p-1" href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->
        <%@ include file="footer.jsp" %>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="../lib/easing/easing.min.js"></script>
        <script src="../lib/waypoints/waypoints.min.js"></script>
        <script src="../lib/counterup/counterup.min.js"></script>
        <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="../js/main.js"></script>
    </body>

</html>