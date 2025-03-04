
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
        <link href="../css/login.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h2>Login</h2>
            <form action="LoginServlet" method="post">
                <input type="text" name="username" placeholder="User name" required>
                <input type="password" name="password" placeholder="Password" required>
                <a href="/LearningOnlineSystem/jsp/forgotPassword.jsp">Forgot password</a>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
