<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page import="com.royalworld.database.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>

    Connection con = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
    
    String father_name2 = null;
    String mother_name2 = null;
    String address2 = null;
    String city2 = null;
    String state2 = null;
    String country2 = null;
    String pin2 = null;

</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String sponser_id = (String) session.getAttribute("session_sponser_id");
    String sponser_name = (String) session.getAttribute("session_sponser_name");
    String position = (String) session.getAttribute("session_position");
    String contact_no = (String) session.getAttribute("session_contact_no");
    String state = (String) session.getAttribute("session_state");
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
        <title> RoyalWorld : Update Profile </title>

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
                
                var father_name2 = document.edituserprofileaboutdetailsform.father_name1.value;
                var state2 = document.edituserprofileaboutdetailsform.state1.value;
                var country2 = document.edituserprofileaboutdetailsform.country1.value;
                var pin_code2 = document.edituserprofileaboutdetailsform.pin_code1.value;
                
                /*
                 * @type RegEx Validation using JavaScript
                 */
                var father_name_pattern = /^[a-zA-Z ]{3,30}$/;
                var state_pattern =/^[a-zA-Z ]{3,30}$/;
                var country_pattern=/^[a-zA-Z ]{3,30}$/;
                var pin_code_pattern = /^[0-9]{6}$/;
                
                
                // --------------------- Validation Start -------------------------
                
                if( !father_name2.match(father_name_pattern) )
                {
                    document.getElementById('father_name_error').innerHTML="FATHER NAME IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( father_name2 === "" )
                {
                    document.getElementById('father_name_error').innerHTML="FATHER NAME CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !state2.match(state_pattern) )
                {
                    document.getElementById('state_error').innerHTML="STATE IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( state2 === "" )
                {
                    document.getElementById('state_error').innerHTML="STATE CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( !country2.match(country_pattern) )
                {
                    document.getElementById('country_error').innerHTML="COUNTRY IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( country2 === "" )
                {
                    document.getElementById('country_error').innerHTML="COUNTRY CANNOT BE EMPTY";
                }
                
                if( !pin_code2.match(pin_code_pattern) )
                {
                    document.getElementById('pin_code_error').innerHTML="PIN NO IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if( pin_code2 === "" )
                {
                    document.getElementById('pin_code_error').innerHTML="PIN NO CANNOT BE EMPTY";
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
                        
                        
                        ps1 = con.prepareStatement("SELECT * FROM update_user_details WHERE email=?");
                        
                        ps1.setString(1, email);
                        
                        
                        rs1 = ps1.executeQuery();
                        
                        if( rs1.next() )
                        {
                            father_name2 = rs1.getString("father_name");
                            mother_name2 = rs1.getString("mother_name");
                            address2 = rs1.getString("address");
                            city2 = rs1.getString("city");
                            state2 = rs1.getString("state");
                            country2 = rs1.getString("country");
                            pin2 = rs1.getString("pin");
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
                                <div class="col-md-4">
                                    
                                </div>
                                <div class="col-md-4">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Update Profile</strong> </center> <br>
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
                                    <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="180" width="180" style="border: 0.5px solid #cccccc; border-radius: 50%; image-resolution: normal;" />
                                </div>
                                <div class="col-md-8 col-sm-8">
                                    <b style="color: #6600cc; font-size: 16px;"> Name : <span style="color: #000000; font-size: 16px;"> <jsp:expression>name</jsp:expression> </span> </b> <br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Email : <span style="color: #000000; font-size: 16px;"> <jsp:expression>email</jsp:expression> </span> </b>  <br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Mobile No : <span style="color: #000000; font-size: 16px;"> <jsp:expression>contact_no</jsp:expression> </span> </b>  <br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Sponsor : </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>sponser_name</jsp:expression>(<jsp:expression>sponser_id</jsp:expression>) </span><br><br>
                                    <b style="color: #6600cc; font-size: 16px;"> Position :  </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>position</jsp:expression> </span> <br>
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
                                    <img alt="Upload More Documents" src="images/upload_more_documents.jpg" height="700" width="100%" />
                                </div>
                                <div class="col-md-6 about-user-and-more-details-div-design">
                                    <form method="POST" action="EditUserProfileAboutDetails" name="edituserprofileaboutdetailsform" onsubmit="return validation()">
                                        <input type="text" name="email1" class="textfield_div_design" value="<jsp:expression>email</jsp:expression>" style="display: none;" /> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Father Name *</label> 
                                        <input type="text" name="father_name1" placeholder="Your Father Name " class="textfield_div_design" value="<jsp:expression>father_name2</jsp:expression>" onkeyup="val('father_name_error')" /> <br> <span id="father_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Mother Name </label> 
                                        <input type="text" name="mother_name1" placeholder="Your Mother Name" class="textfield_div_design" value="<jsp:expression>mother_name2</jsp:expression>" /> <br><br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Address </label> 
                                        <input type="text" name="address1" placeholder="Your Address" class="textfield_div_design" value="<jsp:expression>address2</jsp:expression>"/> <br><br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> City </label> 
                                        <input type="text" name="city1" placeholder="Your City" class="textfield_div_design" value="<jsp:expression>city2</jsp:expression>"/> <br><br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> State *</label> 
                                        <input type="text" name="state1" placeholder="Your State" class="textfield_div_design" value="<jsp:expression>state2</jsp:expression>" onkeyup="val('state_error')" /> <br> <span id="state_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Country *</label> 
                                        <input type="text" name="country1" placeholder="Your Country" class="textfield_div_design" value="<jsp:expression>country2</jsp:expression>" onkeyup="val('country_error')" /> <br> <span id="country_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Pin *</label> 
                                        <input type="number" name="pin_code1" placeholder="Your Pin Code" class="textfield_div_design" value="<jsp:expression>pin2</jsp:expression>" onkeyup="val('pin_code_error')" /> <br> <span id="pin_code_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
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
