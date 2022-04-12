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
        <title> Royal World - Forgot Password </title>
        
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
                
                var email2 = document.forgotpasswordform.email1.value;
                var new_password2 = document.forgotpasswordform.new_password1.value;
                var confirm_password2 = document.forgotpasswordform.confirm_password1.value;
                
                /*
                 * @type RegEx Validation using JavaScript
                 */
                
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
                /*
                * --------------------- Validation Start -------------------------
                */
                
                if( !email2.match(email_pattern) )
                {
                    document.getElementById('email_error').innerHTML="EMAIL IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( email2 === "" )
                {
                    document.getElementById('email_error').innerHTML="EMAIL CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !new_password2.match(password_pattern) )
                {
                    document.getElementById('new_password_error').innerHTML="PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( new_password2 === "" )
                {
                    document.getElementById('new_password_error').innerHTML="NEW PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !confirm_password2.match(password_pattern) )
                {
                    document.getElementById('confirm_password_error').innerHTML="PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( new_password2 === "" )
                {
                    document.getElementById('confirm_password_error').innerHTML="CONFIRM PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                return flag;
                
            }
            
        </script>
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="header.jsp" ></jsp:include>                                                                                                                                                        
                <br>
                <div class="col-md-12">
                    <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                        <div class="col-md-5">
                            <img alt="Register Image" src="images/forgot_password.jpg" height="300" width="100%" />
                        </div>
                        <div class="col-md-7 forgot_password_div_design" >
                            <form action="ForgotPassword" method="POST" name="forgotpasswordform" onsubmit="return validation()">
                                <strong class="register_header"> Forgot Password </strong> <br><br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> Email * </label>
                                <input type="text" placeholder="Your Email" name="email1" class="textfield_div_design" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> New Password *</label>
                                <input type="password" placeholder="Your New password" name="new_password1" class="textfield_div_design" onkeyup="val('new_password_error')" /> <br> <span id="new_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> Confirm Password *</label>
                                <input type="password" placeholder="Confirm Password" name="confirm_password1" class="textfield_div_design" onkeyup="val('confirm_password_error')" /> <br> <span id="confirm_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <input type="submit" value="Submit" class="btn upload-image-button-design-div" style="color: #ffffff;" /> <br><br>
                                
                                <strong style="color: #009999; font-size: 18px;"> OR </strong> <br><br>
                                
                                <span style="color: #666666;"> Back To Login Page </span>
                                <a href="login.jsp" class="login_href_design"> Click Here </a>
                            </form>
                        </div>
                    </div>
                    <br><br><br>
                </div>
                
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
