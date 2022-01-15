/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet("/DelSub")
public class DelSubjectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subid=req.getParameter("subid");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("DELETE FROM subjects WHERE subid=?");
            ps.setString(1,subid);
            ps.executeUpdate();
con.close();            
            session.setAttribute("msg", "Student Removed Successfully..!");
            resp.sendRedirect("admin/subjects.jsp");            
        }
        catch(Exception ex){
            System.err.println("Error "+ex.getMessage());
        }
    }
    
}
