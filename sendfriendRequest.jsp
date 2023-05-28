    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
    ResultSet rs;
    String pic = "", name = "", date = "", coverpic = "", email = "";

%>
  

<%
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
                    String em = session.getAttribute("em") + "";
                    String toemail = request.getParameter("E");
                    String status_fr = "pending";
                    ps = cs.prepareStatement("insert into fr_request (Request_from,Request_to,Status_fr) values(?,?,?)  ");
                    ps.setString(2, em);
                    ps.setString(1,toemail);
                    ps.setString(3,status_fr);
                    ps.executeUpdate();

                   out.print("gya");

                } catch (Exception es) {
                    out.print(es.getMessage());
                }
            %>