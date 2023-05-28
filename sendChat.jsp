    
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
        String chat_to = request.getParameter("CT");
        String chat = request.getParameter("C");
        ps = cs.prepareStatement("insert into messanger (chat_from,chat_to,chat) values(?,?,?)");
        ps.setString(1, em);
        ps.setString(2, chat_to);
        ps.setString(3, chat);
        ps.executeUpdate();

        out.print("msg gya");
    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>

<script>

</script>