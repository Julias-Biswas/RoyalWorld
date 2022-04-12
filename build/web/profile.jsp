<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.royalworld.database.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>

    String user_sponser_id2 = null;
    String user_sponser_name2 = null;
    String user_sponser_contact_no2 = null;
    
    
    Connection con = null;
    
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    PreparedStatement ps4 = null;
    PreparedStatement ps5 = null;
    PreparedStatement ps6 = null;
    PreparedStatement ps7 = null;
    PreparedStatement ps8 = null;
    PreparedStatement ps9 = null;
    PreparedStatement ps10 = null;
    PreparedStatement ps11 = null;
    PreparedStatement ps12 = null;
    PreparedStatement ps13 = null;
    PreparedStatement ps14 = null;
    PreparedStatement ps15 = null;
    PreparedStatement ps16 = null;
    PreparedStatement ps17 = null;
    PreparedStatement ps18 = null;
    PreparedStatement ps19 = null;
    
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    ResultSet rs5 = null;
    ResultSet rs6 = null;
    ResultSet rs7 = null;
    ResultSet rs8 = null;
    ResultSet rs9 = null;
    ResultSet rs10 = null;
    ResultSet rs11 = null;
    ResultSet rs12 = null;
    ResultSet rs13 = null;
    
    
    int total_tasks2 = 0;
    int climb_user_tasks2 = 0;
    
    int sumEveryDayTasks;
    
    String date2 = null;
    String time2 = null;
    
    ArrayList al ;
    
    String plan_no2 = null;
    String plan_cost2 = null;
    String plan_active_or_not2 = null;
    
    double percentageOfEveryPlanCost;
    int amount ;
    
    double userSponserIncome = 0;
    double userSponserTotalIncome = 0;
    
    String userBuyPlanNo2 = null;
    String userBuyPlanCost2 = null;
    String userPlanActiveOrNot2 = null;
    
    ArrayList al2 ;
    
    double sumOfUserSponserTotalIncome ;
    
    int numberOfReferPerson ;
    
    String sponsed_email2 = null;
    
    String plan_no22 = null;
    String plan_cost22 = null;
    String plan_active_or_not22 = null;
    
    String plan_no222 = null;
    String plan_cost222 = null;
    
    int total_balance222 ;
    
    String mySharedUserSponsedEmail = null;
        
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String password = (String) session.getAttribute("session_password");
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
        sponser_name = "----- Not Available -----";
    }
    if (position == null || position.equals("")) {
        position = "----- Not Avaliable -----";
    }
</jsp:scriptlet>

<jsp:scriptlet>

    try
    {
        con = DBConnection.getConnect();
        
        ps1 = con.prepareStatement("SELECT * FROM user_sponser_details WHERE email=?");
        
        ps1.setString(1, email);
        
        rs1 = ps1.executeQuery();
        
        if( rs1.next() )
        {
            user_sponser_id2 = rs1.getString("user_sponser_id");
            user_sponser_name2 = rs1.getString("user_sponser_name");
            user_sponser_contact_no2 = rs1.getString("user_sponser_contact_no");
        }
    }
    catch(Exception e)
    {
        out.print("Exception 1 : "+e);
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
            out.print("Another Exception 1 : "+e);
        }
    }
    
</jsp:scriptlet>

<jsp:scriptlet>

    al = new ArrayList();

    Date d = new Date();
                                
    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
    date2 = sdf1.format(d);
    
    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
    time2 = sdf2.format(d);
    
    try
    {
        con = DBConnection.getConnect();
        
        ps2 = con.prepareStatement("SELECT * FROM every_day_climb_task_numbers WHERE user_email=?");
        
        ps2.setString(1, email);
        
        rs2 = ps2.executeQuery();
        
        while( rs2.next() )
        {
            total_tasks2 = rs2.getInt("total_tasks");
            climb_user_tasks2 = rs2.getInt("climb_user_tasks");
            
            al.add(climb_user_tasks2);
        }
        
    }
    catch(Exception e)
    {
        out.print("Exception 2 : "+e);
    }
    finally
    {
        try
        {
            rs2.close();
            ps2.close();
            con.close();
        }
        catch(Exception ee)
        {
            out.print("Another Exception 2 : "+ee);
        }
    }   

    sumEveryDayTasks = 0;
    
    for( Object obj : al )
    {
        sumEveryDayTasks = sumEveryDayTasks + (Integer)obj;
    }
    
