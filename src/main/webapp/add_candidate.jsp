<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Candidate</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>Add Candidate</h1>
    </header>
    <div class="container">
        <form action="admin" method="post">
            <input type="hidden" name="action" value="addCandidate">
            <label for="name">Candidate Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="partyName">Party Name:</label>
            <input type="text" id="partyName" name="partyName" required>
            <label for="logoUrl">Party Logo URL:</label>
            <input type="text" id="logoUrl" name="logoUrl" required>
            <button type="submit">Add Candidate</button>
        </form>
        <a href="admin_dashboard.jsp"><button>Back to Dashboard</button></a>
    </div>
</body>
</html>
