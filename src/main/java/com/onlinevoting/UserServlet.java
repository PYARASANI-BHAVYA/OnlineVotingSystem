package com.onlinevoting;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Handle Registration
        if ("register".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = "voter"; // Default role is 'voter'

            // You can set 'admin' role for a specific email, for example
            if (email.equals("admin@gmail.com")) {
                role = "admin"; // Assign admin role for a specific email
            }

            try (Connection conn = DatabaseConnection.getConnection()) {
                String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, password);
                stmt.setString(4, role); // Insert the role into the table

                int result = stmt.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("register_success.html?success=Registration successful");
                } else {
                    response.sendRedirect("register.jsp?error=Registration failed");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("register.jsp?error=Database error");
            }
        } 
        // Handle Login
        else if ("login".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            try (Connection conn = DatabaseConnection.getConnection()) {
                String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, email);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("role", rs.getString("role")); // Store the role in the session

                    String role = rs.getString("role");
                    if ("admin".equals(role)) {
                        response.sendRedirect("admin_dashboard.jsp");  // Redirect to admin dashboard
                    } else {
                        response.sendRedirect("voter_dashboard.jsp");  // Redirect to voter dashboard
                    }
                } else {
                    response.sendRedirect("login.jsp?error=Invalid credentials");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp?error=Database error");
            }
        }
    }
}
