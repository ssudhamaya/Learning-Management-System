<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="db.DbConfig,java.sql.*" %>
<%
    response.setContentType("application/pdf");
    response.setHeader("content-disposition", "inline;filename=Donation Report.pdf");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h3 class="text-center" style="text-align: center;background-color: orange;">Students</h3>
        <div class="container">
            <table class="table table-bordered table-sm table-striped">
                <thead>
                    <tr>
                        <th style="width:100px;">Roll no</th>
                        <th style="width:200px">Student Name</th>    
                        <th>City</th>
                        <th>Gender</th>
                        <th>Class</th>                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DbConfig.connect();
                        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM student");
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("rollno")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("city")%></td>
                        <td><%= rs.getString("gender")%></td>
                        <td>
                            <%
                                Map<String, String> cls = DbConfig.findSingle("class", "cid='" + rs.getString("class") + "'");
                            %><%= cls.get("cname")%></td>                        
                    </tr>

                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
