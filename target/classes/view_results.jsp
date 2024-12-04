<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.onlinevoting.DatabaseConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Election Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>Election Results</h1>
    </header>
    <div class="container">
        <h2>Results</h2>
        <table border="1" cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>Candidate Name</th>
                    <th>Party Name</th>
                    <th>Votes</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String query = "SELECT c.name, c.party_name, COUNT(v.id) AS vote_count " +
                                       "FROM candidates c LEFT JOIN votes v ON c.id = v.candidate_id " +
                                       "GROUP BY c.id";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("name") + "</td>");
                            out.println("<td>" + rs.getString("party_name") + "</td>");
                            out.println("<td>" + rs.getInt("vote_count") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="admin_dashboard.jsp"><button>Back to Dashboard</button></a>
    </div>
</body>
</html>
