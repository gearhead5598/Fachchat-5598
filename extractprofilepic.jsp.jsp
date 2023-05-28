<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
%>

<%
    try {
    

    
        
        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
        
        ps = cs.prepareStatement("update signup set pic = ? where email=?");
       
        ps.executeUpdate();
        response.sendRedirect("username.jsp");
        

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
