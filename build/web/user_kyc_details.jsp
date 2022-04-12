<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.royalworld.database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>

    Connection con = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
    
    String aadhaar_no = null;
    String pan_no = null;
    
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String sponser_name = (String) session.getAttribute("session_sponser_name");
    String contact_no = (String) session.getAttribute("session_contact_no");
    String profile_pic = (String) session.getAttribute("session_profile_pic");

    //         ***  Condition Part  ***
    if (name.equals("") || name == null) {
        response.sendRedirect("login.jsp");
    }
    if (sponser_name == null || sponser_name.equals("")) {
        sponser_name = "- Not Available -";
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> RoyalWorld : KYC Details </title>

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
                
                var aadhaar_no2 = document.aadhaarpanform.aadhaar_no1.value;
                var pan_no2 = document.aadhaarpanform.pan_no1.value;
                
                /*
                 * @type RegEx Validation using JavaScript
                 */
                var aadhaar_pattern = /^[0-9]{12}$/;
                var pan_pattern = /^[A-Z-0-9]{10}$/;
                
                
                // ----------   Validation Start   ----------
                
                if( !aadhaar_no2.match(aadhaar_pattern) )
                {
                    document.getElementById('aadhaar_no_error').innerHTML="AADHAAR NO IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( aadhaar_no2 === "" )
                {
                    document.getElementById('aadhaar_no_error').innerHTML="AADHAAR NO CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !pan_no2.match(pan_pattern) )
                {
                    document.getElementById('pan_no_error').innerHTML="PAN NO IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( pan_no2 === "" )
                {
                    document.getElementById('pan_no_error').innerHTML="PAN NO CANNOT BE EMPTY";
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

                <jsp:scriptlet>
                try
                {
                    con = DBConnection.getConnect();
                    
                    
                    ps1 = con.prepareStatement("SELECT * FROM update_kyc_details WHERE email=?");
                    
                    ps1.setString(1, email);
                    
                    
                    rs1 = ps1.executeQuery();
                    
                    if( rs1.next() )
                    {
                        aadhaar_no = rs1.getString("aadhaar_no");
                        pan_no = rs1.getString("pan_no");
                    }
                }
                catch(Exception e)
                {
                    out.print("Exception : "+e);
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
                
                <br><br>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8" style="background-color: #ebfdfe; border: 1px solid #ccffff; box-shadow: 2px 2px 2px #ccffff; border-radius: 10px;">
                            <div class="row">
                                <div class="col-md-3">
                                    
                                </div>
                                <div class="col-md-6">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Update KYC Details</strong> </center> <br>
                                </div>
                                <div class="col-md-3">

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
                                    <img alt="Update KYC" src="images/aadhaar_pan_card.jpg" height="270" width="100%" style="border-radius: 10px;" />
                                </div>
                                <div class="col-md-6 bank-add-and-transaction-password-div-design">
                                    <form method="POST" action="UploadAadhaarAndPanCardNumber" name="aadhaarpanform" onsubmit="return validation()">
                                        <input type="text" name="email1" value="<jsp:expression>email</jsp:expression>" class="another_textfield_div_design" style="display: none;" /> <br>
                                        <label for="name" style="text-align: left!important; width: 25%;"> Aadhaar No *</label> 
                                        <input type="number" name="aadhaar_no1" placeholder="Your Aadhaar No" value="<jsp:expression>aadhaar_no</jsp:expression>" class="textfield_div_design" onkeyup="val('aadhaar_no_error')" /> <br> <span id="aadhaar_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 25%;"> PAN No *</label> 
                                        <input type="text" name="pan_no1" placeholder="Your PAN No" value="<jsp:expression>pan_no</jsp:expression>" class="textfield_div_design" onkeyup="val('pan_no_error')" /> <br> <span id="pan_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                    <input type="submit" value="Update" class="btn upload-image-button-design-div" /> <br><br><br>
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
