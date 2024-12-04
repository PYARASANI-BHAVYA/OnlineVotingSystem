<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vote Successful</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f5f7fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Main Container */
        .container {
            background: rgba(255, 255, 255, 0.95);
            max-width: 500px;
            width: 90%;
            text-align: center;
            border-radius: 10px;
            padding: 30px 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        /* Success Message */
        h1 {
            font-size: 2rem;
            color: #1a73e8;
            margin-bottom: 20px;
        }

        /* Paragraph */
        p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 30px;
        }

        /* Button Style */
        button {
            display: inline-block;
            background-color: #1a73e8;
            color: #fff;
            font-size: 1rem;
            font-weight: 600;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            background-color: #0c5fcc;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
        }

        /* Footer */
        footer {
            margin-top: 20px;
            font-size: 0.8rem;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Vote Successfully !</h1>
        <p>Thank you for participating in the election. Your vote has been recorded securely.</p>
        
        <!-- Logout Button -->
        <form action="index.html" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
