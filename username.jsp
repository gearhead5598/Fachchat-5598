
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
     <link rel="stylesheet" href="mainfile.css">
            <link rel="stylesheet" href="mainfile.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="userinfo.css">
    <script type="text/javascript" >
        function addSts(){
            window.location='StatusSelect.jsp';
        }
        function show(){
           document.getElementById('editprofile').classList.add("edproshow") ;
        }
        function hide(){
     document.getElementById('editprofile').classList.remove("edproshow") ;

        }
         function showpop(){
           document.getElementById('editpop').classList.add("editpopshow"); 
        }
        function hidepop(){
     document.getElementById('editpop').classList.remove("editpopshow"); 

        }
        
         function showcov(){
           document.getElementById('editcov').classList.add("editpopshow"); 
        }
        function hidecov(){
     document.getElementById('editcov').classList.remove("editpopshow") ;

        }

    </script><!-- comment -->
</head>

<body>
    <div class="mainFr1">
        <div class="submainFc1">
            <label class="Fc1logo"><img class="mainlogo" src="icon/facebook.png" alt=""></label>
            <input type="search" value="search here" id="submainFc1search" class="Fc1search">
        </div>
        <div class="submainFc2">
            <label class="Fc2Label"><img class="navicons" src="icon/house.png" alt=""></label>
            <label class="Fc2Label"><img class="navicons" src="icon/youtube-logo.png" alt=""></label>
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
    
    
    
    
    <div class="userinfo">
        <div class="usermainR1">
            <div class="usercover">
              <img class="coverpicedproc32" src="photoprofile/<%=coverpic%>">
              <button class ="usercoveredit " onclick="showcov()">Edit cover</button>
                
            </div>
        </div>
        <div class="usermainR2">
            <div class="usersubR2">
                <div class="R2profile">
                    <img class="R2profilimg" src="photoprofile/<%=pic%>">
                </div>
                <div class="R2profileinfo">
                    <div class="R2username">
                        <h1 class="R2Name"><%=name%></h1>
                        <p class="R2userParagraph">1.3K friend</p>
                    </div>
                    <div class="R2userfriends">
                        <div class="R2showfriends">1</div>
                        <div class="R2editprofilebtn">
                            <button class="R2addstory" onclick="addSts()">Add to story</button>
                            <button class="R2editP" onclick="show()">Edit profile</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="R3usernav">
            <div class="R3subuser">
                <div class="R3navlist">
                    <label>Posts</label>
                    <label>About</label>
                    <label>friends</label>
                    <label>Photos</label>
                    <label>Videos</label>
                    <label>More</label>
                </div>
                <div class="R3dot">1</div>
            </div>
        </div>
    </div>




    <div class="seconduserinfo">
        <div class="subsecunduserinfo">
            <div class="subseconduserinfo1">
               
                
            </div>
        </div>
    </div>
    
    
<!--    pop for edit profile-->

<div id="editprofile" class="edpromain">
    <div class="edproR1">
        <div class="edproC1">
            <h1 class="edproc1h1">Edit Profile</h1>
            <h2 class="edproc1h2" onclick="hide()">+</h2>
        </div>
        <div class="edproC2">
            <div class="edproc21">
                <h3 class="edproc2h3">Profile picture</h3>
                <h3 class="edproc2edit" onclick="showpop()">edit</h3>
            </div>
            <div class="edproc22">
                <div class="edproc22pic"><img class="profilpicpopup" src="photoprofile/<%=pic%>" ></div>
            </div>
        </div>
        <div class="edproC3">
            <div class="edproc31">
                <h3 class="edproc3h3">Cover picture</h3>
                <h3 class="edproc3edit" onclick="showcov()">edit</h3>
            </div>
            <div class="edproc32">
                <div class="edproc32coverpic">
                    <img class="coverpicedproc32" src="photoprofile/<%=coverpic%>">
                </div>
            </div>
        </div>
        <div class="edproC4">
            <div class="edproc41">
                <h3 class="edproc4h3">Bio</h3>
                <h3 class="edproc4edit">add</h3>
            </div>
            <div class="edproc42">
                <div class="edproc42text"></div>
            </div>
        </div>
        <div class="edproC5">
            <div class="edproc41">
                <h3 class="edproc5h3">Customise your intro</h3>
                <h3 class="edproc5edit">edit</h3>
            </div>
            <div class="edproc52">
                <div class="edproc52text"></div>
            </div>
        </div>
    </div>
</div>
    
<!--    profile picture edit karne ki popup yaha h-->

<div id="editpop" class="editpopmain">
        <div class="editpopR1">
            <div class="editpopC1">
                <h1 class="editpopc1h1">Update profile</h1>
                <h2 class="editpopc1h2 " onclick="hidepop()">+</h2>
            </div>
            <div class="editpopC2">
                <div class="editpopc21">Icon</div>
                <div class="editpopc22">
                     <form action="changepic.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="img1"><!-- comment -->
                    <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
            <div class="editpopC3">
                <div class="editpopc21">Icon</div>
                <div class="editpopc22">Upload Photo</div>
            </div>
        </div>
    </div>

<!--    cover picture edit karne ki popup yaha h-->

<div id="editcov" class="editpopmain">
        <div class="editpopR1">
            <div class="editpopC1">
                <h1 class="editpopc1h1">Update Cover</h1>
                <h2 class="editpopc1h2 " onclick="hidecov()">+</h2>
            </div>
            <div class="editpopC2">
                <div class="editpopc21">Icon</div>
                <div class="editpopc22">
                    <form action="changcoverphoto.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="img2"><!-- comment -->
                    <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
            <div class="editpopC3">
                <div class="editpopc21">Icon</div>
                <div class="editpopc22">Upload Photo</div>
            </div>
        </div>
    </div>
</body>

</html>
<%

  if(session.getAttribute("em")==null)
    {
        response.sendRedirect("login.jsp");
    }
%>

