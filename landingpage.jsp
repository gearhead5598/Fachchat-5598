<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import ="java.time.*"%>


<%!
    Connection cs, cs1, stscs;
    PreparedStatement ps, ps1, stsps;
    ResultSet rs, rs1, stsrs;
    String pic = "", userpic = "", caption = "", name = "", date = "", coverpic = "", post_id = "", sts = "", status = "";

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
        sts = rs.getString("status");
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
        <script src="index.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            .statusR1{
                width: 100%;
                display: flex;
                justify-content: center;
                min-height: 100vh;
                flex-direction: column;
            }
            .statusc1{

                margin: auto;
            }

        </style>
        <script type="text/javascript" >

            function video() {
                window.location = "video.jsp";
            }
            function switchuserprofile() {
                window.location = "username.jsp";
            }

            function StatusSelect() {
                window.location = "StatusSelect.jsp";

            }
             function fullscreenstatus() {
                window.location = "fullscreenstatus.jsp";

            }

            function funlog() {
                window.location = "logout.jsp";
            }

            function friendsjsp() {
                window.location = "friends.jsp"
            }
            function funchange() {
                $("#myModal").show();
            }
            function changepass() {

                var old = $("#oldpws").val();
                var new1 = $("#newpws").val();
                var confirm = $("#cnfpws").val();
                if (old === "") {
                    alert("old password is empty");
                } else if (new1 === "") {
                    alert("new password is empty");
                } else if (confirm === "") {
                    alert("confirm password is empty");
                } else if (confirm !== new1) {
                    alert("password does not match");
                }

                $.ajax({
                    url: "changepassword.jsp",
                    data: {oldP: old, pws: new1},
                    method: "post",
                    success: function (result) {
                        alert(result);
                    }
                });
            }


            function showmessanger() {

                document.getElementById('msgR1id').classList.add("showmessenger");

            }
            function hidemessanger() {
                document.getElementById('msgR1id').classList.remove("showmessenger");
            }

            function msglist() {
                $.ajax({
                    url: "msglist.jsp",
                    method: "post",
                    success: function (result) {
                        $("#msglist").html(result);
                    }
                });
            }

            function showfriendlist() {


                $.ajax({
                    url: "showfriendlist.jsp",
                    method: "post",
                    success: function (result) {
                        document.getElementById("subR3-id").innerHTML = result;
                    }
                });
            }
            setInterval(showfriendlist, 2000);

            function chatsection(x) {
                document.getElementById("msglistinput-id").value = x;
                document.getElementById('chatsection').classList.add("showmessenger");
                document.getElementById('msgR1id').classList.remove("showmessenger");
            }
            function sendChat() {
                var chat_to = document.getElementById("msglistinput-id").value;
                var chat = document.getElementById("chatlist-id").value;
                $.ajax({
                    url: "sendChat.jsp",
                    data: {CT: chat_to, C: chat},
                    method: "post",
                    success: function (result) {
                        alert(result);
                    }

                });
                document.getElementById("chatlist-id").value = "";

            }

            function showchats() {
                var chat_to = document.getElementById("msglistinput-id").value;

                $.ajax({
                    url: "showchat.jsp",
                    data: {CT: chat_to},
                    mehtod: "post",
                    success: function (result) {
                        document.getElementById("showchat-id").innerHTML = result;
                    }
                });
            }
            setInterval(showchats, 2000);


            function showpostpopup() {
                document.getElementById('postpop-id1').classList.add("postpopshow");

            }
            function hidepostpopup() {
                document.getElementById('postpop-id1').classList.remove("postpopshow");

            }
            function givelike(x, y, z, m) {

                var pc = document.getElementById("tk" + z).value;

                if (pc === "heart.png") {
                    document.getElementById('postbtnicon-id' + z).src = "icon/heartred.png";
                    document.getElementById("tk" + z).value = "heartred.png";
                } else {
                    document.getElementById('postbtnicon-id' + z).src = "icon/heart.png";
                    document.getElementById("tk" + z).value = "heart.png";
                }
                $.ajax({
                    url: "postlike.jsp",
                    data: {E: x, PID: y},
                    method: "post",
                    success: function (result) {

                    }
                });
            }


            function givecomment(x, y, z) {
                var comment = document.getElementById("postc34inputcmt" + z).value;
                $.ajax({
                    url: "postcomment.jsp",
                    data: {E: x, PID: y, cmt: comment},
                    method: "post",
                    success: function (result) {
                        showcomment(x, y, z);
                    }
                });
                document.getElementById("postc34inputcmt" + z).value = "";
            }

            function showcomment(x, y, z) {
                $.ajax({
                    url: "showcomment.jsp",
                    data: {E: x, PID: y},
                    method: "post",
                    success: function (result) {
                        document.getElementById("postc33allcmt" + z).innerHTML = result;
                    }
                });
            }
