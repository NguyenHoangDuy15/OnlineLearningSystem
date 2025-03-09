<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Edukate - Online Education</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        .sidebar {
            width: 15%;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #f8f9fa;
            padding: 15px;
            overflow-y: auto;
        }
        .content {
            margin-left: 15%;
            padding: 20px;
        }
        .video-container {
            text-align: center;
            margin-top: 20px;
        }
        .video-container iframe {
            width: 80%;
            height: 500px;
        }
    </style>

    <script>
        function changeVideo(videoUrl) {
            if (videoUrl.includes("watch?v=")) {
                videoUrl = videoUrl.replace("watch?v=", "embed/");
            }
            document.getElementById("videoFrame").src = videoUrl;
            document.getElementById("videoFrame").style.display = "block";
            document.getElementById("testContainer").style.display = "none";
        }

        function showTest(testId) {
            document.getElementById("videoFrame").style.display = "none";
            document.getElementById("testContainer").innerHTML = `
                <h3>Bài kiểm tra</h3>
                <a href="test?testId=` + testId + `" class="btn btn-primary">Làm bài kiểm tra</a>
            `;
            document.getElementById("testContainer").style.display = "block";
        }
    </script>
</head>

<body>
    <%@ include file="header.jsp" %>

    <div class="sidebar">
        <h4 class="text-secondary">Course Content</h4>
        <ul class="list-unstyled">
            <c:choose>
                <c:when test="${not empty lessonsAndTests}">
                    <c:forEach var="lesson" items="${lessonsAndTests}">
                        <li>
                            <i class="fas ${lesson.type == 'Lesson' ? 'fa-book' : 'fa-file-alt'}"></i>
                            <c:choose>
                                <c:when test="${lesson.type == 'Lesson'}">
                                    <a href="#" class="text-dark" onclick="changeVideo('${lesson.content}')">${lesson.name}</a>
                                </c:when>
                                <c:when test="${lesson.type == 'Test'}">
                                    <a href="#" class="text-dark" onclick="showTest('${lesson.id}')">${lesson.name}</a>
                                </c:when>
                            </c:choose>
                        </li>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <li>No lessons or tests found.</li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <div class="content">
        <div class="video-container">
            <c:choose>
                <c:when test="${not empty lessonsAndTests}">
                    <c:set var="firstLesson" value="${lessonsAndTests[0]}" />
                    <c:choose>
                        <c:when test="${firstLesson.type == 'Lesson'}">
                            <iframe id="videoFrame" 
                                    src="${not empty firstLesson.content ? firstLesson.content.replace('watch?v=', 'embed/') : ''}" 
                                    frameborder="0" allowfullscreen>
                            </iframe>
                            <div id="testContainer" style="display: none;"></div>
                        </c:when>
                        <c:when test="${firstLesson.type == 'Test'}">
                            <div id="testContainer">
                                <h3>${firstLesson.name}</h3>
                                <a href="test?testId=${firstLesson.id}" class="btn btn-primary">Làm bài kiểm tra</a>
                            </div>
                            <iframe id="videoFrame" style="display: none;"></iframe>
                        </c:when>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <iframe id="videoFrame" src="" frameborder="0" allowfullscreen></iframe>
                    <div id="testContainer" style="display: none;"></div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
