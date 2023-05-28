<%@page import = "java.sql.*" %>

<%!
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
%>

<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
    String email=request.getParameter("e");
    String password=request.getParameter("p");
    String sts = "valid";
    ps=con.prepareStatement("update  signup set status=? where Email=? and Password=?");
     ps.setString(1, sts);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.executeUpdate();
    ps=con.prepareStatement("select * from signup  where Email=? and Password=?");
    ps.setString(1, email);
    ps.setString(2, password);
    rs=ps.executeQuery();
    if(rs.next()){
      rs.close();
      session.setAttribute("em",email);
      out.print("valid");

    }
    else{
    rs.close();
    out.print("Invalid password");
    }

        
    }
    

catch(Exception ex){
    out.print(ex.getMessage());
    }

%>