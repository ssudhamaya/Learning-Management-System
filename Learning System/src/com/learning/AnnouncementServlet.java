package com.learning;

import db.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Announcement")
public class AnnouncementServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con=DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("INSERT INTO msgs(msg,lid) VALUES(?,?)");
            ps.setString(1, request.getParameter("msg"));
            ps.setString(2, session.getAttribute("id").toString());
            ps.executeUpdate();
            con.close();
            session.setAttribute("msg", "Announcement done successfully..!!");
            response.sendRedirect("lecturer/announcement.jsp");
        } catch (Exception ex) {
            System.err.println("Error " + ex.getMessage());
        }
    }

}
