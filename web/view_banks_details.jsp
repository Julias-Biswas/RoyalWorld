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

    String pphtu_745_ooo_tck_000_tr = null;
    String email2 = null;
    String bank_name2 = null;
    String account_no2 = null;
    String bank_ifsc_no2 = null;
    String account_holder_name2 = null;
    String bank_register_mobile_no2 = null;
    String money_transaction_password2 = null;
    
    String last_four_digits = null;
    String fast_x_digits[] = null;

</jsp:declaration>

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
        <title> RoyalWorld : View Bank </title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link rel="stylesheet" href="css/style.css" />

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
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">View All Banks</strong> </center> <br>
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
                        <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                            <div class="row">
                                <div class="col-md-1">
                                    <!--<img alt="" src="images/all_bank_accounts.png" class="image-height-auto-increment-div-design" />-->
                                </div>
                                <div class="col-md-11">
                                    <jsp:scriptlet>
                
                                        try
                                        {
                                            con = DBConnection.getConnect();
                                            
                                            ps1 = con.prepareStatement("SELECT * FROM user_account_details WHERE email=?");
                                            
                                            ps1.setString(1, email);
                                            
                                            
                                            rs1 = ps1.executeQuery();
                                            
                                            
                                            while( rs1.next() )
                                            {
                                                pphtu_745_ooo_tck_000_tr = rs1.getString("id");
                                                email2 = rs1.getString("email");
                                                bank_name2 = rs1.getString("bank_name");
                                                account_no2 = rs1.getString("account_no");
                                                bank_ifsc_no2 = rs1.getString("bank_ifsc_no");
                                                account_holder_name2 = rs1.getString("account_holder_name");
                                                bank_register_mobile_no2 = rs1.getString("bank_register_mobile_no");
                                                money_transaction_password2 = rs1.getString("money_transaction_password");

                                    </jsp:scriptlet>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-11 view-all-banks-and-edit-delete-all-banks-div-design">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <form method="POST" action="RemoveUserAccountDetails?pphtu-745-ooo-jdsh/jhhd-dtck-000-tr-00rt-0no/jhd000ssj-jbdsh-sbsj-shkj/nyter-ppp-e64/5-bdg-8765p/3-hdbyeh/kd-o092/jst/rlz:1C1UEAD_enIN950IN950/oq:ho/aqs:chrome.2.69i59l3j69i57j69i60l4.1521j0j7/sourceid:chrome/ie:UTF-8=<jsp:expression>pphtu_745_ooo_tck_000_tr</jsp:expression>" title="Remove Bank" class="bank-update-and-remove-div-design">
                                                                <input type="text" name="bank_account_id1" value="<jsp:expression>pphtu_745_ooo_tck_000_tr</jsp:expression>" style="display: none;"/> 
                                                                <input type="text" name="email1" value="<jsp:expression>email2</jsp:expression>" style="display: none;"/>
                                                                <input type="text" name="account_no1" value="<jsp:expression>account_no2</jsp:expression>" style="display: none;"/>
                                                                <button class="glyphicon glyphicon-trash" type="submit" value="" style="border: 0px solid #ffffff;"></button>
                                                            </form> 
                                                            <a href="edit_user_bank_details.jsp?pphtu-745-ooo-jdsh/jhhd-dtck-000-tr-00rt-0no/jhd000ssj-jbdsh-sbsj-shkj/nyter-ppp-e64/5-bdg-8765p/3-hdbyeh/kd-o092/jst/rlz:1C1UEAD_enIN950IN950/oq:ho/aqs:chrome.2.69i59l3j69i57j69i60l4.1521j0j7/sourceid:chrome/ie:UTF-8=<jsp:expression>pphtu_745_ooo_tck_000_tr</jsp:expression>" title="Edit Bank" class="bank-update-and-remove-div-design">
                                                                <span class="glyphicon glyphicon-pencil"></span>
                                                            </a>
                                                            <img alt="" src="images/my_all_bank_1.jpg" height="50" width="50" style="border: 1px solid #ffffff; border-radius: 50%; float: left;" /> 
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <span style="font-size: 18px; color: #000000; font-weight: 900;"> <jsp:expression>bank_name2</jsp:expression> </span> <br>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <span> <jsp:expression>account_holder_name2</jsp:expression> </span> <br>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <span> <jsp:expression>account_no2</jsp:expression> </span> <br> 
                                                            <span style="display: none;"> <jsp:expression>pphtu_745_ooo_tck_000_tr</jsp:expression></span>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="col-md-1">

                                                </div> 
                                            </div> 
                                        </div>
                                    </div>
                                    <jsp:scriptlet>
                                            }
                                        }
                                        catch(Exception e)
                                        {
                                            out.print("Exception :"+e);
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
