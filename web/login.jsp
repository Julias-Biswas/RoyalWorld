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
        <title> Royal World - Login </title>
        
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
                
                var email2 = document.loginform.email1.value;
                var password2 = document.loginform.password1.value;
                
                /*
                 * @type RegEx Validation using JavaScript
                 */
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
                // ------------------ Validation Start -------------------
                
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
                
                if( !password2.match(password_pattern) )
                {
                    document.getElementById('password_error').innerHTML="PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if( password2 === "" )
                {
                    document.getElementById('password_error').innerHTML="PASSWORD CANNOT BE EMPTY";
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
                            <img alt="Register Image" src="images/loginimage.png" height="300" width="100%" />
                        </div>
                        <div class="col-md-7 login_div_design" >
                            <form action="Login" method="POST" name="loginform" onsubmit="return validation()">
                                <strong class="register_header"> Login </strong> <br><br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> Email * </label>
                                <input type="text" placeholder="Your Email" class="textfield_div_design" name="email1" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> Password *</label>
                                <input type="password" placeholder="Your password" class="textfield_div_design" name="password1" onkeyup="val('password_error')" /> <br> <span id="password_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <input type="checkbox" value="rememberme" name="rememberme1" /> Remember Me <br><br>
                                
                                <input type="submit" value="Login" class="btn upload-image-button-design-div" style="color: #ffffff;" />  <br> <br>
                                <a href="forgot_password.jsp" class="forgot_pass_div_design"> Forgot Password?</a> <br><br>
                                
                                <strong style="color: #009999; font-size: 18px;"> OR </strong> <br><br>
                                
                                <span style="color: #666666;"> New User ? </span>
                                <a href="register.jsp" class="login_href_design"> Sign Up </a>
                                
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
