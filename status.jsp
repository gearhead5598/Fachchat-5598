
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        .statusR1{
            width: 100%;
            display: flex;
            justify-content: center;
            min-height: 100vh;
            flex-direction: column;
        }
        .statusc1{
            width: 40%;
            margin: auto;
        }
    </style>
    <script type="text/javascript">
     function   fun(){
         var stsType = $("#StsType").val();
         var stsname = $("#Stsname").val();
         var stsdate = $("#StsDate").val();
         var Sts = $("#StsArea").val();
         if(stsType==="Select Type"){
             alert("Please select type");            
         }
         else if(stsname===""){
             alert("Please write name");            
         }
         else if(stsdate===""){
             alert("Please fill Date");            
         }
         else if(Sts===""){
             alert("Please write Satatus");            
         }
         else{
           $.ajax({
               url:"statusPost.jsp",
               data:{ST:stsType,N:stsname,D:stsdate,S:Sts},
               method:"post",
               success:function(result){
                   alert(result);
               }
           });
       }
        }
        
        function statusDis(){
            $.ajax({
                url:"statusDisplay.jsp",
                method:"post",
                success:function(result){
                    alert(result);
                }
                
            });
        }
    </script>
</head>
<body>

    <div class="statusR1">
       <div class="statusc1">
           <select id="StsType" >
               <option>Select Type</option>
               <option>Text</option>
               <option>Video</select>
           </select>
           <input type="text" id="Stsname"  placeholder="Name">
           <input id="StsDate" type="date">

        <textarea id="StsArea" class="statusarea" name="Status" id="" cols="30" rows="10">

        </textarea>
           <button type="submit" class="statusbtn" onclick="fun()" >Send</button>
        <div id="shoeStatus"></div>
        </div>
    </div>
</body>
</html>