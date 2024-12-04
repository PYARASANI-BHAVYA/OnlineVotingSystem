<%@ page import="java.sql.*" %>
<%@ page import="com.onlinevoting.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Election Results</h1>
        <table>
            <thead>
                <tr>
                    <th>Candidate Name</th>
                    <th>Votes Received</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        conn = DatabaseConnection.getConnection(); // Ensure this line works correctly
                        String query = "SELECT candidate_name, COUNT(*) AS votes FROM votes GROUP BY candidate_name";
                        pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("candidate_name") %></td>
                                <td><%= rs.getInt("votes") %></td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                %>
                        <tr>
                            <td colspan="2">Error: <%= e.getMessage() %></td>
                        </tr>
                <%
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
                        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
                    }
                %>
            </tbody>
        </table>
        <a href="index.html">Back to Home</a>
    </div>
</body>
</html>
