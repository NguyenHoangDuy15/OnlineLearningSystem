<%-- 
    Document   : viewownerbloglist
    Created on : Mar 6, 2025, 7:45:57 PM
    Author     : THU UYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Model.Blog" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edukate - Online Education Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <head>
        <style>
            /* Chỉnh lại giao diện */
            .container {
                max-width: 900px;
                margin: 20px auto;
                text-align: center;
            }

            h3 {
                color: #153e7a;
                text-align: center;
                margin-bottom: 20px;
            }

            .create-btn {
                display: inline-block;
                background-color: #0056b3;
                color: white;
                padding: 10px 20px;
                border-radius: 10px;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .create-btn:hover {
                background-color: #003d80;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #8fb9f5;
            }

            .btn {
                padding: 5px 15px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
                font-weight: bold;
            }

            .edit-btn {
                background-color: #007bff;
                color: white;
            }

            .edit-btn:hover {
                background-color: #0056b3;
            }

            .delete-btn {
                background-color: #dc3545;
                color: white;
            }

            .delete-btn:hover {
                background-color: #a71d2a;
            }
        </style>
    </head>

    <body>
        <%@ include file="header.jsp" %>
        <h3 style="color: #153e7a;">List of Blogs</h3>

        <div class="container">
            <a href="CreateBlogServlet" class="create-btn">Create New Blog</a>

            <table>
                <tr>
                    <th>Blog ID</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>

                <c:if test="${ blogs != null}">
                    <c:forEach var="b" items="${blogs}">
                        <tr>
                            <td>${b.blogID}</td>
                            <td>${b.blogTitle}</td>
                            <td>${b.blogDetail}</td>
                            <td>${b.blogDate}</td>
                            <td>
                                <a href="EditBlogServlet?id=${b.blogID}" class="btn edit-btn">Edit</a>
                                <a href="DeleteBlogServlet?id=${b.blogID}" class="btn delete-btn" onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:if test="${ blogs == null}">
                    <tr>
                        <td colspan="5">No blogs found.</td>
                    </tr>
                </c:if>

            </table>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
