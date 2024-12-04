<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.onlinevoting.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Dashboard</title>
    <link rel="stylesheet" href="styles.css"> <!-- External CSS for styling -->
</head>
<body>
    <header>
        <h1>Welcome to the Online Voting System</h1>
    </header>

    <div class="container">
        <h2>Select Your Candidate</h2>

        <form action="vote" method="post">
            <div class="candidate-list">
                <%
                    // Fetch candidates from the database
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String query = "SELECT * FROM candidates";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        boolean hasCandidates = false;

                        // Iterate through the candidates
                        while (rs.next()) {
                            hasCandidates = true;

                            // Retrieve candidate details and logo
                            String candidateName = rs.getString("name");
                            String partyName = rs.getString("party_name");
                            String logoFile = rs.getString("logo_url");
                            String logoPath = (logoFile != null && !logoFile.isEmpty()) 
                                              ? "images/" + logoFile 
                                              : "images/default.png";  // Fallback image

                            // Display candidate options with their logos and buttons
                            out.println("<div class='candidate'>");
                            out.println("<input type='radio' name='candidate_id' value='" + rs.getInt("id") + "' required>");
                            out.println("<label for='candidate_id'>" + candidateName + " (" + partyName + ")</label>");
                            out.println("<br><img src='" + logoPath + "' alt='" + partyName + " Logo' class='candidate-logo'>");
                            out.println("<button type='submit' class='vote-btn'>Vote</button>");
                            out.println("</div>");
                        }

                        // Handle case where no candidates are available
                        if (!hasCandidates) {
                            out.println("<p>No candidates available at the moment. Please try again later.</p>");
                        }

                        // Close the result set and statement
                        rs.close();
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error retrieving candidates. Please try again later.</p>");
                    }
                %>
            </div>
        </form>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Online Voting System. All Rights Reserved.</p>
    </footer>
</body>
</html>