</jsp:scriptlet>

<jsp:scriptlet>
    
    try
    {
        con = DBConnection.getConnect();
        
        ps6 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");
        
        ps6.setString(1, email);
        
        rs4 = ps6.executeQuery();
        
        if( rs4.next() )
        {
            plan_no2 = rs4.getString("plan_no");
            plan_cost2 = rs4.getString("plan_cost");
            plan_active_or_not2 = rs4.getString("plan_active_or_not");
            
            
            if( plan_active_or_not2 != null || !plan_active_or_not2.equals("") )
            {
                percentageOfEveryPlanCost = Double.parseDouble(((plan_cost2)));
            
                amount = (int)((percentageOfEveryPlanCost * 0.20)/100);
            }
            
        }
    }
    catch(Exception e)
    {
        //out.print("Exception 4 : "+e);
    }
    finally
    {
        try
        {
            rs4.close();
            ps6.close();
            con.close();
        }
        catch(Exception ee)
        {
            out.print("Another Exception : "+ee);
        }
    }

</jsp:scriptlet>

<jsp:scriptlet>

    try
    {
        con = DBConnection.getConnect();
        
        con.setAutoCommit(false);
        
        ps3 = con.prepareStatement("SELECT * FROM user_every_day_and_total_income_details WHERE user_email=? AND date1=?");
        
        ps3.setString(1, email);
        ps3.setString(2, date2);
        
        rs3 = ps3.executeQuery();
        
        if( rs3.next() )
        {
            // Update Part
            ps5 = con.prepareStatement("UPDATE user_every_day_and_total_income_details SET total_balance=? , today_income=? WHERE user_email=? AND date1=?");
                                        
            ps5.setInt(1, sumEveryDayTasks*amount);
            ps5.setInt(2, climb_user_tasks2*amount);
            ps5.setString(3, email);
            ps5.setString(4, date2);
                                        
            int rowCount1 = ps5.executeUpdate();
                                        
            if( rowCount1 > 0 )
            {
                con.commit();
                // success
                //out.print("success");
            }
            else
            {
                con.rollback();
                out.print("Failed");
            }
        }
        else
        {
            // Insert Part
            ps4 = con.prepareStatement("INSERT INTO user_every_day_and_total_income_details(user_email, total_balance, today_income, date1, time1) VALUES(?,?,?,?,?)");
                                        
            ps4.setString(1, email);
            ps4.setInt(2, sumEveryDayTasks*amount);
            ps4.setInt(3, climb_user_tasks2*amount);
            ps4.setString(4, date2);
            ps4.setString(5, time2);
                                        
            int rowCount2 = ps4.executeUpdate();
                                        
            if( rowCount2 > 0 )
            {
                con.commit();
                // success
                //out.print("success");
            }
            else
            {
                con.rollback();
                out.print("Failed");
            }
        }
        
    }
    catch(Exception e)
    {
        try
        {
            con.rollback();
        }
        catch(Exception eee)
        {
            out.print("Inner Exception 3 : "+eee);
        }
        out.print("Exception 3 : "+e);
    }
    finally
    {
        try
        {
            con.close();
        }
        catch(Exception ee)
        {
            out.print("Another Exception 3 : "+ee);
        }
    } 

</jsp:scriptlet>

