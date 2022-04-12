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
    
    String pphtu_745_ooo_tck_000_tr_00rt_2 = null;
    
    String email2 = null;
    String bank_name2 = null;
    String account_no2 = null;
    String bank_ifsc_no2 = null;
    String account_holder_name2 = null;
    String bank_register_mobile_no2 = null;
    
    Connection con = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;

</jsp:declaration>

<jsp:scriptlet>
    
    pphtu_745_ooo_tck_000_tr_00rt_2 = request.getParameter("pphtu-745-ooo-jdsh/jhhd-dtck-000-tr-00rt-0no/jhd000ssj-jbdsh-sbsj-shkj/nyter-ppp-e64/5-bdg-8765p/3-hdbyeh/kd-o092/jst/rlz:1C1UEAD_enIN950IN950/oq:ho/aqs:chrome.2.69i59l3j69i57j69i60l4.1521j0j7/sourceid:chrome/ie:UTF-8");
    
</jsp:scriptlet>

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
        <title> RoyalWorld : Edit Bank Account </title>

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
                
                var bank_name2 = document.updateaccountdetailsform.bank_name1.value;
                var account_no2 = document.updateaccountdetailsform.account_no1.value;
                var re_account_no2 = document.updateaccountdetailsform.re_account_no1.value;
                var bank_ifsc2 = document.updateaccountdetailsform.bank_ifsc1.value;
                var account_holder_name2 = document.updateaccountdetailsform.account_holder_name1.value;
                var mobile_no2 = document.updateaccountdetailsform.mobile_no1.value;
                
                
                /*
                * @type RegEx Validation using JavaScript
                */
                var account_no_pattern = /^[0-9]{10,15}$/;
                var bank_ifsc_pattern = /^[A-Z0-9]{11}$/;
                var account_holder_name_pattern = /^[a-zA-Z ]{3,30}$/;
                var mobile_no_pattern = /^[0-9]{10}$/;
                
                
                // --------------------- Validation Start -------------------------
                
                if( bank_name2 === "Selected Bank" )
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
                <a href="view_banks_details.jsp" class="previous-logo-design-div" title="Back To View All Banks Page">&#10094;</a>
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <jsp:scriptlet>
                    
                    try
                    {
                        con = DBConnection.getConnect();
                        
                        
                        ps1 = con.prepareStatement("SELECT * FROM user_account_details WHERE email=? AND id=?");
                        
                        ps1.setString(1, email);
                        ps1.setString(2, pphtu_745_ooo_tck_000_tr_00rt_2);
                        
                        
                        rs1 = ps1.executeQuery();
                        
                        
                        while( rs1.next() )
                        {
                            email2 = rs1.getString("email");
                            bank_name2  = rs1.getString("bank_name");
                            account_no2  = rs1.getString("account_no");
                            bank_ifsc_no2  = rs1.getString("bank_ifsc_no");
                            account_holder_name2  = rs1.getString("account_holder_name");
                            bank_register_mobile_no2  = rs1.getString("bank_register_mobile_no");
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
                                <div class="col-md-6">
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Edit Bank Account</strong> </center> <br>
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
                                    <img alt="Add Bank" src="images/edit_bank_account_details.jpg" height="560" width="100%" style="border-radius: 10px;" />
                                </div>
                                <div class="col-md-6 bank-add-and-transaction-password-div-design">
                                    <form method="POST" action="UpdateUserAccountsDetails" name="updateaccountdetailsform" onsubmit="return validation()">
                                        <input type="text" name="email1" value="<jsp:expression>email</jsp:expression>" class="another_textfield_div_design" style="display: none;" /> <br><br>
                                        <input type="text" name="bank_account_id1" value="<jsp:expression>pphtu_745_ooo_tck_000_tr_00rt_2</jsp:expression>" style="display: none;"/> 
                                        <label for="name" style="text-align: left!important; width: 28%;"> Select Bank *</label> 
                                        <select class="textfield_div_design" name="bank_name1" onkeyup="val('bank_name_error')">
                                            <option> <jsp:expression>bank_name2</jsp:expression> </option>
                                            <option> AP Mahesh Co-operative Urban Bank </option>
                                            <option> Abhyudaya Co-operative Bank </option>
                                            <option> Adarsh Co-operative Bank Limited </option>
                                            <option> Ahmedabad Mercantile Bank Limited </option>
                                            <option> Paytm Payments Bank Ltd </option>
                                            <option> Punjab National Bank </option>
                                            <option> DBS Bank </option>
                                            <option> Kotak Mahindra Bank </option>
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
                                        </select> <br> <span id="bank_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000; margin-left: 18%;"></span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Acc. No *</label> 
                                        <input type="password" name="account_no1" placeholder="Your Account No" value="<jsp:expression>account_no2</jsp:expression>" class="textfield_div_design" onkeyup="val('account_no_error')" /> <br> <span id="account_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Re-Acc. No *</label> 
                                        <input type="number" name="re_account_no1" placeholder="Re-Enter Account No" value="<jsp:expression>account_no2</jsp:expression>" class="textfield_div_design" onkeyup="val('re_account_no_error')" /> <br> <span id="re_account_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Bank IFSC *</label> 
                                        <input type="text" name="bank_ifsc1" placeholder="Bank IFSC" value="<jsp:expression>bank_ifsc_no2</jsp:expression>" class="textfield_div_design" onkeyup="val('bank_ifsc_error')" /> <br> <span id="bank_ifsc_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Holder Name *</label> 
                                        <input type="text" name="account_holder_name1" placeholder="Account Holder Name" value="<jsp:expression>account_holder_name2</jsp:expression>" class="textfield_div_design" onkeyup="val('account_holder_name_error')" /> <br> <span id="account_holder_name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                        <label for="name" style="text-align: left!important; width: 28%;"> Mobile No *</label> 
                                        <input type="number" name="mobile_no1" placeholder="Mobile No" value="<jsp:expression>bank_register_mobile_no2</jsp:expression>" class="textfield_div_design" onkeyup="val('mobile_no_error')" /> <br> <span id="mobile_no_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
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
