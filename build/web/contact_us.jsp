<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>

    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    //     *** Condition Part *** 

</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Contact Us </title>

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

                var name2 = document.contactusform.name1.value;
                var email2 = document.contactusform.email1.value;
                var subject2 = document.contactusform.subject1.value;
                var message2 = document.contactusform.message1.value;

                /*
                 * @type RegEx Validation using JavaScript
                 */
                var name_pattern = /^[a-zA-Z-0-9 ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var subject_pattern = /^[a-zA-Z-0-9 ]{3,100}$/;
                var message_pattern = /^[a-zA-Z-0-9 . , / ]{3,2500}$/;


                // --------------------- Validation Start -------------------------

                if (!name2.match(name_pattern))
                {
                    document.getElementById('name_error').innerHTML = "NAME IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (name2 === "")
                {
                    document.getElementById('name_error').innerHTML = "NAME CANNOT BE EMPTY";
                    flag = false;
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

                if (!subject2.match(subject_pattern))
                {
                    document.getElementById('subject_error').innerHTML = "SUBJECT IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (subject2 === "")
                {
                    document.getElementById('subject_error').innerHTML = "SUBJECT CANNOT BE EMPTY";
                    flag = false;
                }

                if (!message2.match(message_pattern))
                {
                    document.getElementById('message_error').innerHTML = "MESSAGE IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (message2 === "")
                {
                    document.getElementById('message_error').innerHTML = "MESSAGE CANNOT BE EMPTY";
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
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <img alt="" src="images/contact_us_img.jpg" height="700" width="100%"/>
                
                <div class="col-md-12">

                    <br><br><br>

                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-8" style="border: 1px solid #cccccc; box-shadow: 5px 5px 5px #ffe8cb; border-radius: 10px; background-color: #f7fbdc;">
                            <div class="row">
                                <div class="col-md-6" style="margin-top: 150px; padding: 0 45px; float: right;">
                                    <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-home"> </i> &nbsp;&nbsp; 309, 3rd Floor, Padmibai Tower, Opp Subway </span> <br>
                                    <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Near ICICI Bank Virar (East), Palghar, 401305 </p>
                                    <br>

                                    <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-earphone"> </i> &nbsp;&nbsp; +91 6294160823 </span> <br>
                                    <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mon to Sat - 9am to 8 pm </p>
                                    <br>
                                    <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-envelope"> </i> &nbsp;&nbsp; juliasbiswas0001@gmail.com </span> <br>
                                    <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send us your query anytime! </p>
                                    <br>
                                </div>
                                <div class="col-md-6">
                                    <jsp:scriptlet>
                                            if (email == null ? email == null : email.trim().equals("null")) {
                                    </jsp:scriptlet>
                                    <form method="POST" action="UserContactUsDetails" name="contactusform" onsubmit="return validation()">
                                        <strong style="font-size: 30px; margin-left: 70px; color: #009966;"> Contact Us </strong> <br><br>

                                        <input type="text" placeholder="Enter Name" name="name1" class="another_textfield_div_design" onkeyup="val('name_error')" /> <br> <span id="name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <input type="text" placeholder="Enter Email" name="email1" class="another_textfield_div_design" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <input type="text" placeholder="Enter Subject" name="subject1" class="another_textfield_div_design" onkeyup="val('subject_error')" /> <br> <span id="subject_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br> 
                                        <textarea class="textarea_div_design" placeholder="Enter Message" name="message1" onkeyup="val('message_error')"></textarea> <br> <span id="message_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <input type="submit" value="Send" class="btn upload-image-button-design-div" /> <br><br>
                                    </form>
                                    <jsp:scriptlet>
                                        } else {
                                    </jsp:scriptlet>
                                    <form method="POST" action="UserContactUsDetails" name="contactusform" onsubmit="return validation()">
                                        <strong style="font-size: 30px; margin-left: 70px; color: #009966;"> Contact Us </strong> <br><br>

                                        <input type="text" placeholder="Enter Name" name="name1" class="another_textfield_div_design" value="<jsp:expression>name</jsp:expression>" readonly="readonly" onkeyup="val('name_error')"/> <br> <span id="name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                        <input type="text" placeholder="Enter Email" name="email1" class="another_textfield_div_design" value="<jsp:expression>email</jsp:expression>" readonly="readonly" onkeyup="val('email_error')"/> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                            <input type="text" placeholder="Enter Subject" name="subject1" class="another_textfield_div_design" onkeyup="val('subject_error')" /> <br> <span id="subject_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                            <textarea class="textarea_div_design" placeholder="Enter Message" name="message1" onkeyup="val('message_error')" ></textarea> <br> <span id="message_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                            <input type="submit" value="Send" class="btn upload-image-button-design-div" /> <br><br>
                                        </form>
                                    <jsp:scriptlet>
                                            }
                                    </jsp:scriptlet>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                    <br><br><br>
                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-8">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d60190.77510536492!2d72.80969972830877!3d19.458867238448786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7a9a990555d11%3A0xf2d4abe05268aece!2sVirar%20East%2C%20Virar%2C%20Maharashtra%20401305!5e0!3m2!1sen!2sin!4v1642075151742!5m2!1sen!2sin" width="100%" height="450" style="border:0; border-radius: 15px;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>

                <br><br><br>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