//            setInterval(showcomment, 3000);
            function reel() {
                window.location = "reel.jsp";
            }
            function logout() {
                window.location = "logout.jsp";
            }
        </script>
    </head>

    <body  >
        <div class="mainFr1">
            <div class="submainFc1">
                <label class="Fc1logo"><img class="mainlogo" src="icon/facebook.png" alt=""></label>
                <input type="search" value="search here" id="submainFc1search" class="Fc1search">
            </div>
            <div class="submainFc2">
                <label class="Fc2Label"><img class="navicons" src="icon/house.png" alt=""></label>
                <label class="Fc2Label"onclick=" video()"><img class="navicons" src="icon/youtube-logo.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/shopping-cart.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/people.png" alt=""></label>
                <label class="Fc2Label"><img class="navicons" src="icon/house.png" alt=""></label>
            </div>
            <div class="submainFc3">
                <label class="Fc3massenger"  onclick="showmessanger(), msglist()" ondblclick="hidemessanger()" ><img class=" navicon1" src="icon/comment.png" alt=""></label>
                <label class="Fc3notification"><img class=" navicon1" src="icon/bell.png" alt=""></label>
            </div>
            <div class=" Fc3profile2"><img class=" navprofile" src="photoprofile/<%=pic%>" alt=""></div>

        </div>

        <!-- here the end of navv -->
        <div class="afternavR2">
            <!-- here the \subR1 -->
            <div class="subR1">
                <div class="R1list">
                    <div class="R1listlogo R1listprofile">
                        <img class=" navprofile" src="photoprofile/<%=pic%>" alt="">
                    </div>
                    <label  class="R1listlabel" onclick="switchuserprofile()"><%=name%></label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon " src="icon/friend.png" alt=""></label>
                    <label class="R1listlabel" onclick="friendsjsp()" >Friends</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/youtube-logo.png" alt=""></label>
                    <label class="R1listlabel" onclick="showfriendlist()">Most Recent</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/people.png" alt=""></label>
                    <label class="R1listlabel">Groups</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/shopping-cart.png" alt=""></label>
                    <label class="R1listlabel">MarketPlace</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo" onclick=" video()" ><img class="R1horizontalnavicon" src="icon/youtube-logo.png" alt=""></label>
                    <label class="R1listlabel" onclick=" video()">Watch</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/clock.png" alt=""></label>
                    <label class="R1listlabel">Memories</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/house.png" alt=""></label>
                    <label class="R1listlabel">Saved</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/shield.png" alt=""></label>
                    <label class="R1listlabel">Pages</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/event.png" alt=""></label>
                    <label class="R1listlabel">Events</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/favorite.png" alt=""></label>
                    <label class="R1listlabel">Favorites</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/settings.png" alt=""></label>
                    <label class="R1listlabel">Setting</label>
                </div>
                <div class="R1list">
                    <label class="R1listlogo"><img class="R1horizontalnavicon" src="icon/shield.png" alt=""></label>
                    <label class="R1listlabel" onclick="logout()" >Logout</label>
                </div>

            </div>
            <!-- here subR2 -->
            <div class="subR2">
                <div class="subR2navandStories">

                    <div class="subR2nav">
                        <label class="subR2navlabel">Stories</label>
                        <label class="subR2navlabel" onclick="reel()">Reels</label>
                        <label class="subR2navlabel">Call</label>
                    </div>
                    <div class="subR2stories">
                        <div class="nextslid">
                            <label><img class="nextslidicon" src="icon/arrow-right.png" alt=""></label>
                        </div>
                        <div class="userstories" onclick="StatusSelect()" >
                            <img class=" navprofile" src="photoprofile/<%=pic%>" alt="">
                            <div class="userstoriesh1div">
                                <h1>+</h1>
                            </div>

                        </div>
                        <%
                            try {
//                                

                                String em = session.getAttribute("em") + "";
                                stsps = cs.prepareStatement("select * from status where PostedBy=? and PostedDate >=  CURRENT_DATE()");
                                stsps.setString(1, em);
//                                stsps.setString(2,date);
                                stsrs = stsps.executeQuery();
                                while (stsrs.next()) {
                                    status = stsrs.getString("Status");


                        %>

                        <div class="userstories" id="userstories-id" onclick="fullscreenstatus()"><p style="margin:auto;"><%=status%></p></div>

                        <%
                                }
                            } catch (Exception ex) {

                            }
                        %>   



                    </div>
                </div>

                <div class="subR2afternavandstories">
                    <div class="subR2logoandquite">
                        <h3 class="subR2profile">profile</h3>
                        <input type="text" id="quite" class="subR2quite" value="What's going on.">
                    </div>
                    <div class="subR2downnav">
                        <label class="downnav1">Live video</label>
                        <label class="downnav1" onclick="showpostpopup()" ondblclick="hidepostpopup()" >Photo/video</label>

                    </div>
                </div>

                <%
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        cs1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/facepro", "root", "");
                        String em = session.getAttribute("em") + "";
                        ps1 = cs1.prepareStatement("select * from userpost where user_email = ? ");
                        ps1.setString(1, em);

                        rs1 = ps1.executeQuery();
                        int i = 0;
                        while (rs1.next()) {
                            i++;
                            userpic = rs1.getString("userpost");
                            caption = rs1.getString("caption");
                            post_id = rs1.getString("post_id");

                %>
                <div class="post-R1">
                    <div class="post-C1">
                        <div class="postc11">
                            <div class="postc111"><img src="photoprofile/<%=pic%>"></div>
                            <div class="postc112">
                                <p>  <%=name%></p>
                            </div>
                        </div>

                        <div class="postc12">
                            <img src="icon/close.png" alt="" class="posticon112">
                        </div>
                    </div>
                    <div class="caption-cls"><p><%=caption%></p></div>

                    <div class="post-C2"><img src="postPhotos/<%=userpic%>" ></div>
                    <div class="post-C3">
                        <div class="postc31"></div>
                        <div class="postc32">
                            <%
                                PreparedStatement pss = cs.prepareStatement("select * from post_like where post_id=? and like_by=?");
                                pss.setString(1, post_id + "");
                                pss.setString(2, em + "");

                                ResultSet rss = pss.executeQuery();
                                String piclike = "";
                                if (rss.next()) {
                                    piclike = "heartred.png";
                                } else {
                                    piclike = "heart.png";
                                }
                                rss.close();
                            %>
                            <button class="postbtns" onclick="givelike('<%=em%>', '<%=post_id%>',<%=i%>, '<%=piclike%>')" > <span><img src="icon/<%=piclike%>" class="postbtnicons" id="postbtnicon-id<%=i%>" ></span> Like</button>
                            <input type="hidden" id="tk<%=i%>" value="<%=piclike%>" />
                            <button class="postbtns"   > <span> <img src="icon/comment.png" class="postbtnicons" ></span>  comment</button>
                            <button class="postbtns"> <span><img src="icon/share.png" class="postbtnicons" ></span>  share</button>
                        </div>
                        <div class="postc33" id="postc33allcmt<%=i%>">
                            <%
                                try {

                                    String cmt_by = session.getAttribute("em") + "";
                                    //String post_id = post_id+"";
                                    ps = cs.prepareStatement("select pc.comment , s.FirstName ,s.pic from post_comment pc , signup s where (pc.cmt_by=s.Email) and (cmt_by=? and post_id=?)");
                                    ps.setString(1, cmt_by);
                                    ps.setString(2, post_id);

                                    rs = ps.executeQuery();
                                    while (rs.next()) {

                                        name = rs.getString("FirstName");
                                        pic = rs.getString("pic");

                            %>
                            <div style="display:flex;">
                                <div style="width:40px;height:40px;border: 1px solid black;border-radius: 50%;display:flex;overflow: hidden;margin:auto;margin-left: 10px;margin-right: 5px"><img src="photoprofile/<%=pic%>" style="width: -webkit-fill-available;"></div>
                                <div style="width: 40%; background: whitesmoke;padding-left:10px ;border-radius: 10px;margin:10px;">
                                    <h6><%=name%></h6>
                                    <p><%=rs.getString("comment")%></p>
                                </div>
                            </div>
                            <%

                                    }

                                } catch (Exception es) {
                                    out.print(es.getMessage());
                                }
                            %>
                        </div>
                        <div class="postc34">
                            <input type="text" class="postcomt" placeholder="Enter your comment here"  id="postc34inputcmt<%=i%>" >
                            <button onclick="givecomment('<%=em%>', '<%=post_id%>',<%=i%>)" >send</button>
                        </div>
                    </div>
                </div>

                <%

                        }

                    } catch (Exception es) {
                        out.print(es.getMessage());
                    }
                %>



            </div>

            <div class="subR3" id="subR3-id">

            </div>

        </div>







        <!--here model is persent for password change-->
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Change password</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="changeR1">
                            <div class="changeinput">
                                <label>Old Password</label><br>
                                <input type="text" id="oldpws"><br>
                                <label>New Password</label><br>
                                <input type="text" id="newpws"><br>
                                <label>Confirm Password</label><br>
                                <input type="text" id="cnfpws"><br>
                                <button class="btn-danger mt-2" id="changbtn" type="submit" onclick="changepass()">Change
                                    password</button>

                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

        <!-- here messange model is persent -->

        <div id="msgR1id" class="msgR1">
            <div class="msgC1">
                <div class="msgc11">
                    <h1 class="msgc11h1">Chats</h1>
                </div>
                <div class="msgc12">
                    <label for="" class="chaticonmsgc12"><img  src="icon/list.png" alt=""></label>
                    <label for="" class="chaticonmsgc12"><img  src="icon/full-screen.png" alt=""></label>
                    <label for="" class="chaticonmsgc12"><img  src="icon/cam-recorder.png" alt=""></label>
                    <label for="" class="chaticonmsgc12"><img  src="icon/editing.png" alt=""></label>

                </div>
            </div>

            <div class="msgC2">
                <input class="msgc2search" type="search" placeholder="Search massenger">
            </div>
            <div class="msgC3">
                <img src="icon/comment.png" alt="" class="msgc3icon">
                <h5 class="msgc3h5" id="touch" >New message request</h5>
                <p>></p>
            </div>
            <div id="msglist">

            </div>

        </div>



        <div id="chatsection" class="chatR1">
            <div class="msgC1">
                <div class="msgc11">
                    <h1 class="msgc11h1"><%%></h1>
                </div>
                <div class="msgc12">
                    <label for="" class="chaticonmsgc12"><img  src="icon/list.png" alt=""></label>
                    <label for="" class="chaticonmsgc12"><img  src="icon/full-screen.png" alt=""></label>
                    <label for="" class="chaticonmsgc12"><img  src="icon/cam-recorder.png" alt=""></label>
                </div>
            </div>

            <div id="msglist">
                <input type="text" value="" id="msglistinput-id" class="msglistinput" >
                <div class="chatlist" id="showchat-id" >

                </div>
                <input type="text" value="" class="msglistinput" id="chatlist-id" placeholder="Enter your massege" >
                <button onclick="sendChat()">Send</button>

            </div>

        </div>

        <!--  post popup html persent here -->

        <div class="postpopup-R1 " id="postpop-id1">
            <div class="postpop-C1">Post</div>
            <div class="postpop-C2">
                <form action="userpost.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="postimg">
                    <button class="postpopbtn" type="submit">Post</button>
                </form>
            </div>
            <div class="postpop-C1">video</div>
            <div class="postpop-C2">
                <form action="userpost.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="postimg">
                    <button class="postpopbtn" type="submit">Post</button>
                </form>
            </div>

        </div>

    </body>



</html>

<%
    if (session.getAttribute("em") == null) {
        response.sendRedirect("login.jsp");
    }
%>




