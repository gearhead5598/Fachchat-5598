
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>


<%!
    Connection cs;
    PreparedStatement ps;
    ResultSet rs;
    String pic = "", name = "", date = "", coverpic = "", email = "";

%>

<%
    try {

        Class.forName("com.mysql.jdbc.Driver");
        cs = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
        String em = session.getAttribute("em") + "";
        ps = cs.prepareStatement("select * from signup where Email = ? ");
        ps.setString(1, em);
        rs = ps.executeQuery();
        rs.next();
        pic = rs.getString("pic");
        coverpic = rs.getString("coverpic");
        name = rs.getString("FirstName") + " " + rs.getString("SecondName");

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
    <link rel="stylesheet" href="mainfile.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        *{
          margin: 0px;
          padding: 0px;
        }
        .reelmain {
            width: 100%;
            display: flex;
        }

        .reel_R1 {
            width: 50%;
            margin: auto;
            height: 90vh;
        
            display: flex;
        }

        .reelC-1 {
            width: 20%;
          
            display: flex;
        }

        .reelc1label {
            margin: auto;
            display: flex;
            background: whitesmoke;
            border-radius: 50%;
            width: 50px;
            height: 50px;
           
        }

        .reelC-2 {
            width: 60%;
            border:1px solid black;
        }

        .reelC-3 {
            width: 20%;
            display: flex;
            justify-content: end;
        }

        .reelC-2nav {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-top: 5%;

        }

        .reelc2img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 1px solid black;
            margin-right: 10px;
            margin: auto;
            margin-left: 10px;
            margin-right: 0px;
        }

        .reelc2username {
            margin: auto;
            margin-left: 10px;
        }

        .reelC-2innernav1 {
            display: flex;
            width: 40%;
        }

        .reelC-2innernav2 {
            display: flex;
        }

        .reelc31 {
            width: 60%;
            flex-direction: column;
            display: flex;
            justify-content: end;

        }

        .reelc31icon {
            width: 40%;
            margin: auto
        }

        .reelc31label {
            display: flex;
            background: whitesmoke;

            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-bottom: 25%;
        }
    </style>
</head>

<body>
     <div class="mainFr1">
            <div class="submainFc1">
                <label class="Fc1logo"><img class="mainlogo" src="icon/facebook.png" alt=""></label>
                <input type="search" value="search here" id="submainFc1search" class="Fc1search">
            </div>
            <div class="submainFc2">
                <label class="Fc2Label"><img class="navicons" src="icon/house.png" alt=""></label>
                <label class="Fc2Label" onclick=" video()"><img class="navicons" src="icon/youtube-logo.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/shopping-cart.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/people.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/house.png" alt=""></label>
            </div>
            <div class="submainFc3">
                <label class="Fc3massenger"><img class=" navicon1" src="icon/comment.png" alt=""></label>
                <label class="Fc3notification"><img class=" navicon1" src="icon/bell.png" alt=""></label>
            </div>
            <div class=" Fc3profile2"><img class=" navprofile" src="photoprofile/<%=pic%>" alt=""></div>

        </div>
    <div class="reelmain">
        <div class="reel_R1">
            <div class="reelC-1">
                <label class="reelc1label"><img src="icon/back.png" alt="" class="reelc31icon"></label>

            </div>
            <div class="reelC-2">
                <div class="reelC-2nav">
                    <div class="reelC-2innernav1">
                        <div class="reelc2img"></div>
                        <p class="reelc2username">Husain</p>
                    </div>
                    <div class="reelC-2innernav2">
                        <div class="reelc2img"></div>

                    </div>
                </div>
            </div>
            <div class="reelC-3">
                <div class="reelc31">
                    <label class="reelc31label"><img src="icon/next.png" alt="" class="reelc31icon"></label>
                    <label class="reelc31label"><img src="icon/heart.png" alt="" class="reelc31icon"></label>
                    <label class="reelc31label"><img src="icon/comment.png" alt="" class="reelc31icon"></label>
                    <label class="reelc31label"><img src="icon/share.png" alt="" class="reelc31icon"></label>
                </div>
            </div>
        </div>
    </div>
</body>

</html>