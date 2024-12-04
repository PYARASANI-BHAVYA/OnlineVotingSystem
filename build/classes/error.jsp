<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Container */
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
        }

        /* Heading */
        h1 {
            color: #e74c3c;
            font-size: 32px;
            margin-bottom: 20px;
        }

        /* Paragraph */
        p {
            color: #333;
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* Link */
        a {
            display: inline-block;
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
        }

        /* Link Hover Effect */
        a:hover {
            background-color: #2980b9;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Oops! Something went wrong.</h1>
        <p>We encountered an issue while processing your request. Please try again later.</p>
        <a href="index.html">Go Back to Home</a>
    </div>
</body>
</html>
