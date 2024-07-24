package com.example.demo2;

import javax.servlet.http.HttpServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/payment")
public class payment extends HttpServlet {


    public static String transaction_id;
    public static int amount;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        transaction_id = Random_id.getId();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","root1234");
            //String sql2 = "Select seat ; ";
            amount = booking.seat_no *10 ;
            String pstatus = "Confirmed";
            String pdate = request.getParameter("currentDate");
            String ptime = request.getParameter("currentTime");
            //String cancellation_id = request.getParameter(cancellation.cancellation_id);
            //String cancellation_id = "null";

            String sql = "Insert into payment values(?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,transaction_id);
            ps.setString(2, String.valueOf(amount));
            ps.setString(3,pdate);
            ps.setString(4,ptime);
            ps.setString(5,pstatus);
            ps.setString(6,null);
            int rows = ps.executeUpdate();
            if(rows>0){
                String sql1 = "Update booking set bstatus='Confirmed' where username = ?;";
                PreparedStatement ps1 = con.prepareStatement(sql1);
                ps1.setString(1,validation.username);
                response.sendRedirect("http://localhost:8080/demo2_war_exploded/bookingsuccess.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
