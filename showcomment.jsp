<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
    ResultSet rs;
    String cmt = "",name="",pic="";
%>

<%
    try {

        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
        String cmt_by = request.getParameter("E");
        String post_id = request.getParameter("PID");
        ps = cs.prepareStatement("select pc.comment , s.FirstName ,s.pic from post_comment pc , signup s where (pc.cmt_by=s.Email) and (cmt_by=? and post_id=?)");
        ps.setString(1,cmt_by);
        ps.setString(2,post_id);
     
        rs = ps.executeQuery();
        while (rs.next()) {
        cmt = rs.getString("comment");
         name = rs.getString("FirstName");
         pic = rs.getString("pic");
        
  %>
  <div style="display:flex;">
  <div style="width:40px;height:40px;border: 1px solid black;border-radius: 50%;display:flex;overflow: hidden;margin:auto;margin-left: 10px;margin-right: 5px"><img src="photoprofile/<%=pic%>" style="width: -webkit-fill-available;"></div>
  <div style="width: 40%; background: whitesmoke;padding-left:10px ;border-radius: 10px;margin:10px;">
      <h6><%=name%></h6>
      <p><%=cmt%></p>
  </div>
  </div>
  <%
        
        
        }

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>
