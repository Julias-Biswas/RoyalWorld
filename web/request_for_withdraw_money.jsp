<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Request Withdraw Money </title>

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
                document.getElementById(v).innerHTML = "";
            }

            function validation()
            {
                var flag = true;

                var email2 = document.requestmoneyfromuserside.email1.value;
                var bank_name2 = document.requestmoneyfromuserside.bank_name1.value;
                var acc_no2 = document.requestmoneyfromuserside.acc_no1.value;
                var re_acc_no2 = document.requestmoneyfromuserside.re_acc_no1.value;
                var bank_ifsc2 = document.requestmoneyfromuserside.bank_ifsc1.value;
                var mobile_no2 = document.requestmoneyfromuserside.mobile_no1.value;
                var acc_holder_name2 = document.requestmoneyfromuserside.acc_holder_name1.value;
                var request_money2 = document.requestmoneyfromuserside.request_money1.value;

                /*
                 * @type RegEx Validation using JavaScript
                 */
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var account_no_pattern = /^[0-9]{10,15}$/;
                var bank_ifsc_pattern = /^[A-Z0-9]{11}$/;
                var account_holder_name_pattern = /^[a-zA-Z ]{3,30}$/;
                var mobile_no_pattern = /^[0-9]{10}$/;

                // --------------------- Validation Start -------------------------

                if( bank_name2 === "Select Bank")
                {
                    document.getElementById('bank_name_error').innerHTML="PLEASE SELECT ANY BANK";
                    flag = false;
                }
                else
                {
                    document.getElementById('bank_name_error').innerHTML="";
                    flag = true;
                }

                if (request_money2 === "Select Amount")
                {
                    document.getElementById('select_money_error').innerHTML = "PLEASE SELECT AMOUNT";
                    flag = false;
                }
                else
                {
                    document.getElementById('select_money_error').innerHTML = "";
                    flag = true;
                }

                if (!email2.match(email_pattern))
                {
                    document.getElementById('email_error').innerHTML = "EMAIL IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (email2 === "")
                {
                    document.getElementById('email_error').innerHTML = "EMAIL CANNOT BE EMPTY";
                    flag = false;
                }

                if (!acc_no2.match(account_no_pattern))
                {
                    document.getElementById('acc_no_error').innerHTML = "ACCOUNT NO MUST BE BETWEEN 10 TO 15 DIGITS";
                    flag = false;
                }
                if (acc_no2 === "")
                {
                    document.getElementById('acc_no_error').innerHTML = "ACCOUNT NO CANNOT BE EMPTY";
                    flag = false;
                }

                if (!re_acc_no2.match(account_no_pattern))
                {
                    document.getElementById('re_acc_no_error').innerHTML = "RE-ACCOUNT NO MUST BE BETWEEN 10 TO 15 DIGITS";
                    flag = false;
                }
                if (re_acc_no2 === "")
                {
                    document.getElementById('re_acc_no_error').innerHTML = "RE-ACCOUNT NO CANNOT BE EMPTY";
                    flag = false;
                }

                if (!bank_ifsc2.match(bank_ifsc_pattern))
                {
                    document.getElementById('bank_ifsc_error').innerHTML = "IFSC SHOULD BE 11 DIGITS LIKE MYBANK00000";
                    flag = false;
                }
                if (bank_ifsc2 === "")
                {
                    document.getElementById('bank_ifsc_error').innerHTML = "IFSC CANNOT BE EMPTY";
                    flag = false;
                }

                if (!mobile_no2.match(mobile_no_pattern))
                {
                    document.getElementById('mobile_no_error').innerHTML = "MOBILE NO IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (mobile_no2 === "")
                {
                    document.getElementById('mobile_no_error').innerHTML = "MOBILE NO CANNOT BE EMPTY";
                    flag = false;
                }

                if (!acc_holder_name2.match(account_holder_name_pattern))
                {
                    document.getElementById('holder_name_error').innerHTML = "ACCOUNT HOLDER NAME IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (acc_holder_name2 === "")
                {
                    document.getElementById('holder_name_error').innerHTML = "ACCOUNT HOLDER NAME CANNOT BE EMPTY";
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

                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-8" style="border: 1px solid #ff66ff; box-shadow: 2px 2px 2px #ff00ff; border-radius: 10px;">
                            <strong  style="font-size: 35px; color: #ff0000;"> <center> © Money Withdraw Request © </center> </strong>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-6 forgot_password_div_design" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                            <form method="POST" action="RequestMoneyFromUserSide" name="requestmoneyfromuserside" onsubmit="return validation()">
                                <strong class="register_header"> Money Withdraw Request </strong> <br><br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Email * </label>
                                <input type="text" placeholder="Your Email" name="email1" class="textfield_div_design" value="<jsp:expression>email</jsp:expression>" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Select Bank *</label> 
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

                                <label for="name" style="text-align: left!important; width: 20%;"> Acc. No *</label>
                                <input type="password" placeholder="Your Account No" name="acc_no1" class="textfield_div_design" onkeyup="val('acc_no_error')" /> <br> <span id="acc_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Re-Acc. No *</label>
                                <input type="number" placeholder="Your Re-Account No" name="re_acc_no1" class="textfield_div_design" onkeyup="val('re_acc_no_error')" /> <br> <span id="re_acc_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                
                                <label for="name" style="text-align: left!important; width: 20%;"> Bank IFSC *</label>
                                <input type="text" placeholder="Your Bank IFSC" name="bank_ifsc1" class="textfield_div_design" onkeyup="val('bank_ifsc_error')" /> <br> <span id="bank_ifsc_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Mobile No * </label>
                                <input type="number" placeholder="Your Mobile No" name="mobile_no1" class="textfield_div_design" onkeyup="val('mobile_no_error')" /> <br> <span id="mobile_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Holder Name *</label>
                                <input type="text" placeholder="Your Acc. Holder Name" name="acc_holder_name1" class="textfield_div_design" onkeyup="val('holder_name_error')" /> <br> <span id="holder_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <label for="name" style="text-align: left!important; width: 20%;"> Amount *</label>
                                <select class="textfield_div_design" name="request_money1" onkeyup="val('select_money_error')">
                                    <option>Select Amount</option>
                                    <option>1000</option>
                                    <option>1500</option>
                                    <option>2000</option>
                                </select> <br> <span id="select_money_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                <input type="submit" value="Send Request" class="btn upload-image-button-design-div" /> <br><br>
                            </form>
                        </div>
                        <div class="col-md-3">

                        </div>
                    </div>

                        <br><br><br>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
