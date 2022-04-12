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
        <title> Royal World - About Us </title>

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

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-8 job_search_div">
                            <div class="row">
                                <div class="col-md-6">
                                    <img alt="About Us" src="images/about-us.png" height="250" width="350" />
                                </div>
                                <div class="col-md-6">
                                    <img alt="About Us" src="images/about_us_men.png" height="200" width="350" style="background-color: #ffffff;" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <center> <b class="about_us_header_div_design"> This is Royal World website </b> </center>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <b style="font-size: 30px; color: #009966;"> About Us </b><br><hr>
                                    <p style="color: #000000;">
                                        RoyalWorld not only provide a comprehensive platform to the clients for propagating their 
                                        products, but also benefits the customers by providing some amount of rewards and bonus in
                                        the terms of money or product and services. Through this process small business, start ups 
                                        or small ventures can generate higher revenue. And if we talk about the other phase of the coin,
                                        that is, the customers, they are getting an extra source of income from home without any 
                                        headache. Traditional methods of advertisements are expensive and consume a high degree of
                                        efforts. World has evolved a lot. It has been changed with development, time and needs. And 
                                        change is good if done with right motive. Additionally, a smart business person never drops a
                                        chance of flowing with the right current stream. In fact, a true business person understands 
                                        that the right strategy to a successful business relies on the smart investment giving more 
                                        productive outcomes with proper management followed by skilled team members. Thus, a new way
                                        of propagation is being used nowadays called refer and earn process. This process is easy and 
                                        productive too. All it takes is a simple registration process.
                                    </p>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <b style="font-size: 30px; margin-left: 37%; color: #cc00cc;"> Who We Are? </b><br><hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="color: #000000;">
                                                We started as IT Company in 2015. We develop Android Apps, IOS Apps, E-commerce websites for
                                                many reputed company. Later we added digital Ads creation and publishing. Now Ads Exchange 
                                                has become faster growing platform for digital Advertisement in India. Our team of highly 
                                                skilled creator, marketers and technology experts makes us unique. Being an IT Company, We 
                                                stay on cutting-edge technology. We Ads Exchange teams of well-planned strategists and 
                                                creative Ads creators are working with top Advertiser's and unique publishers in order to help
                                                our client start-up companies to get top ranked not only in Indian markets
                                                but worldwide.
                                            </p>                                            
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
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <b style="font-size: 30px; margin-left: 37%; color: #cc00cc;"> What We Do? </b><br><hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="color: #000000;">
                                                We help advertisers meet their KPIs and grow ROI, while publishers maximize eCPM with our 
                                                easy-to-use, advanced traffic solutions and the best team in the industry.
                                            </p>                                            
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
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <b style="font-size: 30px; color: #009966;"> Our Mission </b><br><hr>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img alt="Our Mission" src="images/our-mission.jpg" width="320" height="200"  />
                                        </div>
                                        <div class="col-md-8">
                                            <p style="color: #ff9900;">
                                                Our central goal is to accomplish clients brilliance and maintainable focused edge. 
                                            </p>
                                            <br>
                                            <p style="color: #000000;">
                                                To provide Result Oriented, well planned marketing strategic campaigns to our client companies
                                                while connecting creative Advertiser’s and unique publishers.
                                            </p>                                            
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
                                <div class="col-md-8" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                    <b style="font-size: 30px; color: #009966;"> Our Vision </b><br><hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="color: #000000;">
                                                For a long time, we have lived by a lot of guiding principle that characterize our identity,
                                                shape our conduct, and set us apart from others in the business and now we have made a dream
                                                proclamation to express our motivation and concisely impart our vital way. We will be the
                                                undisputed pioneer in our business sectors, perceived for setting the specialized and execution
                                                norms in the majority of our organizations and for making client achievement. Our vision 
                                                controls the means we take every day to guarantee our clients get an answer conveyed agreeable
                                                to them. 
                                            </p>                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
