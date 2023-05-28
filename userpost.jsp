<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
%>

<%
    try {
    

        String path = request.getServletContext().getRealPath("postPhotos");
        MultipartRequest ob = new MultipartRequest(request, path);
        out.println("saved");
        
        String em = session.getAttribute("em")+"";
        String filename = em+"_"+ob.getOriginalFileName("postimg");
        String caption = "Hello its my first post";
        File file1 = new File(path+"/"+ob.getOriginalFileName("postimg"));
        File file2 = new File(path+"/"+filename);
        file1.renameTo(file2);
        
        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
        
        ps = cs.prepareStatement("insert into userpost (caption , userpost , user_email) values(?,?,?)");
        ps.setString(1, caption);
        ps.setString(2, filename);
        ps.setString(3, em);
        ps.executeUpdate();
        response.sendRedirect("landingpage.jsp");
      

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
