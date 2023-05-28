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
    String fname=request.getParameter("f");
    String lname=request.getParameter("l");
    String email=request.getParameter("e");
    String password=request.getParameter("p");
    
    ps=con.prepareStatement("insert into signup (FirstName,SecondName,Email,Password,pic) values(?,?,?,?,?)");
    ps.setString(1, fname);
    ps.setString(2, lname);
    ps.setString(3, email);
    ps.setString(4, password);
    ps.setString(5,"pic");
    if(ps.executeUpdate()>=1){
    out.print("Congratulation");
    }
    else{
    out.print("OOPS! Somthing wrong");
    }

        
    }
    

catch(Exception ex){
    
    }

%>