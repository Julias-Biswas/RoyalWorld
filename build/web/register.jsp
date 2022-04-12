<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page import="com.royalworld.database.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<jsp:declaration>

    String user_sponser_email2 = null;
    String user_sponser_id2 = null;
    String user_sponser_name2 = null;
    String user_sponser_contact_no2 = null;

    
    Connection con = null;
    
    PreparedStatement ps1 = null;
    
    ResultSet rs1 = null;

</jsp:declaration>

<jsp:scriptlet>

    user_sponser_id2 = request.getParameter("sponser_id");
    
</jsp:scriptlet>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Sign Up </title>

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

                var position2 = document.regform.position1.value;
                var name2 = document.regform.user_name1.value;
                var email2 = document.regform.user_email1.value;
                var contact_no2 = document.regform.user_contact_no1.value;
                var password2 = document.regform.user_password1.value;
                var confirm_password2 = document.regform.user_confirm_password1.value;
                var state2 = document.regform.user_state1.value;

                /*
                 * @type RegEx Validation using JavaScript
                 */
                var name_pattern = /^[a-zA-Z-0-9 ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var phone_pattern = /^[0-9]{10}$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;


                // --------------------- Validation Start -------------------------

                if (position2 === "")
                {
                    document.getElementById('position_error').innerHTML = "PLEASE SELECT ANY POSITION";
                    flag = false;
                }
                else
                {
                    document.getElementById('position_error').innerHTML = "";
                    flag = false;
                }

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

                if (!contact_no2.match(phone_pattern))
                {
                    document.getElementById('contact_error').innerHTML = "CONTACT IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (contact_no2 === "")
                {
                    document.getElementById('contact_error').innerHTML = "CONTACT CANNOT BE EMPTY";
                    flag = false;
                }

                if (!password2.match(password_pattern))
                {
                    document.getElementById('password_error').innerHTML = "PASSWORD CONTAIN LIKE Java@1991";
                    flag = false;
                }
                if (password2 === "")
                {
                    document.getElementById('password_error').innerHTML = "PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }

                if (!confirm_password2.match(password_pattern))
                {
                    document.getElementById('confirm_password_error').innerHTML = "PASSWORD CONTAIN LIKE Java@1991 ";
                    flag = false;
                }
                if (confirm_password2 === "")
                {
                    document.getElementById('confirm_password_error').innerHTML = "PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }

                if (state2 === "Select State")
                {
                    document.getElementById('state_error').innerHTML = "PLEASE SELECT ANY STATE";
                    flag = false;
                }
                else
                {
                    document.getElementById('state_error').innerHTML = "";
                    flag = true;
                }

                return flag;
            }
        </script>


    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="header.jsp" ></jsp:include>

                <jsp:scriptlet>

                    try 
                    {
                        con = DBConnection.getConnect();

                        ps1 = con.prepareStatement("SELECT * FROM user_sponser_details WHERE user_sponser_id=?");

                        ps1.setString(1, user_sponser_id2);

                        rs1 = ps1.executeQuery();

                        if (rs1.next())
                        {
                            user_sponser_email2 = rs1.getString("email");
                            user_sponser_id2 = rs1.getString("user_sponser_id");
                            user_sponser_name2 = rs1.getString("user_sponser_name");
                            user_sponser_contact_no2 = rs1.getString("user_sponser_contact_no");
                        }
                    } 
                    catch (Exception e) 
                    {
                        out.print("Exception : " + e);
                    }
                    finally
                    {
                        try
                        {
                            rs1.close();
                            ps1.close();
                            con.close();
                        }
                        catch(Exception e)
                        {
                            out.print("Another Exception : "+e);
                        }
                    }
                    
                </jsp:scriptlet>

                <br>
                <div class="col-md-12">
                    <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                        <div class="col-md-5">
                            <img alt="Register Image" src="images/register_img.png" height="500" width="100%" />
                        </div>
                        <div class="col-md-7 register_div_design" >
                            <form action="Register" method="POST" name="regform" onsubmit="return validation()">
                                <strong class="register_header"> Sign Up </strong> <br><br>
                                
                                    <jsp:scriptlet>
                                        if( user_sponser_id2 == null || user_sponser_id2.equals("") )
                                        {
                                    </jsp:scriptlet>
                                            
                                            <label for="name" style="text-align: left!important; width: 20%;"> Sponser Id *</label>
                                            <input type="text" placeholder="Sponser Id" class="textfield_div_design" name="sponser_id1" value="" />  <br><br>

                                            <label for="name" style="text-align: left!important; width: 20%;"> Sponser Name *</label>
                                            <input type="text" placeholder="Sponser Name" class="textfield_div_design" name="sponser_name1" value="" /> <br><br>

                                            <input type="text" name="sponser_contact_no1" value="" style="display: none;" /> <br>
                                            <input type="text" name="user_sponser_email1" value="" style="display: none;" /> <br>

                                    <jsp:scriptlet>
                                        }
                                        else
                                        {
                                    </jsp:scriptlet>
                                                
                                            <label for="name" style="text-align: left!important; width: 20%;"> Sponser Id *</label>
                                            <input type="text" placeholder="Sponser Id" class="textfield_div_design" name="sponser_id1" value="<jsp:expression>user_sponser_id2</jsp:expression>" />  <br><br>

                                            <label for="name" style="text-align: left!important; width: 20%;"> Sponser Name *</label>
                                            <input type="text" placeholder="Sponser Name" class="textfield_div_design" name="sponser_name1" value="<jsp:expression>user_sponser_name2</jsp:expression>" /> <br><br>

                                            <input type="text" name="sponser_contact_no1" value="<jsp:expression>user_sponser_contact_no2</jsp:expression>" style="display: none;" /> <br>
                                            <input type="text" name="user_sponser_email1" value="<jsp:expression>user_sponser_email2</jsp:expression>" style="display: none;" /> <br>
                                            
                                    <jsp:scriptlet>
                                            
                                        }
                                    </jsp:scriptlet>
                            
                                    <label for="name" style="text-align: left!important; width: 38%;">Position *</label>
                                    <input type="radio" value="Left" name="position1" onkeyup="val('position_error')" /> Left <input type="radio" value="Right" name="position1" onkeyup="val('position_error')" /> Right <br> <span id="position_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"> </span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Full Name *</label> 
                                    <input type="text" placeholder="Your Full Name" class="textfield_div_design" name="user_name1" onkeyup="val('name_error')" /> <br> <span id="name_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"> </span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Email *</label>
                                    <input type="text" placeholder="Your Email" class="textfield_div_design" name="user_email1" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Contact No *</label>
                                    <input type="number" placeholder="Your Contact No" class="textfield_div_design" name="user_contact_no1" onkeyup="val('contact_error')" /> <br> <span id="contact_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Password *</label>
                                    <input type="password" placeholder="Your password" class="textfield_div_design" name="user_password1" onkeyup="val('password_error')" /> <br> <span id="password_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Confirm Password *</label>
                                    <input type="password" placeholder="Confirm Password" class="textfield_div_design" name="user_confirm_password1" onkeyup="val('confirm_password_error')" /> <br> <span id="confirm_password_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                    <label for="name" style="text-align: left!important; width: 20%;"> Select State *</label>
                                    <select class="textfield_div_design" name="user_state1" onkeyup="val('state_error')">
                                        <option> Select State </option>
                                        <option> Andhra Pradesh </option>
                                        <option> Arunachal Pradesh </option>
                                        <option> Assam </option>
                                        <option> Bihar </option>
                                        <option> Chhattisgarh </option>
                                        <option> Goa </option>
                                        <option> Gujarat </option>
                                        <option> Haryana </option>
                                        <option> Himachal Pradesh </option>
                                        <option> Jharkhand </option>
                                        <option> Karnataka </option>
                                        <option> Kerala </option>
                                        <option> Madhya Pradesh </option>
                                        <option> Maharashtra </option>
                                        <option> Manipur </option>
                                        <option> Meghalaya </option>
                                        <option> Mizoram </option>
                                        <option> Nagaland </option>
                                        <option> Odisha </option>
                                        <option> Punjab </option>
                                        <option> Rajasthan </option>
                                        <option> Sikkim </option>
                                        <option> Tamil Nadu </option>
                                        <option> Telangana </option>
                                        <option> Tripura </option>
                                        <option> Uttar Pradesh </option>
                                        <option> Uttarakhand </option>
                                        <option> West Bengal </option>
                                    </select> <br> <span id="state_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>

                                    <input type="checkbox" value="agree" name="term_and_condition1" onkeyup="val('term_condition_error')" /> I agree the <a href="term_and_conditions.jsp">term and condition</a> <br> <span id="term_condition_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>       

                                    <input type="submit" value="Sign Up" class="btn upload-image-button-design-div" style="color: #ffffff;" /> <br><br>

                                    <strong style="color: #009999; font-size: 18px;"> OR </strong> <br><br>

                                    <span style="color: #666666;"> Already have an account? </span>
                                    <a href="login.jsp" class="login_href_design"> Login </a>

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
