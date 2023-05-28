<%@page import="java.sql.*" %>
<%!
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
//        String stsType = request.getParameter("ST");
        String Sts = request.getParameter("S");
        String stsname = session.getAttribute("em")+"";
//        String stsdate= request.getParameter("D");
        ps = con.prepareStatement("insert into status (Status,PostedBy) values(?,?)");
//        ps.setString(1, stsType);
        ps.setString(1, Sts);
        ps.setString(2, stsname);
//        ps.setString(3,stsdate );
        
    if (ps.executeUpdate() >= 1) {
     out.print("Data base m pahuch gya h ");
    }
    
    else{
    out.print("invalid");
    }
    }
    catch(Exception ex){
    out.print(ex);
    }
%>

