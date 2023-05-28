
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

            function sendStsSelect() {
                window.location = "StatusSelect.jsp";
            }

            function   sendStatus() {

//                stsType = $("#StsType").val();

//                date = new Date();
//                stsdate = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay();
                Sts = $("#StsArea").val();

                 if (Sts === "") {
                    alert("Please write Satatus");
                } else {
                    $.ajax({
                        url: "statusPost.jsp",
                        data: { S: Sts},
                        method: "post",
                        success: function (result) {
                            window.location="landingpage.jsp";
                        }
                    });
                }
            }

function stsPriviwe(){
    
    document.getElementById('StsPriviwe').innerHTML=document.getElementById('StsArea').value;
}
//function showstatus(){
//    $.ajax({
//        url:"showstatus.jsp",
//        method:"post",
//        success:function(result){
//            document.getElementById("userstories-id").innerHTML=result;
//        }
//    });
//}
        </script>


    </head>

    <body  >
        <div class="subStsR1">
            <div class="subStsc1">
                <div class="C1btn"><button onclick="sendStsSelect()" class="C1close">Close</button></div>
                <div class="C1heading">
                    <h2>Your Story</h2>
                    <button class="C1headSetting" onclick="showstatus()">Setting</button>
                </div>
                <div class="C1profile">
                    <div class="c1userProfile">
                       <img class=" statusprofile" src="photoprofile/<%=pic%>" alt="">

                    </div>
                    <h3 class="C1username"><%=name%></h3>
                </div>
                <div class="StsWriteArea">
                    <textarea class="StstexArea" name="Status" id="StsArea" cols="30" rows="10"></textarea>
                    <button type="submit" class="Stssendbtn" onclick="sendStatus()"  >Send</button>
                   <button type="submit" class="Stssendbtn" onclick="stsPriviwe()"  >Check Priviwe</button>

                </div>
            </div>
            <div class="subStsc2">
                <div class="StsSelectType">
                    <div class="StsVideo">
                        <h3 id="StsPriviwe">Preview</h3>
                    </div>

                </div>
            </div>
        </div>
    </body>

</html>


