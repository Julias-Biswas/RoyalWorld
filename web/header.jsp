<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Header </title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />

    </head>
    <body>
        <div class="container-fluid">
            <div class="row header_design">
                <div class="topnav" id="myTopnav">
                    <div class="col-md-12">
                        <a href="index.jsp" title="Go To Home Page"> <img alt="RoyalWorld Logo" src="images/RoyalWorld_logo.jpg" width="65" height="65" class="logo_img_design" /> </a>
                        <a href="index.jsp" title="Go To Home Page" class="logo_name_design">RoyalWorld</a>
                        
                        <br>
                         
                        <a href="index.jsp" class="menubar_design"> HOME </a>
                        <a href="about_us.jsp" class="menubar_design"> ABOUT </a>
                        <a href="our_plans.jsp" class="menubar_design"> PLAN </a>
                        <a href="contact_us.jsp" class="menubar_design"> CONTACT </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="register.jsp" class="menubar_design"> <button class="menubar_design_button"> <span class="glyphicon glyphicon-user"></span> Sign Up </button> </a> 
                        <a href="login.jsp" class="menubar_design"> <button class="menubar_design_button"> <span class="glyphicon glyphicon-log-in"></span> Login </button> </a> 

                        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                            <i class='fas fa-bars' style='font-size:28px;'></i>
                        </a> 
                        
                        <br><br>
                        
                    </div>
                </div>
            </div>
        </div>

        <script>
            function myFunction()
            {
                var x = document.getElementById("myTopnav");
                if (x.className === "topnav")
                {
                    x.className +=" responsive";
                }
                else
                {
                    x.className = "topnav";
                }
            }
        </script>

    </body>
</html>