<jsp:scriptlet>

    al2 = new ArrayList();
    
    numberOfReferPerson = 0;

    try
    {
        con = DBConnection.getConnect();
        
        con.setAutoCommit(false);
        
        ps7 = con.prepareStatement("SELECT * FROM refer_income_details WHERE user_sponser_email=? AND user_sponser_id=? AND user_sponser_name=?");
        
        ps7.setString(1, email);
        ps7.setString(2, user_sponser_id2);
        ps7.setString(3, user_sponser_name2);
        
        rs5 = ps7.executeQuery();
        
        while( rs5.next() )
        {
            mySharedUserSponsedEmail = rs5.getString("sponsed_email");
            
            
            ps19 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");
            
            ps19.setString(1, mySharedUserSponsedEmail);
            
            rs13 = ps19.executeQuery();
            
            if( rs13.next() )
            {
                ps8 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");
            
                ps8.setString(1, email);

                rs6 = ps8.executeQuery();

                if( rs6.next() )
                {
                    // ----- For Plan is Available -----
                    userBuyPlanNo2 = rs6.getString("plan_no");
                    userBuyPlanCost2 = rs6.getString("plan_cost");
                    userPlanActiveOrNot2 = rs6.getString("plan_active_or_not");

                    // ----- New Part 09/04/2022 ----- 
                    ps10 = con.prepareStatement("SELECT * FROM user_sponser_details WHERE email=?");

                    ps10.setString(1, email);

                    rs7 = ps10.executeQuery();

                    if( rs7.next() )
                    {
                        user_sponser_id2 = rs7.getString("user_sponser_id");
                        user_sponser_name2 = rs7.getString("user_sponser_name");
                        user_sponser_contact_no2 = rs7.getString("user_sponser_contact_no");

                        ps11 = con.prepareStatement("SELECT * FROM sponser_details WHERE sponser_id=? AND sponser_name=? AND sponser_contact_no=?");

                        ps11.setString(1, user_sponser_id2);
                        ps11.setString(2, user_sponser_name2);
                        ps11.setString(3, user_sponser_contact_no2);

                        rs8 = ps11.executeQuery();

                        while( rs8.next() )
                        {
                            sponsed_email2 = rs8.getString("email");

                            ps12 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");

                            ps12.setString(1, sponsed_email2);

                            rs9 = ps12.executeQuery();

                            if( rs9.next() )
                            {
                                plan_no22 = rs9.getString("plan_no");
                                plan_cost22 = rs9.getString("plan_cost");
                                plan_active_or_not22 = rs9.getString("plan_active_or_not");

                                if( (userPlanActiveOrNot2 != null || !userPlanActiveOrNot2.equals("")) && (plan_active_or_not22 != null || !plan_active_or_not22.equals("")) )
                                {
                                    userSponserIncome = Double.parseDouble(userBuyPlanCost2);

                                    userSponserTotalIncome = ((userSponserIncome*7.5)/100);

                                    al2.add(userSponserTotalIncome);

                                    ps9 = con.prepareStatement("UPDATE refer_income_details SET user_sponser_income=? WHERE user_sponser_email=? AND user_sponser_id=? AND user_sponser_name=?");

                                    ps9.setDouble(1, userSponserTotalIncome);
                                    ps9.setString(2, email);
                                    ps9.setString(3, user_sponser_id2);
                                    ps9.setString(4, user_sponser_name2);

                                    int rowCount3 = ps9.executeUpdate();

                                    if( rowCount3 > 0 )
                                    {
                                        // ----- Success -----
                                        con.commit();
                                    }
                                    else
                                    {
                                        // ----- Failed -----
                                        out.print("Failed");
                                        con.rollback();
                                    }

                                }                            

                            }

                        }

                    }

                }
            }
            
            numberOfReferPerson = numberOfReferPerson + 1;
        }
        
    }
    catch(Exception e)
    {
        try
        {
            con.rollback();
        }
        catch(Exception eee)
        {
            out.print("Inner Exception 5 : "+eee);
        }
        //out.print("Exception 5 : "+e);
    }
    finally
    {
        try
        {
            rs13.close();
            rs9.close();
            rs8.close();
            rs7.close();
            rs6.close();
            rs5.close();
            ps19.close();
            ps12.close();
            ps11.close();
            ps10.close();
            ps9.close();
            ps8.close();
            ps7.close();
            con.close();
        }
        catch(Exception ee)
        {
            //out.print("Another Exception 5 : "+ee);
        }
    }
    
    sumOfUserSponserTotalIncome = 0;
    
    for( Object obj2 : al2 )
    {
        double currentSponserIncome = (Double) obj2;
        sumOfUserSponserTotalIncome = sumOfUserSponserTotalIncome + currentSponserIncome ;
    }
    
