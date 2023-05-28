
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
                margin: 0%;
                padding: 0%;
                box-sizing: border-box;
            }
            .friendR1{
                width: 100%;
                display: flex;

            }
            .friendC1{
                width: 30%;
                box-shadow: 1px 0px 5px #7a7474;
                height: 100vh;
            }
            .friendC2{
                width: 70%;
            }
            .friendc11{
                display: flex;
                justify-content: space-between;
                margin-top: 5%;

            }

            .friendc11img{
                width: 10%;
                margin-right: 10px;
                cursor: pointer;
            }
            .friendc12{
                display: flex;
                flex-direction: column;
            }

            .postc32video{
                margin: 5% 0px 5% 0px;
                border-bottom: 1px solid black;
                border-top: 1px solid black;
            }
            .postc32video>p{
                margin: auto;
                margin-left: 10px;
            }
            .postc32cmt{
                border-top: none;
            }
            .postbtnvideo{
                width: 35%;
            }
            .postcmtvideo{
                width: 60%;
            }
            .postc33video{
                height:200px;
            }

            /*        here the second part of css jaha list shoe hogi */


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




        <div class="friendR1">
            <div class="friendC1">
                <div class="friendc11">
                    <div style="width: 50%;display: flex;padding-left: 10px;">
                        <div class="postc111"><img src="photoprofile/<%=pic%>"></div>
                        <div class="postc112">
                            <p>  <%=name%></p>
                        </div>
                    </div>
                    <img class="friendc11img" src="icon/settings.png" alt="">
                </div>
                <div class="postc32 postc32video">

                    <button class="postbtns postbtnvideo" > <span><img src="icon/heart.png" class="postbtnicons"  ></span> Like</button>
                    <input type="hidden" value="" />
                    <button class="postbtns postbtnvideo"   > <span> <img src="icon/comment.png" class="postbtnicons" ></span>  comment</button>
                    <button class="postbtns postbtnvideo"> <span><img src="icon/share.png" class="postbtnicons" ></span>  share</button>
                </div>

                <div class="postc32 postc32video postc32cmt ">
                    <p>Comments</p>
                    <button class="postbtns">Hide</button>
                </div>
                <div class="friendc12">

                        <div class="postc33 postc33video">

                        </div>
                        <div class="postc34">
                            <input type="text" class="postcomt postcmtvideo" placeholder="Enter your comment here"  >
                            <button class=" postbtn-c34video" style="width:15%;" >send</button>
                        </div>
                </div>
            </div>



            <div class="friendC2" id="friendacceptC2show">




            </div>


        </div>
    </body>
    <script>


        function home() {
            window.location = "friends.jsp";
        }

    </script>
</html>
