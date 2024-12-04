<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>

        <h2>Manage Candidates</h2>
        <form action="admin" method="post">
            <input type="hidden" name="action" value="addCandidate">
            <label for="candidateName">Candidate Name:</label>
            <input type="text" id="candidateName" name="candidateName" required><br><br>
            
            <button type="submit">Add Candidate</button>
        </form>

        <h3>Existing Candidates</h3>
        <table border="1">
            <tr>
                <th>Candidate Name</th>
            </tr>
            <%
                List<String> candidates = (List<String>) request.getAttribute("candidates");
                if (candidates != null) {
                    for (String candidate : candidates) {
            %>
                        <tr>
                            <td><%= candidate %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td>No candidates available</td>
                    </tr>
            <%
                }
            %>
        </table>
        
        <a href="index.html">Logout</a>
    </div>
</body>
</html>
