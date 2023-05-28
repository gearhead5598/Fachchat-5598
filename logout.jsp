<%@page import = "java.sql.*" %>

<%!
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
        String email = session.getAttribute("em")+"";        
        String sts = "invalid";
        ps = con.prepareStatement("update  signup set status=? where Email=? ");
        ps.setString(1, sts);
        ps.setString(2, email);
      
        ps.executeUpdate();
    }
        catch(Exception ex){
    out.print(ex.getMessage());
    }

%>
<%    session.invalidate();
    response.sendRedirect("login.jsp");
%>