    
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
        String chat_to = request.getParameter("CT");
        ps = cs.prepareStatement("select m.chat , s.FirstName from signup s, messanger m where s.Email=m.chat_from and ( (chat_from=? and chat_to=?) or (chat_from=? and chat_to=?))");
        ps.setString(1, em);
        ps.setString(2, chat_to);

        ps.setString(4, em);
        ps.setString(3, chat_to);
        rs = ps.executeQuery();

        while (rs.next()) {
            chat = rs.getString("chat");
            name = rs.getString("FirstName");

%>
<p><%=name%> :- <%=chat%></p>

<%
        }
        cs.close();
    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>