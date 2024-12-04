package com.onlinevoting;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String candidateId = request.getParameter("candidate_id");
        
        // Check if candidate was selected
        if (candidateId == null || candidateId.isEmpty()) {
            response.sendRedirect("voter_dashboard.jsp?error=Please select a candidate.");
            return;
        }
        
        // Get user ID (for simplicity, assuming user ID is 1)
        int userId = 1; // This should be retrieved from session or other user identification mechanism
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "INSERT INTO votes (user_id, candidate_id) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId); // Set the user ID
            stmt.setInt(2, Integer.parseInt(candidateId)); // Set the candidate ID
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                // Redirect to success page if vote is recorded
                response.sendRedirect("vote_success.jsp");
            } else {
                response.sendRedirect("voter_dashboard.jsp?error=Error recording your vote. Please try again.");
            }
            
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("voter_dashboard.jsp?error=Error recording your vote. Please try again.");
        }
    }
}
