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
        
        ps = cs.prepareStatement("select * from post_like where  like_by=? and post_id=?");
        ps.setString(1,like_by);
        ps.setInt(2,Integer.parseInt(post_id));
        rs= ps.executeQuery();
        if(rs.next()){
            rs.close();
            ps = cs.prepareStatement("delete from post_like where post_id=? and  like_by=?");
            ps.setInt(1,Integer.parseInt(post_id));
            ps.setString(2,like_by);
            ps.executeUpdate();
        }
        else{
            rs.close();
            ps = cs.prepareStatement("insert into post_like (post_id , like_by ) values(?,?)");
            ps.setInt(1,Integer.parseInt(post_id));
            ps.setString(2,like_by);
            ps.executeUpdate();
        }
        
        response.sendRedirect("landingpage.jsp");
       
      

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
