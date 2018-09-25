<%-- 
    Document   : index
    Created on : Jul 4, 2018, 6:18:05 PM
    Author     : Bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  

        <link rel="shortcut icon" type="image/png" href="https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png"/>
        <title> HRDM</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
        <link rel="stylesheet" type="text/css" href="index_style.css">
        <link href="https://fonts.googleapis.com/css?family=Archivo+Black|Lalezar" rel="stylesheet">

    </head>
    <body>

        <div class="jumbotron">
            <center><img id="logo" src="https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png"></center>
            <hr>
            <form id="loginform" role="form">
                <div id="input-form">
                    <br> 
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <center><input id="login-username" type="text" class="form-control" name="username" value="" placeholder="Employee id"></center>                                        
                    </div>
                    <br>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <center><input id="login-password" type="password" class="form-control" name="password" placeholder="password"></center>
                    </div>
                    <br>
                    <center><button onclick="callDashBoard()" class="btn btn-primary" id="sign-in-button" >Login</button></center>
                </div>
            </form>
        </div>
        <script>
            function callDashBoard() {
                var usr = document.getElementById("login-username").value;
                var pwd = document.getElementById("login-password").value;
                if ((usr == "hrms@jsp.com") && (pwd == "root")) {

                    document.getElementById('loginform').action = "dashboard.jsp";
                } else {

                    alert("Email or Password INVALID!!");
                }
                return false;
            }

        </script>
    </body>
</html>