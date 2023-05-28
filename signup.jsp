

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Face</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="index.css">
        <link rel="stylesheet" href="animation.css"><!-- comment -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">

            function usersignup() {
                fname = $("#fName").val();
                lname = $("#lName").val();
                email = $("#Email").val();
                password = $("#passWord").val();
                cnpassword = $("#cnPassword").val();
                if (fname === "") {
                    alert("Please fill your first name");
                } else if (lname === "") {
                    alert("Please fill your last name");
                } else if (email === "") {
                    alert("Please fill your email");
                } else if (password === "") {
                    alert("Please fill your password");
                } else if (cnpassword === "") {
                    alert("Please fill your confirm password");
                } else if (cnpassword !== password) {
                    alert(" password not match");

                } else {
                    $.ajax({
                        url: "usersignup.jsp",
                        data: {f: fname, l: lname, e: email, p: password},
                        method: "post",
                        success: function (result) {
                           if(result.trim()==="Congratulation"){
                               window.location="login.jsp";
                           }
                           else{
                               alert(result);
                           }

                        }
                    });
                }
            }

        </script>





    </head>





    <body> 





        <div class="logr1">
            <div class="logc1 logwc2 logwc3">
                <img class="closeimg logb2" src="img/close.png" alt="">

                <button class="logb1"><a href="">Signup In With Us</a></button>
                <h3 class="logh3">or</h3>


                <div class="pagesig">
                    <div class="fnamesig">
                        <div>
                            <label for="">First name</label></br>
                            <input type="text" id="fName" class="loginp ">
                        </div>
                        <div>
                            <label for="">Last name</label></br>
                            <input type="text" id="lName" class="loginp">
                        </div>
                    </div>

                    <div class="emailsig">
                        <div>
                            <label for="">Email</label></br>
                            <input type="text" id="Email" class="loginp emaillog">
                        </div>
                    </div>

                    <div class="passsig">
                        <div>
                            <label for="">Password</label></br>
                            <input type="text" id="passWord" class="loginp">
                        </div>
                        <div>
                            <label for="">Confirm Password</label></br>
                            <input type="text" id="cnPassword" class="loginp">
                        </div>
                    </div>

                </div>
                <button  class="logb1 logb2" onclick="usersignup()" >Sign Up</button>
                <p class="logp1">You have already account?<span class="sigspan"><a href="login.jsp">Login </a></span></p>
            </div>
        </div>    







    </body>
</html>
