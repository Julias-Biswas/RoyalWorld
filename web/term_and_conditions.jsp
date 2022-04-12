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
        <title> Royal World - Term & Conditions </title>

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
                            <div class="col-md-1">

                            </div>
                            <div class="col-md-10 term-condition-box-color-div-design">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-6">
                                        <strong  style="font-size: 35px; color: #009900; padding: 15px;"> Terms & Conditions </strong>
                                    </div>
                                    <div class="col-md-3">

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10">
                                        <p>
                                            <a href="index.jsp"> RoyalWorld.co.in </a> , (hereinafter referred to as '<a href="index.jsp">RoyalWorld.co.in</a>'), 
                                            committed to protecting our customers’ personal information, we value your trust & respect your privacy.
                                            We have created this Privacy Policy to help you understand how we collect, use and protect your 
                                            information when you visit our web, <a href="index.jsp">RoyalWorld.co.in</a> WAP sites and use our 
                                            services. If you do not agree to the terms of the policy, please do not use or access 
                                            <a href="index.jsp">RoyalWorld.co.in</a> website, WAP site or mobile applications.
                                        </p>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10">
                                        <b class="bold-text-color-div-design">
                                            As per laws and regulations applicable in India,
                                            this policy is just for your information and is 
                                            not intended to limit or exclude your rights.
                                        </b> <br><br>
                                        <b class="bold-text-color-div-design">
                                            1. One Email ID One Registration Allowed. <br><br>

                                            2. Minimum Withdrawal Allowed : Rs. 500 <br><br>

                                            3. Minimum Two Refferral required for withdrawal <br><br>

                                            4. Minimum Two Refferral required for use any services <br><br>

                                            5. Minimum Two Refferral required for withdrawal <br><br>

                                            6. Minimum Rs. 500 should be in your wallet for use any services. <br><br>

                                            7. Minimum Rs. 500 should be loaded online in your wallet. <br><br>

                                            8. KYC Required. <br>
                                        </b> <br>
                                        <span> *applicable only when level wise escalation is followed. </span>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                                <br><br><br>
                                <div class="row">
                                    <div class="col-md-1">
                                        
                                    </div>
                                    <div class="col-md-10">
                                        <b>
                                            Membership Cancellation Policy
                                        </b> <br><br><br>
                                        <b> Level 1: </b> <br><br>
                                        <span> 
                                            If any user voilate above Terms & Conditions, membership will be 
                                            discontinued and Membership fees will not refundable. 
                                        </span> <br><br>
                                        <b> Level 2: </b> <br><br>
                                        <span>
                                            If any user doesn't topup their Id within 7 days of their 
                                            registration, ID will be permanently blocked.
                                        </span> <br><br>
                                        <b> Level 3: </b> <br><br>
                                        <span>
                                            Any user want to cancel their membership, they have to write 
                                            a mail on support@adsexchange.in within 48 hours of activation,
                                            we will refund accordingly to our distribution.
                                        </span> <br><br>
                                        <b> Level 4: </b> <br><br>
                                        <span>
                                            If any user doesn't add their 2 active downlines within 15 days,
                                            we will cancel their membership and refund them accordingly to our
                                            distribution.
                                        </span> <br><br><br>
                                        <span>
                                            Or click here to escalate to Grievance Officer.
                                        </span> <br><br><br>
                                        <span>
                                            *Applicable only when level wise escalation is followed.
                                        </span> <br><br>
                                        <span>
                                            We recommend that customer sends us a query/grievance by login
                                            in his adsexchange.in account and using the ‘Help and Support’ section.
                                            It is also recommended that the customer writes his complaint reference
                                            number provided by our customer care team in all further communication 
                                            with us regarding a particular issue. This enables us to get more details 
                                            about the customer and the query quickly and helps to resolve the query 
                                            faster.
                                        </span> <br><br><br>
                                        <b>
                                            Turn Around Time For Queries, Concerns, Complaints
                                        </b> <br><br><br>
                                        <span>
                                            Suitable timelines have been set for every complaint depending upon the
                                            investigations which would be involved in resolving the same. Here are
                                            the estimated timelines at various levels of queries/escalations
                                        </span> <br><br>
                                        <ul>
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> First response to a user’s query/ concern – 48Working Hours </li> 
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> Follow-up queries – 72 Working Hours </li>
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> Escalated cases – 7 Working days </li>
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> Customer grievances – 15 Working days </li>
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> Concern raised to Nodal officer – 15 Working days </li>
                                            <li> <i class="glyphicon glyphicon-arrow-right"></i> NEFT to user’s bank account – 7 Working days </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-1">
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-1">

                            </div>
                        </div>
                        <br><br><br>
                    </div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
