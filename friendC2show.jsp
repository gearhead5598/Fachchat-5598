    
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
        ps = cs.prepareStatement("select * from signup where Email<>?");
        ps.setString(1, em);
        rs = ps.executeQuery();
        while (rs.next()) {
            pic = rs.getString("pic");
            name = rs.getString("FirstName") + " " + rs.getString("SecondName");
            email = rs.getString("Email");
         

%>
<div class="shfrlistR1">         

    <div class="shfrlistC1">

        <img class=" navprofile shfrlisthome1" src="photoprofile/<%=pic%>" alt="">
    </div>
    <div class="shfrlistC2">
        <div class="shfrlistc21">
            <h4 class="shfrlistc21h4"><%=name%></h4>
        </div>
        <div class="shfrlistc21">
            <button class="shfrlistc21btn" onclick="sendRequest('<%=email%>')" >Send Request</button>
        </div>
        <div class="shfrlistc21"><button class="shfrlistc21btn">Remove</button></div>
    </div>


</div>

<%
    
    }

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>

<script>
 
</script>