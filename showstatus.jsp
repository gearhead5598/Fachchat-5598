    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs, cs1;
    PreparedStatement ps, ps1;
    ResultSet rs, rs1;
    String chat, name;

%>


<%
    try {

        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
        String em = session.getAttribute("em") + "";
        ps = cs.prepareStatement("select * from status where PostedBy=?");
        ps.setString(1, em);
        while (rs.next()) {
            chat = rs.getString("Status");
           

%>
<p> <%=chat%></p>

<%
        }
        cs.close();
    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>