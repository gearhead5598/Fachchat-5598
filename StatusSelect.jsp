
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
    ResultSet rs;
    String pic ="",name ="",date="",coverpic="";
    
%>

<%
    try {
    
        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro","root","");
        String em = session.getAttribute("em")+"";
        ps = cs.prepareStatement("select * from signup where Email = ? ");
        ps.setString(1, em);
       rs = ps.executeQuery();
       rs.next();
       pic = rs.getString("pic");
       coverpic = rs.getString("coverpic");
       name = rs.getString("FirstName")+" "+rs.getString("SecondName");
        
        

    } catch (Exception es) {
        out.print(es.getMessage());
    }
%>















<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="StsSelectandWrite.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script type="text/javascript">
        function sendStsWritepage(){
            window.location="StatusWrite.jsp";
           
           
        }
        
        function sendStsLanding(){
            
            window.location="landingpage.jsp";
        }
        
        
        
        
    </script>
    
</head>

<body>
    
    <div class="subStsR1">
        <div class="subStsc1">
            <div class="C1btn"><button onclick="sendStsLanding()" class="C1close">Close</button></div>
            <div class="C1heading">
                <h2>Your Story</h2>
                <button class="C1headSetting">Setting</button>
            </div>
            <div class="C1profile">
                <div class="c1userProfile">
                    <img class=" statusprofile" src="photoprofile/<%=pic%>" alt="">
                </div>
                <h3 class="C1username"><%=name%></h3>
            </div>
        </div>
        <div class="subStsc2">
            <div class="StsSelectType">
                <div class="StsVideo">
                    <h3>Create a video story</h3>
                </div>
                <div class="StsText  StstextSelect" onclick="sendStsWritepage()">
                    <h3>  Create a text story</h3>
                    <option value="Text" id="StsType"></option>
                </div>
            </div>
        </div>
    </div>
</body>

</html>