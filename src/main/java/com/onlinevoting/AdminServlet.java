package com.onlinevoting;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean validAdmin = false;

        try {
            // Establish a connection to the database
            conn = DatabaseConnection.getConnection();

            // Query to check for admin credentials
            String query = "SELECT * FROM users WHERE email = ? AND password = ? AND role = 'admin'";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                // Valid admin credentials
                validAdmin = true;
                // Create session for the admin
                HttpSession session = request.getSession();
                session.setAttribute("adminId", rs.getInt("id"));
                session.setAttribute("adminName", rs.getString("name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error occurred while connecting to the database.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (validAdmin) {
            // Redirect to the admin dashboard if login is successful
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            // Send back an error if login fails
            request.setAttribute("error", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to login page on GET request (to avoid showing login form in URL)
        response.sendRedirect("admin_login.jsp");
    }
}
