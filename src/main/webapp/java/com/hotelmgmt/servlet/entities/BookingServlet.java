package com.hotelmgmt.servlet.entities;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String roomId = request.getParameter("roomId");
        String userId = request.getSession().getAttribute("userId").toString();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_mgmt", "root", "password")) {
            String query = "INSERT INTO bookings (user_id, room_id, booking_date) VALUES (?, ?, CURDATE())";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(userId));
            stmt.setInt(2, Integer.parseInt(roomId));
            stmt.executeUpdate();

            response.sendRedirect("dashboard.jsp?message=Booking Successful");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
