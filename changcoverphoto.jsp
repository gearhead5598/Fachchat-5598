<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
%>

<%
    try {
    

        String path = request.getServletContext().getRealPath("photoprofile");
        MultipartRequest ob = new MultipartRequest(request, path);
        out.println("saved");
        
        String em = session.getAttribute("em")+"";
        String filename = em+"_"+ob.getOriginalFileName("img2");
        
        File file1 = new File(path+"/"+ob.getOriginalFileName("img2"));
        File file2 = new File(path+"/"+filename);
        file1.renameTo(file2);
        
        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
        
        ps = cs.prepareStatement("update signup set coverpic = ? where Email=?");
        ps.setString(1, filename);
        ps.setString(2, em);
        ps.executeUpdate();
        response.sendRedirect("username.jsp");
        

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
