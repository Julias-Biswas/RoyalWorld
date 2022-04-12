<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String sponser_name = (String) session.getAttribute("session_sponser_name");
    String position = (String) session.getAttribute("session_position");
    String contact_no = (String) session.getAttribute("session_contact_no");
    String profile_pic = (String) session.getAttribute("session_profile_pic");

    //         ***  Condition Part  ***
    if (name.equals("") || name == null) {
        response.sendRedirect("login.jsp");
    }
    if (sponser_name == null || sponser_name.equals("")) {
        sponser_name = "- Not Available -";
    }
    if (position == null || position.equals("")) {
        position = "- Not Avaliable -";
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> RoyalWorld : Change Password </title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link rel="stylesheet" href="css/style.css" />

        <script>
            
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            
            function validation()
            {
                var flag = true;
                
                var old_password2 = document.userloginchangepasswordform.old_password1.value;
                var new_password2 = document.userloginchangepasswordform.new_password1.value;
                var confirm_new_password2 = document.userloginchangepasswordform.confirm_new_password1.value;
                
                /*
                * @type RegEx Validation using JavaScript
                */
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
                
                // --------------------- Validation Start -------------------------
                
                if( !old_password2.match(password_pattern) )
                {
                    document.getElementById('old_password_error').innerHTML="OLD PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( old_password2 === "" )
                {
                    document.getElementById('old_password_error').innerHTML="OLD PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !new_password2.match(password_pattern) )
                {
                    document.getElementById('new_password_error').innerHTML="NEW PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( new_password2 === "" )
                {
                    document.getElementById('new_password_error').innerHTML="NEW PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !confirm_new_password2.match(password_pattern) )
                {
                    document.getElementById('cofirm_new_password_error').innerHTML="CONFIRM NEW PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( confirm_new_password2 === "" )
                {
                    document.getElementById('cofirm_new_password_error').innerHTML="CONFIRM NEW PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                return flag;
            }
            
        </script>
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:scriptlet>
                    if (email == null ? email == null : email.trim().equals("null")) {
                </jsp:scriptlet>
                <jsp:include page="header.jsp"></jsp:include>
                <jsp:scriptlet>
                } else {
                </jsp:scriptlet>
                <jsp:include page="profileheader.jsp"></jsp:include>
                <a href="user_change_profile_and_transaction_password.jsp" class="previous-logo-design-div" title="Back To Change Password Page">&#10094;</a>
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <br><br>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8" style="background-color: #ebfdfe; border: 1px solid #ccffff; box-shadow: 2px 2px 2px #ccffff; border-radius: 10px;">
                            <div class="row">
                                <div class="col-md-4">
                                    
                                </div>
                                <div class="col-md-6">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Change Login Password</strong> </center> <br>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                    
                    <br>
                    
                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="130" width="130" style="border: 0.5px solid #cccccc; border-radius: 50%; image-resolution: normal;" />
                                </div>
                                <div class="col-md-8 col-sm-8">
                                    <b style="color: #6600cc; font-size: 16px;"> Name : <span style="color: #000000; font-size: 16px;"> <jsp:expression>name</jsp:expression> </span> </b> <br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Email : <span style="color: #000000; font-size: 16px;"> <jsp:expression>email</jsp:expression> </span> </b>  <br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Mobile No : <span style="color: #000000; font-size: 16px;"> <jsp:expression>contact_no</jsp:expression> </span> </b>  <br>
                                </div>
                                <div class="col-md-1">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                    
                    <br><br>
                    
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                            <div class="row">
                                <div class="col-md-6">
                                    <img alt="User Profile Change Password" src="images/user_profile_change_password_one.jpg" height="335" width="100%" style="border-radius: 10px;" />
                                </div>
                                <div class="col-md-6 bank-add-and-transaction-password-div-design">
                                    <form method="POST" action="UserLoginChangePassword" name="userloginchangepasswordform" onsubmit="return validation()">
                                        <input type="text" name="email1" class="textfield_div_design" value="<jsp:expression>email</jsp:expression>" style="display: none;"/> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Old Pwd *</label> 
                                        <input type="password" name="old_password1" placeholder="Enter Old Password" class="textfield_div_design" onkeyup="val('old_password_error')" /> <br> <span id="old_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> New Pwd *</label> 
                                        <input type="password" name="new_password1" placeholder="Enter New Password" class="textfield_div_design" onkeyup="val('new_password_error')" /> <br> <span id="new_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Confirm Pwd *</label> 
                                        <input type="password" name="confirm_new_password1" placeholder="Enter Confirm Password" class="textfield_div_design" onkeyup="val('cofirm_new_password_error')" /> <br> <span id="cofirm_new_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <input type="submit" value="Update" class="btn upload-image-button-design-div" /> <br><br>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            
                        </div>
                    </div>
                </div>
            </div>
                                
            <br><br><br>

            <jsp:include page="footer.jsp"></jsp:include>
                                
        </div>
    </body>
</html>
