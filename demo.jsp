<%-- 
    Document   : demo
    Created on : Feb 7, 2023, 4:24:02 PM
    Author     : AYUB G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .r1{
            width: 100%;
            min-height: 100vh;display: flex;
            justify-content: center;
            flex-direction: column;
        }
        .c1{
            width: 200px;
            height: 200px;
            border: 1px solid red;
            border-radius: 25px;
            margin: auto;
        }
        .btn{
            width: 10%;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="r1">
        <div class="c1"></div>
        <button class="btn">Camera</button>
    </div>
</body>
</html>
