package com.example.demo2;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet({"/booking"})
public class booking extends HttpServlet {
    //public static String username;
    public static int seat_no;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root1234");
            String booking_id = Random_id.getId();
            String movieName = request.getParameter("movies");
            seat_no = Integer.parseInt(request.getParameter("seats"));
            HttpSession session1 = request.getSession();
            session1.setAttribute("seat_no",seat_no);
            String showtime = request.getParameter("time");
            String showdate = request.getParameter("dates");
            String bstatus = "Pending";
            String blocation = request.getParameter("theaters");
            String username = validation.username;
            String sql = "Select movieid from movie where movieName =? and location =?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,movieName);
            ps.setString(2,blocation);
            ResultSet rs = ps.executeQuery();
            String movieid = null;
            if(rs.next()) {
                movieid = rs.getString(1);
            }
            String transaction_id = null;
            String sql1 = "Insert into booking values(?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setString(1,booking_id);
            ps1.setString(2, String.valueOf(seat_no));
            ps1.setString(3,showdate);
            ps1.setString(4,showtime);
            ps1.setString(5,bstatus);
            ps1.setString(6,blocation);
            ps1.setString(7,username);
            ps1.setString(8,movieid);
            ps1.setString(9,transaction_id);
            int rows = ps1.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("payment.jsp");
            }
            else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please enter valid Details');");
                out.println("window.location='UserHome.jsp';</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
