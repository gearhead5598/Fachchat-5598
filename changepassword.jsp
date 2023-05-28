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
    String oldpws=request.getParameter("oldP");
    String newpws=request.getParameter("pws");
    
    ps=con.prepareStatement("update  signup set Password=? where  Password=?");
    ps.setString(1, newpws);
    ps.setString(2, oldpws);
    
     if(ps.executeUpdate()>=1)
    {
        out.print("Succesfully Changed");
    }
    else
    {
        out.print("Record cannot be updated");
    }  
    }
    

catch(Exception ex){
    out.print(ex.getMessage());
    }

%>