</jsp:scriptlet>

<jsp:scriptlet>

    try
    {
        con = DBConnection.getConnect();
        
        con.setAutoCommit(false);
        
        ps13 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");
        
        ps13.setString(1, email);
        
        rs10 = ps13.executeQuery();
        
        if( rs10.next() )
        {
            plan_no222 = rs10.getString("plan_no");
            plan_cost222 = rs10.getString("plan_cost");
            
            ps14 = con.prepareStatement("SELECT * FROM user_every_day_and_total_income_details WHERE user_email=? AND date1=?");
            
            ps14.setString(1, email);
            ps14.setString(2, date2);
            
            rs11 = ps14.executeQuery();
            
            if( rs11.next() )
            {
                total_balance222 = rs11.getInt("total_balance");
                
                // Convert String into Integer
                int iPlanCost = Integer.parseInt(plan_cost222);
                
                if( total_balance222 > iPlanCost )
                {
                    total_balance222 = iPlanCost;
                    
                    // Update
                    ps15 = con.prepareStatement("UPDATE user_every_day_and_total_income_details SET total_balance=? WHERE user_email=? AND date1=?");
                    
                    ps15.setInt(1, total_balance222);
                    ps15.setString(2, email);
                    ps15.setString(3, date2);
                    
                    int rowCount222 = ps15.executeUpdate();
                    
                    if( rowCount222 > 0 )
                    {
                        con.commit();
                    }
                    else
                    {
                        con.rollback();
                    }
                }
            }
        }
    }
    catch(Exception e)
    {
        try
        {
            con.rollback();
        }
        catch(Exception eee)
        {
            
        }
        //out.print("Exception 6 : "+e);
    }
    finally
    {
        try
        {
            rs11.close();
            rs10.close();
            ps15.close();
            ps14.close();
            ps13.close();
            con.close();
        }
        catch(Exception ee)
        {
            //out.print("Another Exception 6 : "+ee);
        }
    }

</jsp:scriptlet>

<jsp:scriptlet>
    
    double totalAmount = sumEveryDayTasks*amount+sumOfUserSponserTotalIncome;

    try
    {
        con = DBConnection.getConnect();
        
        con.setAutoCommit(false);
        
        ps16 = con.prepareStatement("SELECT * FROM user_total_balance_details WHERE user_email=?");
        
        ps16.setString(1, email);
        
        rs12 = ps16.executeQuery();
        
        if( rs12.next() )
        {
            // Update Part
            
            ps18 = con.prepareStatement("UPDATE user_total_balance_details SET user_total_balance=? WHERE user_email=?");
            
            ps18.setDouble(1, totalAmount);
            ps18.setString(2, email);
            
            int rowCount5 = ps18.executeUpdate();
            
            if( rowCount5 > 0 )
            {
                con.commit();
            }
            else
            {
                con.rollback();
                out.print("Failed");
            }
        }
        else
        {
            // Insert Part
            
            ps17 = con.prepareStatement("INSERT INTO user_total_balance_details(user_email, user_total_balance, date1, time1) VALUES(?,?,?,?)");
            
            ps17.setString(1, email);
            ps17.setDouble(2, totalAmount);
            ps17.setString(3, date2);
            ps17.setString(4, time2);
            
            int rowCount4 = ps17.executeUpdate();
            
            if( rowCount4 > 0 )
            {
                con.commit();
            }
            else
            {
                con.rollback();
                out.print("Failed");
            }
        }
        
    }
    catch(Exception e)
    {
        try
        {
            con.rollback();
        }
        catch(Exception eee)
        {
            out.print("Inner Exception 7 : "+eee);
        }
        out.print("Exception 7 : "+e);
    }
    finally
    {
        try
        {
            rs12.close();
            ps18.close();
            ps17.close();
            ps16.close();
            con.close();
        }
        catch(Exception ee)
        {
            //out.print("Another Exception 7 : "+ee);
        }
    }

