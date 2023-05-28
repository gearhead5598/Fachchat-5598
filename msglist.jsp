    
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
        ps = cs.prepareStatement("select fr_accept.from_email,signup.FirstName,signup.SecondName,signup.pic from signup ,fr_accept where signup.Email=fr_accept.from_email and fr_accept.self_email=?");
        ps.setString(1, em);
        rs = ps.executeQuery();

        while (rs.next()) {
        email=rs.getString("from_email");
        pic = rs.getString("pic");
            name = rs.getString("FirstName") + " " + rs.getString("SecondName");
%>
<div class="msg-R1"onclick="chatsection('<%=email%>')">
    <div class="msg-C1">
        <img src="photoprofile/<%=pic%>" >
    </div>
    <div class="msg-C2"><%=name%></div>
</div>

<%
        }

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>