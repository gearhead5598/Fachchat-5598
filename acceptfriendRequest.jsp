    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps, ps1, ps2;
    ResultSet rs;
    String pic = "", name = "", date = "", coverpic = "", email = "";

%>


<%
    try {

        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
        String em = session.getAttribute("em") + "";
        String fromemail = request.getParameter("E");

        ps = cs.prepareStatement("insert into fr_accept (self_email,from_email) values(?,?)");
        ps.setString(1, em);
        ps.setString(2, fromemail);
        ps1 = cs.prepareStatement("insert into fr_accept (from_email,self_email) values(?,?)");
        ps1.setString(1, em);
        ps1.setString(2, fromemail);
        ps2 = cs.prepareStatement("Delete from fr_request where Request_from =? and Request_to=? ");
        ps2.setString(1, em);
        ps2.setString(2, fromemail);
        
        ps.executeUpdate();
        ps1.executeUpdate();
        ps2.executeUpdate();

        out.print("accepted");

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>