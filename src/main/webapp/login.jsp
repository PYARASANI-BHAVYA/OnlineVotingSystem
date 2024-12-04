<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Online Voting System</title>
    <style>
        /* Reset default styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Full-screen background image */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/voting-background.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #333;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* Header styling */
        header {
            position: absolute;
            top: 20px;
            width: 100%;
            text-align: center;
            color: black;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }

        header h1 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Container for the login form */
        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-size: 22px;
            margin-bottom: 20px;
            color: #2980b9;
        }

        form {
            margin-bottom: 20px;
        }

        /* Buttons styling */
        .login-btn, .back-btn {
            background-color: #2980b9;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 15px 35px;
            border: none;
            border-radius: 5px;
            margin: 10px 0;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .login-btn:hover, .back-btn:hover {
            background-color: #3498db;
            transform: translateY(-3px);
        }

        .back-btn {
            background-color: #16a085;
        }

        a {
            text-decoration: none;
        }

        /* Footer section */
        footer {
            margin-top: 20px;
            font-size: 14px;
            color: #7f8c8d;
        }

        footer a {
            color: #2980b9;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Top Header -->
    <header>
        <h1>Welcome to the Online Voting System</h1>
    </header>

    <!-- Login Form Section -->
    <div class="login-container">
        <h2>Please Log In</h2>

        <!-- User login form -->
        <form action="user_login.jsp" method="post">
            <button type="submit" class="login-btn">User Login</button>
        </form>

        <!-- Admin login form -->
        <form action="admin_login.jsp" method="post">
            <button type="submit" class="login-btn">Admin Login</button>
        </form>

        <!-- Back to Home Button -->
        <a href="index.html"><button class="back-btn">Back to Home</button></a>
    </div>

    <!-- Footer -->
   

</body>
</html>
