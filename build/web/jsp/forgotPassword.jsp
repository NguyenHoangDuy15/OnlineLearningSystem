
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="../css/login.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h2>Change Password</h2>
            <form action="RegisterServlet" method="post">
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="username" placeholder="User name" required>
                <input type="newpassword" name="newpassword" placeholder="New Password" required>
                <input type="repassword" name="repassword" placeholder="Re-Password" required>
                <button type="submit">Change</button>
            </form>
        </div>
    </body>
</html>
