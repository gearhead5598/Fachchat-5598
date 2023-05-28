<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="animation.css">
    <script type="text/javascript" src="index.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body{
            background-image: url('img/star.jpg');
        background-repeat: no-repeat;
    background-size: cover;
    
        }
    </style>
    <script type="text/javascript">

    function userlogin(){
      var  email=$("#useremail").val();
      var  pass=$("#userpass").val();
        
        if(email===""){
            alert("Please fill email");
        }
        else if(pass===""){
            alert("Please fill password");
        }
        else {
            
        $.ajax({
            url:"userlogin.jsp",
            data:{e:email,p:pass},
            method:"post",
            success:function(result){
                if(result.trim()==="valid"){
                    window.location="landingpage.jsp";
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
        <div class="logc1">
            <img class="closeimg logb2" src="img/close.png" alt="">

            <button class="logb1"><a href="">Log In With Us</a></button>
            <h3 class="logh3">or</h3>
            <input type="text" id="useremail" class="loginp " placeholder="Email"><br>
            <input type="password" id="userpass" class="loginp" placeholder="Password"><br>
            <div class="che1">
                <div class="che ">
                    <input type="checkbox" class="logche" value="">
                    <label for="" class="logleb">remember me <label><br>

                </div>
                <p class="logfor"><a href="">forgot password?</a></p>

            </div>


            <button class="logb1 logb2" onclick="userlogin()" >  <a href="">Log In</a></button>



            <p class="logp1">Don't have account?<span class="sigspan"><a href="signup.jsp">Sign up</a></span></p>
        </div>
    </div>
</body>
</html>