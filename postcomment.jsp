<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
    ResultSet rs;
%>\

<%
    try {
    

      
        
        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
        String like_by = request.getParameter("E");
        String post_id = request.getParameter("PID");
          String comment = request.getParameter("cmt");
        
       
          
            ps = cs.prepareStatement("insert into post_comment (post_id , cmt_by, comment ) values(?,?,?)");
            ps.setInt(1,Integer.parseInt(post_id));
            ps.setString(2,like_by);
            ps.setString(3,comment);
            ps.executeUpdate();
            
        
        
        response.sendRedirect("landingpage.jsp");
       
      

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
