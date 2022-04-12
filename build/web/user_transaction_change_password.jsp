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
        <title> RoyalWorld : Change Transaction Password </title>

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
                
                var account_no2 = document.usermoneytransactionchangepasswordform.account_no1.value;
                var old_transaction_password2 = document.usermoneytransactionchangepasswordform.old_transaction_password1.value;
                var new_transaction_password2 = document.usermoneytransactionchangepasswordform.new_transaction_password1.value;
                var confirm_transaction_password2 = document.usermoneytransactionchangepasswordform.confirm_transaction_password1.value;
                
                /*
                * @type RegEx Validation using JavaScript
                */
                var account_no_pattern = /^[0-9]{10,15}$/;
                var transaction_password_pattern = /^[0-9]{6}$/;
                
                
                // --------------------- Validation Start -------------------------
                
                if( !account_no2.match(account_no_pattern) )
                {
                    document.getElementById('account_no_error').innerHTML="ACCOUNT NO MUST BE BETWEEN 10 TO 15 DIGITS";
                    flag = false;
                }
                if( account_no2 === "" )
                {
                    document.getElementById('account_no_error').innerHTML="ACCOUNT NO CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !old_transaction_password2.match(transaction_password_pattern) )
                {
                    document.getElementById('old_transaction_password_error').innerHTML="OLD TRANS. PASSWORD SHOULD BE 6 DIGITS LIKE 000000";
                    flag = false;
                }
                if( old_transaction_password2 === "" )
                {
                    document.getElementById('old_transaction_password_error').innerHTML="OLD TRANS. PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !new_transaction_password2.match(transaction_password_pattern) )
                {
                    document.getElementById('new_transaction_password_error').innerHTML="NEW TRANS. PASSWORD SHOULD BE 6 DIGITS LIKE 000000";
                    flag = false;
                }
                if( new_transaction_password2 === "" )
                {
                    document.getElementById('new_transaction_password_error').innerHTML="NEW TRANS. PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !confirm_transaction_password2.match(transaction_password_pattern) )
                {
                    document.getElementById('confirm_transaction_password_error').innerHTML="CONFIRM NEW TRANS. SHOULD BE 6 DIGITS LIKE 000000";
                    flag = false;
                }
                if( confirm_transaction_password2 === "" )
                {
                    document.getElementById('confirm_transaction_password_error').innerHTML="CONFIRM NEW TRANS. PASSWORD CANNOT BE EMPTY";
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
                                <div class="col-md-3">
                                    
                                </div>
                                <div class="col-md-8">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Change Transaction Password</strong> </center> <br>
                                </div>
                                <div class="col-md-1">

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
                                    <img alt="Update Transaction Password" src="images/user_profile_change_transaction_password_one.jpg" height="410" width="100%" style="border-radius: 10px;" />
                                </div>
                                <div class="col-md-6 bank-add-and-transaction-password-div-design">
                                    <form method="POST" action="UserMoneyTransactionChangePassword" name="usermoneytransactionchangepasswordform" onsubmit="return validation()">
                                        <input type="text" name="email1" class="textfield_div_design" value="<jsp:expression>email</jsp:expression>" style="display: none;" /> <br><br>
                                        <label for="name" style="text-align: left!important; width: 32%;"> Account No *</label> 
                                        <input type="number" name="account_no1" placeholder="Your Account No" class="textfield_div_design" onkeyup="val('account_no_error')" /> <br> <span id="account_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 32%;"> Old Trans. Pwd *</label> 
                                        <input type="password" name="old_transaction_password1" placeholder="Enter Old Transaction Password" class="textfield_div_design" onkeyup="val('old_transaction_password_error')" /> <br> <span id="old_transaction_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 32%;"> New Trans. Pwd *</label>
                                        <input type="password" name="new_transaction_password1" placeholder="Enter New Transaction Password" class="textfield_div_design" onkeyup="val('new_transaction_password_error')" /> <br> <span id="new_transaction_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 32%;"> Confirm Pwd *</label> 
                                        <input type="password" name="confirm_transaction_password1" placeholder="Enter Confirm Transaction Password" class="textfield_div_design" onkeyup="val('confirm_transaction_password_error')" /> <br> <span id="confirm_transaction_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
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
