<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String profile_pic = (String) session.getAttribute("session_profile_pic");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome : <jsp:expression>name</jsp:expression> </title>

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


            <link rel="stylesheet" href="css/style.css" />

        </head>
        <body>
            <div class="container-fluid">
                <div class="row header_design">
                    <div class="topnav" id="myTopnav">
                        <div class="col-md-12 col-sm-12">
                            <a href="index.jsp" title="Go To Home Page" class="active"> <img alt="RoyalWorld Logo" src="images/RoyalWorld_logo.jpg" width="65" height="65" class="logo_img_design" /> </a>
                            <a href="index.jsp" title="Go To Home Page" class="logo_name_design_after_login">RoyalWorld</a>

                            <strong style="font-size: 24px; color: #ffffff;"> <a title="Click Here Then Go To My Profile" class="user-name-after-login" href="profile.jsp" style="color: #ffffff; text-decoration: none;"> <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="60" width="60" style="border: 0.5px solid #cccccc; border-radius: 50%; image-resolution: normal;" /> <jsp:expression>name</jsp:expression> </a> </strong>

                            <a href="index.jsp" class="menubar_design"> HOME </a>
                            <a href="about_us.jsp" class="menubar_design"> ABOUT </a>
                            <a href="our_plans.jsp" class="menubar_design"> PLAN </a>
                            <a href="contact_us.jsp" class="menubar_design"> CONTACT </a>
                            
                            <a href="Logout"> <button class="menubar_design menubar_design_button"> <span class="glyphicon glyphicon-log-out"></span> Logout </button> </a> 

                            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                                <i class='fas fa-bars' style='font-size:28px;'></i>
                            </a> 

                        <br><br>

                    </div>
                </div>
            </div>

            <script>
                function myFunction()
                {
                    var x = document.getElementById("myTopnav");
                    if (x.className === "topnav")
                    {
                        x.className += " responsive";
                    }
                    else
                    {
                        x.className = "topnav";
                    }
                }
            </script>

    </body>
</html>
