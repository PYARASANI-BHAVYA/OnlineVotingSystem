<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>Online Voting System</h1>
    </header>
    <div class="container">
        <h2>User Login</h2>
        <form action="user" method="post">
            <input type="hidden" name="action" value="login">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        
        <%
            String error = request.getParameter("error");
            if (error != null) {
                out.println("<p style='color:red;'>" + error + "</p>");
            }
        %>
        
        <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
    </div>
</body>
</html>
