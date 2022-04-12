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
        sponser_name = "----- Not Available -----";
    }
    if (position == null || position.equals("")) {
        position = "----- Not Avaliable -----";
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> RoyalWorld : Add Account </title>

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
                
                var bank_name2 = document.addaccountdetails.bank_name1.value;
                var account_no2 = document.addaccountdetails.account_no1.value;
                var re_account_no2 = document.addaccountdetails.re_account_no1.value;
                var bank_ifsc2 = document.addaccountdetails.bank_ifsc1.value;
                var account_holder_name2 = document.addaccountdetails.account_holder_name1.value;
                var mobile_no2 = document.addaccountdetails.mobile_no1.value;
                var transaction_password2 = document.addaccountdetails.transaction_password1.value;
                var re_transaction_password2 = document.addaccountdetails.re_transaction_password1.value;
                
                
                /*
                * @type RegEx Validation using JavaScript
                */
                var account_no_pattern = /^[0-9]{10,15}$/;
                var bank_ifsc_pattern = /^[A-Z0-9]{11}$/;
                var account_holder_name_pattern = /^[a-zA-Z ]{3,30}$/;
                var mobile_no_pattern = /^[0-9]{10}$/;
                var transaction_password_pattern = /^[0-9]{6}$/;
                
                
                // --------------------- Validation Start -------------------------
                
                if( bank_name2 === "Select Bank" )
                {
                    document.getElementById('bank_name_error').innerHTML="PLEASE SELECT ANY BANK";
                    flag = false;
                }
                else
                {
                    document.getElementById('bank_name_error').innerHTML="";
                    flag = true;
                }
                
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
                
                if( !re_account_no2.match(account_no_pattern) )
                {
                    document.getElementById('re_account_no_error').innerHTML="RE-ACCOUNT NO MUST BE BETWEEN 10 TO 15 DIGITS";
                    flag = false;
                }
                if( re_account_no2 === "" )
                {
                    document.getElementById('re_account_no_error').innerHTML="RE-ACCOUNT NO CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !bank_ifsc2.match(bank_ifsc_pattern) )
                {
                    document.getElementById('bank_ifsc_error').innerHTML="IFSC SHOULD BE 11 DIGITS LIKE MYBANK00000";
                    flag = false;
                }
                if( bank_ifsc2 === "" )
                {
                    document.getElementById('bank_ifsc_error').innerHTML="IFSC CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !account_holder_name2.match(account_holder_name_pattern) )
                {
                    document.getElementById('account_holder_name_error').innerHTML="ACCOUNT HOLDER NAME IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( account_holder_name2 === "" )
                {
                    document.getElementById('account_holder_name_error').innerHTML="ACCOUNT HOLDER NAME CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !mobile_no2.match(mobile_no_pattern) )
                {
                    document.getElementById('mobile_no_error').innerHTML="MOBILE NO IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( mobile_no2 === "" )
                {
                    document.getElementById('mobile_no_error').innerHTML="MOBILE NO CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !transaction_password2.match(transaction_password_pattern) )
                {
                    document.getElementById('transaction_password_error').innerHTML="TRANSACTION PASSWORD SHOULD BE 6 DIGITS LIKE 000000";
                    flag = false;
                }
                if( transaction_password2 === "" )
                {
                    document.getElementById('transaction_password_error').innerHTML="TRANSACTION PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !re_transaction_password2.match(transaction_password_pattern) )
                {
                    document.getElementById('re_transaction_password_error').innerHTML="RE-TRANSACTION PASSWORD SHOULD BE 6 DIGITS LIKE 000000";
                    flag = false;
                }
                if( re_transaction_password2 === "" )
                {
                    document.getElementById('re_transaction_password_error').innerHTML="RE-TRANSACTION PASSWORD CANNOT BE EMPTY";
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
                <a href="profile.jsp" class="previous-logo-design-div" title="Back To Profile Page">&#10094;</a>
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
                                <div class="col-md-4">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Add Account</strong> </center> <br>
                                </div>
                                <div class="col-md-4">

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
                        <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;" >
                            <div class="row">
                                <div class="col-md-6">
                                    <img alt="Add Bank" src="images/add_bank_account.jpg" height="710" width="100%" style="border-radius: 10px;" />
                                </div>
                                <div class="col-md-6 bank-add-and-transaction-password-div-design">
                                    <form method="POST" action="AddUserAccountsDetails" name="addaccountdetails" onsubmit="return validation()">
                                        <input type="text" name="email1" value="<jsp:expression>email</jsp:expression>" class="another_textfield_div_design" style="display: none;" /> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Select Bank *</label> 
                                        <select class="textfield_div_design" name="bank_name1" onkeyup="val('bank_name_error')">
                                            <option> Select Bank </option>
                                            <option> AP Mahesh Co-operative Urban Bank </option>
                                            <option> Abhyudaya Co-operative Bank </option>
                                            <option> Adarsh Co-operative Bank Limited </option>
                                            <option> Ahmedabad Mercantile Co-operative Bank </option>
                                            <option> Airtel Payments Bank Limited </option>
                                            <option> Andhra Pradesh Grameena Vikas Bank </option>
                                            <option> Andhra Pradesh State Co-operative Bank </option>
                                            <option> Andhra Pragathi Grameena Bank </option>
                                            <option> Apna Sahakari Bank </option>
                                            <option> Assam Gramin Vikash Bank </option>
                                            <option> Axis Bank </option>
                                            <option> Bandhan Bank </option>
                                            <option> Bank Of America </option>
                                            <option> Bank Of Baroda </option>
                                            <option> Bank Of India </option>
                                            <option> Bank Of Maharashtra </option>
                                            <option> Baroda Gujarat Gramin Bank </option>
                                            <option> Baroda UP Gramin Bank </option>
                                            <option> Bharat Co-operative Bank (Mumbai) </option>
                                            <option> Canara Bank </option>
                                            <option> Capital Small Finance Bank </option>
                                            <option> Catholic Syrian Bank </option>
                                            <option> Central Bank Of India </option>
                                            <option> Citibank </option>
                                            <option> Cosmos Bank </option>
                                            <option> DBS Bank </option>
                                            <option> DCB Bank </option>
                                            <option> Dhanlaxmi Bank </option>
                                            <option> Fino Payments Bank </option>
                                            <option> GP Parsik Bank </option>
                                            <option> Gujarat State Co-operative Bank </option>
                                            <option> HDFC Bank </option>
                                            <option> HSBC </option>
                                            <option> ICICI Bank </option>
                                            <option> IDBI Bank </option>
                                            <option> IDFC First Bank </option>
                                            <option> Indian Bank </option>
                                            <option> Indian Overseas Bank </option>
                                            <option> J&K Bank </option>
                                            <option> Janata Sahakari Bank </option>
                                            <option> Jio Payments Bank </option>
                                            <option> Karnataka Bank </option>
                                            <option> Kotak Mahindra Bank </option>
                                            <option> NAGRIK SAHAKARI BANK MYDT </option>
                                            <option> NKGSB Co-operative Bank </option>
                                            <option> Nagrik Sahakari Bank </option>
                                            <option> Nainital Bank </option>
                                            <option> PASCHIM BANGA GRAMIN BANK </option>
                                            <option> Paytm Payments Bank Ltd </option>
                                            <option> Punjab And Sind Bank </option>
                                            <option> Punjab National Bank </option>
                                            <option> RBL Bank </option>
                                            <option> Rajkot Nagarik Sahakari Bank </option>
                                            <option> Rajkot Peoples Co Op Bank Ltd </option>
                                            <option> SBM Bank India Ltd </option>
                                            <option> SHREE KADI NAGARIK SAHAKARI BANK </option>
                                            <option> SUCO SOUHARDA SAHAKARI BANK LTD </option>
                                            <option> Saraswat Bank </option>
                                            <option> Sarva Haryana Gramin Bank </option>
                                            <option> Saurashtra gramin Bank </option>
                                            <option> Shamrao Vithal Co-operative Bank </option>
                                            <option> Shivalik Small Finance Bank </option>
                                            <option> Shri Mahila Sewa Sahakari Bank Ltd </option>
                                            <option> South Indian Bank </option>
                                            <option> Standard Chartered Bank </option>
                                            <option> State Bank of India </option>
                                            <option> Surat Co Op Urban Bank Ltd </option>
                                            <option> Surat District Co-operative Bank </option>
                                            <option> Surat National Co-operative Bank </option>
                                            <option> Surat People's Co-operative Bank </option>
                                            <option> The Ahmedabad District Co-operative Bank </option>
                                            <option> TJSB Sahakari Bank </option>
                                            <option> Tamilnad Mercantile Bank </option>
                                            <option> Telangana grameena Bank </option>
                                            <option> Thane Bharat Sahakari Bank </option>
                                            <option> The Adarsh Co-operative Urban Bank Ltd </option>
                                            <option> The Jalgaon Peoples Co-Op. Bank Ltd </option>
                                            <option> The Urban Co Op Bank Ltd Dharangaon </option>
                                            <option> The Urban Co Operative Bank Ltd </option>
                                            <option> Tirupati Urban Co-op Bank Ltd </option>
                                            <option> Tripura Gramin Bank </option>
                                            <option> UCO Bank </option>
                                            <option> Ujjivan Small Finance Bank </option>
                                            <option> Union Bank Of India </option>
                                            <option> Uttarakhand Gramin Bank </option>
                                            <option> Vananchal Gramin Bank </option>
                                            <option> Vasai Vikas Sahakari Bank </option>
                                            <option> Visakhapatnam Co-operative Bank Limited </option>
                                            <option> Vishweshwar Sahakari Bank </option>
                                            <option> YES Bank </option>
                                        </select> <br> <span id="bank_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Acc. No *</label> 
                                        <input type="password" name="account_no1" placeholder="Your Account No" class="textfield_div_design" onkeyup="val('account_no_error')" /> <br> <span id="account_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Re-Acc. No *</label> 
                                        <input type="number" name="re_account_no1" placeholder="Re-Enter Account No" class="textfield_div_design" onkeyup="val('re_account_no_error')" /> <br> <span id="re_account_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Bank IFSC *</label> 
                                        <input type="text" name="bank_ifsc1" placeholder="Bank IFSC" class="textfield_div_design" onkeyup="val('bank_ifsc_error')" /> <br> <span id="bank_ifsc_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Holder Name *</label> 
                                        <input type="text" name="account_holder_name1" placeholder="Account Holder Name" class="textfield_div_design" onkeyup="val('account_holder_name_error')" /> <br> <span id="account_holder_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Mobile No *</label> 
                                        <input type="number" name="mobile_no1" placeholder="Mobile No" class="textfield_div_design" onkeyup="val('mobile_no_error')" /> <br> <span id="mobile_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Trans. Pwd *</label> 
                                        <input type="password" name="transaction_password1" placeholder="Transaction Password" class="textfield_div_design" onkeyup="val('transaction_password_error')" /> <br> <span id="transaction_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Re-Trns. Pwd *</label> 
                                        <input type="password" name="re_transaction_password1" placeholder="Re-Enter Transaction Password" class="textfield_div_design" onkeyup="val('re_transaction_password_error')" /> <br> <span id="re_transaction_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <input type="submit" value="Add Bank" class="btn upload-image-button-design-div" /> <br><br>
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
