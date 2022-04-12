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
    String buy_our_plans2 = null;

    Connection con = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;

    String id2 = null;
    String plan_no2 = null;
    String investment_amount2 = null;
    String benefit2 = null;
    String percentage2 = null;
    String no_of_members2 = null;
    String boosting_income_heading2 = null;
    String boosting_income_desc2 = null;
    String left_right_claim_heading2 = null;
    String left_right_claim_desc2 = null;
    String our_plan_benefit_for_user2 = null;
    int money_of_this_plan2 = 0;

</jsp:declaration>

<jsp:scriptlet>

    buy_our_plans2 = request.getParameter("plan-7400-n_2HTpL-IGdt/plan-Nyt445-bdhd/bju-HRUoM-9-UTG");
</jsp:scriptlet>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Buy Our Plans </title>

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
                    <a href="our_plans.jsp" class="previous-logo-design-div" title="Back To Our Plan Page">&#10094;</a>
                <jsp:scriptlet>
                } else {
                </jsp:scriptlet>
                <jsp:include page="profileheader.jsp"></jsp:include>
                    <a href="our_plans.jsp" class="previous-logo-design-div" title="Back To Our Plan Page">&#10094;</a>
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <jsp:scriptlet>

                    try {
                        con = DBConnection.getConnect();

                        ps1 = con.prepareStatement("SELECT * FROM our_plans WHERE plan_no=?");

                        ps1.setString(1, buy_our_plans2);

                        rs1 = ps1.executeQuery();

                        if (rs1.next()) {
                            id2 = rs1.getString("id");
                            plan_no2 = rs1.getString("plan_no");
                            investment_amount2 = rs1.getString("investment_amount");
                            benefit2 = rs1.getString("benefit");
                            percentage2 = rs1.getString("percentage");
                            no_of_members2 = rs1.getString("no_of_members");
                            boosting_income_heading2 = rs1.getString("boosting_income_heading");
                            boosting_income_desc2 = rs1.getString("boosting_income_desc");
                            left_right_claim_heading2 = rs1.getString("left_right_claim_heading");
                            left_right_claim_desc2 = rs1.getString("left_right_claim_desc");
                            our_plan_benefit_for_user2 = rs1.getString("our_plan_benefit_for_user");
                            money_of_this_plan2 = rs1.getInt("money_of_this_plan");
                        }
                    } catch (Exception e) {
                        out.print("Exception : " + e);
                    } finally {
                        try {
                            rs1.close();
                            ps1.close();
                            con.close();
                        } catch (Exception e) {
                            out.print("Another Exception : " + e);
                        }
                    }
                </jsp:scriptlet>

                <br>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-1 col-sm-1">

                        </div>
                        <div class="col-md-10 col-sm-10 item-testimonial-box-div-design">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <center>
                                                <b class="our_plan_heading_design"> <jsp:expression>plan_no2</jsp:expression> </b> 
                                            </center> 
                                            </div>
                                        </div> <hr>
                                        <div class="row">
                                            <div class="col-md-1">

                                            </div>              
                                            <div class="col-md-10">
                                                <center> <span class="our_plan_investment_amount_design"> <jsp:expression>investment_amount2</jsp:expression> </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>benefit2</jsp:expression> </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>percentage2</jsp:expression> </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>no_of_members2</jsp:expression> </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>boosting_income_heading2</jsp:expression>  </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>boosting_income_desc2</jsp:expression> </span> </center> <br>
                                                <hr>
                                                <center> <span class="our_plan_left_right_claim_design"> <center> <jsp:expression>left_right_claim_heading2</jsp:expression> </center> </span> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>left_right_claim_desc2</jsp:expression> </span> </center> <br>
                                                <center> <span class="our_plan_benefit_design"> <jsp:expression>our_plan_benefit_for_user2</jsp:expression> </span> </center> <br>
                                                    </div>
                                                    <div class="col-md-1">

                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <center> <img alt="" src="images/qr_code_of_royalworld.jpeg" class="scan-qr-code-div-design" /> </center> <br><br>

                                            <jsp:scriptlet>
                                                if (email == null ? email == null : email.trim().equals("null")) {
                                            </jsp:scriptlet>
                                            
                                                <center>
                                                    <a href="login.jsp"> <button class="menubar_design request_plan_design_button"> Login Now </button> </a>
                                                </center> <br>
                                            
                                            <jsp:scriptlet>
                                            } else {
                                            </jsp:scriptlet>
                                            
                                                <center>
                                                    <form action="UserRequestPlanFromUserSide?PlanId=<jsp:expression>money_of_this_plan2</jsp:expression>" method="POST">
                                                        <input type="text" name="plan_cost1" value="<jsp:expression>money_of_this_plan2</jsp:expression>" style="display: none;" />
                                                        <input type="text" name="plan_no1" value="<jsp:expression>plan_no2</jsp:expression>" style="display: none;" />
                                                        <input type="text" name="user_email1" value="<jsp:expression>email</jsp:expression>" style="display: none;" />
                                                        <input class="menubar_design request_plan_design_button" type="submit" value="Request for This Plan"/>
                                                    </form>
                                                </center> <br>
                                            
                                            <jsp:scriptlet>
                                                }
                                            </jsp:scriptlet>
                                        <center> 
                                            <b style="color: #ff0000; font-size: 16px;"> 
                                                To Buy This Plan , Please Scan The QR Code and Make The Payment , As Soon As Our
                                                Agent will Contact to You. Thank You...!!!
                                            </b> 
                                        </center>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-1">

                            </div>
                        </div>
                        <br><br><br>
                    </div>

                    <jsp:include page="footer.jsp"></jsp:include>

                </div>
            </div>
    </body>
</html>
