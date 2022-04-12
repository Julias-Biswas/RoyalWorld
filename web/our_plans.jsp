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

</jsp:declaration>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Our Plans </title>

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
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <br>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-6" >
                            <div class="row" style="border: 1px solid #ff66ff; box-shadow: 2px 2px 2px #ff00ff; border-radius: 10px;">
                                <div class="col-md-12">
                                    <strong  style="font-size: 35px; color: #ff0000;"> <center> © Our Packages © </center> </strong>
                                </div>
                            </div>

                            <br><br>

                            <jsp:scriptlet>

                                try 
                                {
                                    con = DBConnection.getConnect();

                                    ps1 = con.prepareStatement("SELECT * FROM our_plans");

                                    rs1 = ps1.executeQuery();
                                    
                                    while( rs1.next() )
                                    {
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
                            </jsp:scriptlet>

                            <div class="row">
                                <div class="col-md-1">

                                </div>
                                <a href="our_plans_desc_buy_our_plans.jsp?plan-7400-n_2HTpL-IGdt/plan-Nyt445-bdhd/bju-HRUoM-9-UTG=<jsp:expression>plan_no2</jsp:expression>&Htldpj/jfen-db-0245/7400=0">
                                    <div class="col-md-10 our_plan_column_design">
                                        <b class="our_plan_heading_design"> <center> <jsp:expression>plan_no2</jsp:expression> </center> </b> <hr>
                                        <table>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_investment_amount_design"> <jsp:expression>investment_amount2</jsp:expression> </span> <br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>benefit2</jsp:expression> </span><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>percentage2</jsp:expression> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>no_of_members2</jsp:expression> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>boosting_income_heading2</jsp:expression>  </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="our_plan_benefit_design"> <jsp:expression>boosting_income_desc2</jsp:expression> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <hr>
                                                    <span class="our_plan_left_right_claim_design"> <center> <jsp:expression>left_right_claim_heading2</jsp:expression> </center> </span>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>left_right_claim_desc2</jsp:expression> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="our_plan_benefit_design"> <jsp:expression>our_plan_benefit_for_user2</jsp:expression> </span>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </a>
                                <div class="col-md-1">

                                </div>
                            </div>
                            <br><br>
                            <jsp:scriptlet>
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
                                    catch(Exception ee)
                                    {
                                        out.print("Another Exception : "+ee);
                                    }
                                }
                            </jsp:scriptlet>
                        </div>

                        <div class="col-md-3">

                        </div>
                    </div>
                </div>

                <br><br><br>

                <jsp:include page="footer.jsp"></jsp:include>

            </div>
        </div>
    </body>
</html>
