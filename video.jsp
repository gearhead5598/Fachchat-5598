
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
            .friendc11>h3{
                margin: auto;
                margin-left: 10px;
                cursor: default;
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
            .friendc12label{
                margin-top:5% ;
                margin-left: 10px;
                display: flex;
                padding:5px ;
            }
            .friendc12label:hover{
                background-color: #7a7474;
            }

            .friendc12h4{
                margin: auto;
                margin-left: 20px;
                cursor: pointer;
                font-size: 1.2rem;
            }
            .friendc12labelimg{
                width: 10%;
            }



            /*        here the second part of css jaha list shoe hogi */
            .shfrlistR1{
                margin: 3%;
                padding-bottom: 5px;
                border-radius: 10px;
                box-shadow: 0px 0px 5px;
                width: 25%



            }
            .shfrlistC1{
                width: 100%;
                height: 200px;
                overflow: hidden;
                margin-bottom: 2%;

            }
            .shfrlistC2{
                width: 90%;
                display: flex;

                flex-direction: column;
                margin: auto;
            }
            .shfrlistc21{

            }
            .shfrlistc21h4{
                margin-bottom: 0%;
                font-size: 1rem;
            }
            .shfrlistc21btn{
                width: 100%;
                margin-top: 3%;
                padding: 10px;
                background-color: black;
                color: white;
                border-radius: 10px;
                border: 1px solid white;
                cursor: pointer;
            }
            .shfrlistc21btn:hover{
                background-color: rgb(44, 43, 43);

            }
            .shfrlisthome1{
                border-radius: 10px;
            }
            .searchvideos{
                width: 100%;
              
                display: flex;
                justify-content: center;
                padding: 10px;
            }
            .searchvidinput{
                border: 1px solid black;
                padding: 5px;
                width: 70%;
                border-radius: 10px;
                color: black;
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




        <div class="friendR1">
            <div class="friendC1">
                <div class="friendc11">
                    <h3>Watches</h3>
                    <img class="friendc11img" src="icon/settings.png" alt="">
                </div>
                <div class="searchvideos"><input type="text" placeholder="search videos" class="searchvidinput"></div>
                <div class="friendc12">
                    <label for="" class="friendc12label">
                        <img class="friendc12labelimg"  src="icon/friends.png" alt="">
                        <h4 class="friendc12h4" >Home</h4>
                    </label>
                    <label for="" class="friendc12label">
                        <img class="friendc12labelimg"  src="icon/add-friend.png" alt="">
                        <h4 class="friendc12h4" >Live</h4>
                    </label>
                    <label for="" class="friendc12label" onclick="reel()"  >
                        <img class="friendc12labelimg"  src="icon/add-user.png" alt="">
                        <h4 class="friendc12h4"  >Reel</h4>
                    </label>
                    <label for="" class="friendc12label">
                        <img class="friendc12labelimg"  src="icon/friend.png" alt="">
                        <h4 class="friendc12h4">Shows</h4>
                    </label>
                    <label for="" class="friendc12label">
                        <img class="friendc12labelimg"  src="icon/cake.png" alt="">
                        <h4 class="friendc12h4">Saved</h4>
                    </label>
                </div>
            </div>



            <div class="friendC2" id="friendacceptC2show">

 <div class="post-R1"style="width:80%;margin:auto;margin-top:5%" >
                    <div class="post-C1">
                        <div class="postc11">
                            <div class="postc111"><img src="photoprofile/<%=pic%>"></div>
                            <div class="postc112">
                                <p><%=name%></p>
                            </div>
                        </div>

                        <div class="postc12">
                            <img src="icon/close.png" alt="" class="posticon112">
                        </div>
                    </div>
                    <div class="caption-cls"><p></p></div>

                    <div class="post-C2"></div>
                    <div class="post-C3">
                        <div class="postc31"></div>
                        <div class="postc32">
                          
                            <button class="postbtns" > <span><img src="icon/heart.png" class="postbtnicons"  ></span> Like</button>
                            <input type="hidden" value="" />
                            <button class="postbtns"  onclick="fullscreenvideo()" > <span> <img src="icon/comment.png" class="postbtnicons" ></span>  comment</button>
                            <button class="postbtns"> <span><img src="icon/share.png" class="postbtnicons" ></span>  share</button>
                        </div>

                    </div>
                </div>


            </div>


        </div>
    </body>
    <script>


        function home() {
            window.location = "friends.jsp";
        }
           
           
           function fullscreenvideo(){
               window.location="fullscreenvideo.jsp";
           }
           function reel(){
               window.location="reel.jsp";
           }
    </script>
</html>