</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome : <jsp:expression>name</jsp:expression> </title>

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

            <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

            <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

            <link rel="stylesheet" href="css/style.css" />

            <script>
                
                function shareWebsite()
                {
                    var message1 = "Share Your Referral Link , Referral Link :                                             http://localhost:8084/RoyalWorld/register.jsp?sponser_id=<jsp:expression>user_sponser_id2</jsp:expression>  Copy this link (ctrl+c) and simply paste in any platform where you want to share your referral link.";
                                        
                    window.alert(message1);
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
                    <a href="index.jsp" class="previous-logo-design-div" title="Back To Index Page">&#10094;</a>
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
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">My Profile</strong> </center> <br>
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
                                <div class="col-md-4">
                                    <center> <a href="edit_profile_pic.jsp"> <span style="font-size: 18px; color: blue; float: right;" class="glyphicon glyphicon-pencil"> </span> </a> </center>
                                    <center> <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="260" width="250" style="border: 0.5px solid #cccccc; border-radius: 50%; image-resolution: normal;" /> </center>
                                    </div>
                                    <div class="col-md-8">
                                        <a href="edit_profile_about_details.jsp"> <span style="font-size: 20px;  color: blue; float: right;" class="glyphicon glyphicon-pencil"> </span> </a> 
                                        <h2 style="color: #0000ff;"> <jsp:expression>name.toUpperCase()</jsp:expression> </h2> <br> 
                                        <b style="color: #6600cc; font-size: 16px;"> Sponsor : </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>sponser_name</jsp:expression>(<jsp:expression>sponser_id</jsp:expression>) </span><br><br> 
                                        <b style="color: #6600cc; font-size: 16px;"> Position :  </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>position</jsp:expression> </span> <br><br> 
                                        <b style="color: #6600cc; font-size: 16px;"> Email : </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>email</jsp:expression> </span> <br><br> 
                                        <b style="color: #6600cc; font-size: 16px;"> Contact Number :  </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>contact_no</jsp:expression> </span> <br><br>
                                        <b style="color: #6600cc; font-size: 16px;"> State : </b> <span style="color: #000000; font-size: 16px;"> <jsp:expression>state</jsp:expression> </span> <br><br> 
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
                            <div class="col-md-8" style="background: #333333; border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <span class="total-balance-design">Total Balance</span> 
                                        <button class="button-fund-add-design"> <i class="fa fa-plus"></i>&nbsp;Fund Add</button> <br>
                                        <i class="fa fa-inr total-balance-and-rupees-design"><span class="total-balance-and-rupees-design">&nbsp;<jsp:expression>sumEveryDayTasks*amount+sumOfUserSponserTotalIncome</jsp:expression></span></i> 
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="user_add_accounts.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-add-account-design-div"> <i class="fa fa-bank bootstrap-icon-design" style="font-size: 20px; font-weight: 600;"></i> </button> </a> <br>
                                            <a href="user_add_accounts.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Add Account</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="user_kyc_details.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div">  <button class="button-kyc-design-div"> <i class="glyphicon glyphicon-hourglass bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="user_kyc_details.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">KYC Details</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="view_banks_details.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-view-bank-design-div"> <i class="glyphicon glyphicon-floppy-saved bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="view_banks_details.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">View Bank</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="user_change_profile_and_transaction_password.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-change-password-design-div"> <i class="fa fa-edit bootstrap-icon-design" style="font-size: 22px; font-weight: 600;"></i>  </button> </a> <br>
                                            <a href="user_change_profile_and_transaction_password.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Change Password</span> </a>
                                        </center>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="view_my_plan.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-topup-design-div"> <i class="glyphicon glyphicon-gift bootstrap-icon-design" style="font-size: 22px; font-weight: 600;"></i> </button> </a> <br>
                                            <a href="view_my_plan.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">My Plan</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="request_for_withdraw_money.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-withdraw-design-div"> <i class="glyphicon glyphicon-arrow-down bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="request_for_withdraw_money.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Withdraw</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-fundmove-design-div"> <i class="glyphicon glyphicon-arrow-right bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Fund Move</span> </a>
                                        </center>
                                    </div>
                                    <div class="col-md-3 col-sm-3">
                                        <center>
                                            <a href="copy_user_link.jsp?UniqueNo=<jsp:expression>user_sponser_id2</jsp:expression>" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-share-design-div"> <i class="glyphicon glyphicon-share-alt bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="copy_user_link.jsp?UniqueNo=<jsp:expression>user_sponser_id2</jsp:expression>" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Share</span> </a>
                                        </center>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <center>
                                            <a href="our_tasks_and_our_ads.jsp" class="topup-withdraw-fundmove-share-hyper-link-design-div"> <button class="button-view-ads-design-div"> <i class="glyphicon glyphicon-th bootstrap-icon-design"></i> </button> </a> <br>
                                            <a href="our_tasks_and_our_ads.jsp" class="profile-all-task-div-design"> <span class="text-fund-color-and-design">Your Task</span> </a>
                                        </center> 
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
                                <span class="dashboard-text-design">Dashboard</span> <br> <hr> <br>
                                <div class="row">
                                    <div class="col-md-2 col-sm-2 our-plan-details-div-design-one">
                                        <center> 
                                            <span class="text-color-and-design"> Withdraw Wallet </span> <br> 
                                            <i class="fa fa-inr text-color-and-rupees-design"><span class="text-color-and-rupees-design">&nbsp;0</span></i> <br>
                                            <a href="" class="text-hyperlink-design-and-color">View more</a>
                                        </center>
                                    </div>
                                    <div class="col-md-1 col-sm-1">

                                    </div>
                                    <div class="col-md-2 col-sm-2 our-plan-details-div-design-two">
                                        <center>
                                            <span class="text-color-and-design"> Topup Wallet </span> <br>
                                            <i class="fa fa-inr text-color-and-rupees-design"><span class="text-color-and-rupees-design">&nbsp;0</span></i> <br>
                                            <a href="" class="text-hyperlink-design-and-color">View more</a>
                                        </center>
                                    </div>
                                    <div class="col-md-1 col-sm-1">

                                    </div>
                                    <div class="col-md-2 col-sm-2 our-plan-details-div-design-three">
                                        <center>
                                            <span class="text-color-and-design"> Level Income </span> <br>
                                            <i class="fa fa-inr text-color-and-rupees-design"><span class="text-color-and-rupees-design">&nbsp;0</span></i> <br>
                                            <a href="" class="text-hyperlink-design-and-color">View more</a>
                                        </center>
                                    </div>
                                    <div class="col-md-1 col-sm-1">

                                    </div>
                                    <div class="col-md-2 col-sm-2 our-plan-details-div-design-four">
                                        <center>
                                            <span class="text-color-and-design"> Today Income </span> <br>
                                            <i class="fa fa-inr text-color-and-rupees-design"><span class="text-color-and-rupees-design">&nbsp;<jsp:expression>climb_user_tasks2*amount</jsp:expression></span></i> <br>
                                            <a href="" class="text-hyperlink-design-and-color">View more</a>
                                        </center>
                                    </div>
                                </div>

                                <br> <hr>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12 level-one-box-design">
                                                <span class="level-one-members-design">Level-1 Members</span> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 level-one-box-without-color-design">
                                                <span class="level-one-members-without-color-design"><jsp:expression>numberOfReferPerson</jsp:expression></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12 level-two-box-design">
                                                <span class="level-one-members-design">Level-2 Members</span> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 level-two-box-without-color-design">
                                                <span class="level-one-members-without-color-design">0</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12 level-three-box-design">
                                                <span class="level-one-members-design">Level-3 Members</span> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 level-three-box-without-color-design">
                                                <span class="level-one-members-without-color-design">0</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>

                            </div>
                            <div class="col-md-2">

                            </div> 
                        </div>

                        <br><br>

                        <div class="row">
                            <div class="col-md-2">

                            </div>
                            <div class="col-md-8"  style="background: #fcecf2; border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <a href="">
                                            <div class="col-md-3 col-sm-3 wallet-transfer-and-services-full-design-div">
                                                <img alt="Wallet Transfer" src="images/wallet_transfer.png" height="100" width="100" style="border-radius: 50%; margin-left: 25%;" /> <br><br>  
                                                <div class="text-font-and-design-div">
                                                    <span class="wallet-transfer-and-services-design-div">Wallet Transfer</span>
                                                </div>
                                            </div>
                                        </a>
                                        
                                        <div class="col-md-1 col-sm-1">
                                            
                                        </div>
                                        
                                        <a href="invitation_person_details.jsp">
                                            <div class="col-md-3 col-sm-3 wallet-transfer-and-services-full-design-div">
                                                <img alt="Invitation Details" src="images/invitation-person-details.jpg" height="100" width="100" style="border-radius: 50%; margin-left: 25%;" /> <br><br>  
                                                <div class="text-font-and-design-div">
                                                    <span class="wallet-transfer-and-services-design-div">Invitation Details</span>
                                                </div>
                                            </div>
                                        </a>
                                        
                                        
                                        <div class="col-sm-1">
                                            
                                        </div>
                                        
                                        <a href="contact_us.jsp" style="float: right;">
                                            <div class="col-md-3 col-sm-3 wallet-transfer-and-services-full-design-div">
                                                <img alt="Wallet Transfer" src="images/support-services.png" height="100" width="100" style="background: #ccccff; border: 2px solid #ffffff; border-radius: 50%; margin-left: 25%;" /> <br><br>
                                                <div class="text-font-and-design-div">
                                                    <span class="wallet-transfer-and-services-design-div">Services</span>
                                                </div>
                                            </div>
                                        </a>

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
                            <div class="col-md-8" style="background: #333333; border: 1px solid lightgray; box-shadow: 2px 2px 2px lightgray; border-radius: 10px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <span class="total-balance-design">Your Income</span>
                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Total Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;<jsp:expression>sumEveryDayTasks*amount+sumOfUserSponserTotalIncome</jsp:expression></span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Sponsor Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;<jsp:expression>sumOfUserSponserTotalIncome</jsp:expression></span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Total Task Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;<jsp:expression>sumEveryDayTasks*amount</jsp:expression></span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Today Ads Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;<jsp:expression>climb_user_tasks2*amount</jsp:expression></span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Team Ads Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;0</span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Reward Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;0</span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10" style="background: #405a6b; border: 1px solid #405a6b; box-shadow: 0px 0px 0px #405a6b; border-radius: 10px;">
                                        <span class="total-income-sponsor-income-level-income-design-div">Recharge Income</span> <i class="fa fa-inr total-income-sponsor-income-level-income-design-div" style="float: right;"><span class="total-income-sponsor-income-level-income-design-div">&nbsp;0</span></i> <br>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div> <br>
                            </div>
                            <div class="col-md-2">

                            </div>
                        </div>
                        <br><br><br>
                    </div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
