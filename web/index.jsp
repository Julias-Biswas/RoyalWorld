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
        <title> Royal World - Home </title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- All Plugins Css -->
        <link href="assets/css/plugins.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">
        <link href="favicon.png" rel="icon">

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

                <div class="slideshow-container">
                    <div class="mySlides">
                        <div class="numbertext">1 / 3</div>
                        <img alt="Background Image One" src="images/font_image_one.jpg" height="690" width="100%" />
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">2 / 3</div>
                        <img alt="Background Image Two" src="images/font_image_two.jpg" height="690" width="100%" />
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">3 / 3</div>
                        <img alt="Background Image Three" src="images/font_image_three.jpg" height="690" width="100%" />
                    </div>

                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                </div>
                
                <br>

                <div style="text-align: center;">
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                </div>
                
                <br>

                <script>

                    var slideIndex = 1;
                    showSlides(slideIndex);

                    function plusSlides(n) 
                    {
                        showSlides(slideIndex += n);
                    }
                    
                    function currentSlide(n) 
                    {
                        showSlides(slideIndex = n);
                        //setTimeout(showSlides(n),2000); // Change image every 2 seconds
                    }

                    function showSlides(n)
                    {                       
                        var i;
                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("dot");
                        
                        if (n > slides.length) {slideIndex = 1;}    
                        if (n < 1) {slideIndex = slides.length;}

                        for (i = 0; i < slides.length; i++)
                        {
                            slides[i].style.display = "none";
                        }
                        
                        for (i = 0; i < dots.length; i++)
                        {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }

                        slides[slideIndex - 1].style.display = "block";
                        dots[slideIndex - 1].className += " active";
                        
                    }
                    
                    function downloadAndroidApps()
                    {
                        window.alert("Our Android Apps is Coming Soon , Thank You...!!!");
                    }
                </script>

                <div class="col-md-12" style="background-color: #A4C8E4;">
                    <br><br>
                    <div class="row">
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-3">
                            <center>
                                <img alt="" src="images/mobile_recharge.png" class="mobile-bill-dpt-image-div-design" />
                            </center> 
                            <center> <a href="" class="index-hyperlink-mobile-dtp-bill-div-design"> MOBILE RECHARGE </a> </center> <br>
                            <center class="text-color-mobile-bill-dtp-div-design">
                                We provides recharge service in India for all the mobile networks.
                                Online recharge service is convenient and fast that facilitates recharge 
                                of prepaid mobile.
                            </center>
                        </div>
                        <div class="col-md-3">
                            <center>
                                <img alt="" src="images/bill_payment.png" class="mobile-bill-dpt-image-div-design" />
                            </center>
                            <center> <a href="" class="index-hyperlink-mobile-dtp-bill-div-design"> BILL PAYMENT </a> </center> <br>
                            <center class="text-color-mobile-bill-dtp-div-design">
                                Our Bill Payment service currently provide Payment facility to Electricity bill,
                                Broadband bill, Gas bill, Landline bill, Water bill and insurance.
                            </center>
                        </div>
                        <div class="col-md-3"> 
                            <center>
                                <img alt="" src="images/dth_recharge.png" class="mobile-bill-dpt-image-div-design" />
                            </center>
                            <center> <a href="" class="index-hyperlink-mobile-dtp-bill-div-design"> DTH RECHARGE </a> </center> <br>
                            <center class="text-color-mobile-bill-dtp-div-design">
                                DTH recharge is one of the most common transactions you do nowadays, 
                                from adding channels to renewing your subscription.
                            </center>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div> <br><br>
                </div>

                <div class="col-md-12">
                    <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-8">
                                    <center class="why-choose-us-div-design"> Why choose us? </center>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-1">

                                </div>
                                <div class="col-md-3 our-varity-div-design" style="margin: 15px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 mb-12" style="height: 370px;">
                                            <span class="span-number-div-design">01</span>
                                            <center> <div class="features-grid-icon icon-center"><img src="images/third-level-security.png" class="third-level-security-member-care-self-server-div-design" /></div> </center> <br>
                                            <center>
                                                <div class="features-grid-content">
                                                    <h4 class="text-style-and-size-div-design"> Three-Level Security </h4>
                                                    <p class="para-text-mobile-bill-dtp-div-design">
                                                        We utilizes an effective combination of innovative in-house
                                                        and reliable third-party fraud detection systems, as well as
                                                        a proper human check, and provides you with the safest
                                                        experience possible.
                                                    </p>
                                                </div>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 our-varity-div-design" style="margin: 15px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 mb-12" style="height: 370px;">
                                            <span class="span-number-div-design">02</span>
                                            <center> <div class="features-grid-icon icon-center"><img src="images/Self-Serve-Platform.png" class="third-level-security-member-care-self-server-div-design" /></div> </center> <br>
                                            <center>
                                                <div class="features-grid-content">
                                                    <h4 class="text-style-and-size-div-design"> Self-Serve Platform </h4>
                                                    <p class="para-text-mobile-bill-dtp-div-design">
                                                        We provides an easy-to-use experience for those who prefer to work without
                                                        a manager. We completely automated every process so that you have the opportunity
                                                        to understand everything intuitively.
                                                    </p>
                                                </div>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 our-varity-div-design" style="margin: 15px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 mb-12" style="height: 370px;">
                                            <span class="span-number-div-design">03</span>
                                            <center> <div class="features-grid-icon icon-center"><img src="images/Members-Care.jpg" class="third-level-security-member-care-self-server-div-design" /></div> </center> <br>
                                            <center>
                                                <div class="features-grid-content">
                                                    <h4 class="text-style-and-size-div-design"> Members Care </h4>
                                                    <p class="para-text-mobile-bill-dtp-div-design">
                                                        More than just support. In addition to the 24/7 multilingual online
                                                        chat, we will analyze your specific case and help you choose the most
                                                        effective ad format and/or settings.
                                                    </p>
                                                </div>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1">

                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                </div>

                <div class="col-md-12" style="background-color: #0f7dff;">
                    <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-1">

                                </div>
                                <div class="col-md-5">
                                    <center>
                                        <span class="who-we-are-div-design">
                                            Who We Are?
                                        </span> <br>
                                        <span class="who-we-are-our-mission-what-we-do-div-design">
                                            We started as IT Company in 2015. We develop Android Apps, IOS Apps,
                                            E-commerce websites for many reputed company. Later we added digital 
                                            Ads creation and publishing. Now Ads Exchange has become faster growing
                                            platform for digital Advertisement in India. Our team of highly skilled
                                            creator, marketers and technology experts makes us unique. Being an IT
                                            Company, We stay on cutting-edge technology. We Ads Exchange teams of 
                                            well-planned strategists and creative Ads creators are working with top
                                            Advertiser's and unique publishers in order to help our client start-up
                                            companies to get top ranked not only in Indian markets but worldwide.
                                        </span>
                                    </center>
                                </div>
                                <div class="col-md-5">
                                    <center>
                                        <span class="who-we-are-div-design">
                                            Our Mission
                                        </span> <br>
                                        <span class="who-we-are-our-mission-what-we-do-div-design">
                                            Our central goal is to accomplish clients brilliance and maintainable focused 
                                            edge.
                                            To provide Result Oriented, well planned marketing strategic campaigns to our
                                            client companies while connecting creative Advertiser’s and unique publishers.
                                        </span>
                                    </center> <br>
                                    <center>
                                        <span class="who-we-are-div-design">
                                            What We Do?
                                        </span> <br>
                                        <span class="who-we-are-our-mission-what-we-do-div-design">
                                            We help advertisers meet their KPIs and grow ROI, while publishers maximize
                                            eCPM with our easy-to-use, advanced traffic solutions and the best team in the industry.
                                        </span>
                                    </center>
                                </div>
                                <div class="col-md-1">

                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                </div>

                <div class="col-md-12">
                    <br><br><br>
                    <div class="row">
                        <div class="col-md-6">
                            <img alt="" src="images/ilustratia.png" height="500" width="100%" />
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <center>
                                        <div class="small-features-box-colors-div-design mb-4" ><br><br> 
                                            <div class="cpa-marketion-div-design">
                                                <i class="glyphicon glyphicon-globe"></i>
                                            </div> 
                                            <h4 class="sfb-title">CPA Marketing</h4>
                                        </div>
                                    </center>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <center>
                                        <div class="small-features-box-colors-div-design mb-4"> <br><br>
                                            <div class="reputation-recover-div-design"> 
                                                <i class="glyphicon glyphicon-edit"></i>
                                            </div> <br>
                                            <h4 class="sfb-title">Reputation Recover</h4>
                                        </div>
                                    </center>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <center>
                                        <div class="small-features-box-colors-div-design mb-4"> <br><br>
                                            <div class="keyword-research-div-design">
                                                <i class="glyphicon glyphicon-cloud-download"></i>
                                            </div> <br>
                                            <h4 class="sfb-title">Keyword Research</h4>
                                        </div>
                                    </center>
                                </div>

                                <div class="col-lg-6 col-md-6">
                                    <center>
                                        <div class="small-features-box-colors-div-design mb-4" data-aos="fade-up" data-aos-duration="1200"> <br><br>
                                            <div class="local-search-strategy-div-design">
                                                <i class="glyphicon glyphicon-hourglass"></i>
                                            </div> <br>
                                            <h4 class="sfb-title">Local Search Strategy</h4>
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                    <br><br><br><br>
                </div>

                <div class="col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <center>
                                        <span class="why-choose-us-div-design"> High-converting ad formats </span> <br>
                                        <span class="ads-format-div-design"> All the Ads format which gives more revenue to publisher </span> 
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="row">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Popunder </span> <br><br>
                                                        <p class="popunder-para-div-design">
                                                            Popunder ads are displayed in a new browser window or tab and can
                                                            remain hidden behind the main browser window. The Adsterra popunder
                                                            script delivers a 100% responsiveness.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Social Bar </span> <br><br>
                                                        <p class="popunder-para-div-design">
                                                            Publishers achieve higher CPMs while advertisers reach up to 30x
                                                            higher CTRs in comparison with web push ads. Social Bar is fully
                                                            customizable. Animated icons, videos, custom banners, and countdowns 
                                                            attract many clicks and prompt conversions.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Push Ads </span> <br><br>
                                                        <p class="popunder-para-div-design">
                                                            The most advanced replacement to web push notifications.
                                                            Push Ads by Adsterra don’t require opt-ins; they run on all OS 
                                                            and browsers. You can either use the built-in, animated templates,
                                                            or design a customized ad.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Native ads </span> <br><br>
                                                        <p class="popunder-para-div-design">
                                                            With Adsterra, advertisers run AdBlock-resistant and cost-effective 
                                                            CPC, CPM, and CPA native ads campaigns. With over 1 BN impressions 
                                                            weekly, native banners blend in web and mobile content and drive up
                                                            to 8x higher CTRs compared to classic display ads.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12 col-lg-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Video Ads </span> <br><br>
                                                        <p class="popunder-para-div-design"> 
                                                            A short video that appears before the main content. We either use
                                                            your VAST/VPAID tags, or host your videos. Video ads are great for
                                                            creating visual impact: a brand video, a movie/game trailer, an 
                                                            immersive gambling video teasers, etc.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">

                                        </div>
                                        <div class="col-md-2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <center>
                                                        <img alt="" src="images/popup.png" class="popup-image-div-design" /> <br><br>
                                                        <span class="popunder-ads-deiv-design"> Banners </span> <br><br>
                                                        <p class="popunder-para-div-design">
                                                            Online banner campaigns deliver unprecedented performance.
                                                            Advertisers access reliable traffic sources from 18К publishers and
                                                            reach conscious customers that are ready to buy. Publishers enjoy near
                                                            100% fill rates and higher payouts.
                                                        </p>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                </div>

                <div class="col-md-12" style="background-color: #f0fefe;">
                    <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">

                                </div>
                                <div class="col-md-6">
                                    <center>
                                        <span class="why-choose-us-div-design"> What Client Say's </span> <br>
                                        <span class="ads-format-div-design"> 
                                            For startups and growing businesses check RoyalWorld plan and package,
                                            an online specialist can develop a digital marketing plan to help you 
                                            grow your business & happy client base.
                                        </span> 
                                    </center>
                                </div>
                                <div class="col-md-3">

                                </div>
                            </div>
                            
                            <br>
                            
                            <div class="row">
                                <div class="col-md-2">
                                    <!--<a class="prev" onclick="plusSlides(-1)" style="margin-top: 45%;">&#10094;</a>-->
                                </div>
                                <div class="col-md-8">
                                    <div class="row">

                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-8">
                                            <!-- Single Testimonials -->
                                            <div class="item-testimonial-box-div-design">
                                                <div class="row">
                                                    <div class="col-md-12" style="padding: 30px;">
                                                        <span class="testimonial-box"> <i class="fa fa-quote-left"></i> </span> <br><br><br><br> 
                                                        <p class="para-testimonial-div-design">
                                                            I am working with RoyalWorld . The platform is easy to use and 
                                                            optimize your campaign and for me it's 100% best POP and Push 
                                                            traffic. I am happy to recommend RoyalWorld as one of the few
                                                            networks you don't want to miss if you are looking for high-quality
                                                            traffic and excellent customer support!
                                                        </p> <br>
                                                        <h5 class="mb-0">PrimeR</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <br><br>
                                            <!-- Single Testimonials -->
                                            <div class="item-testimonial-box-div-design">
                                                <div class="row">
                                                    <div class="col-md-12" style="padding: 30px;">
                                                        <span class="testimonial-box"> <i class="fa fa-quote-left"></i> </span> <br><br><br><br> 
                                                        <p class="para-testimonial-div-design">
                                                            We have been working with the guys from RoyalWorld . 
                                                            I must say RoyalWorld is definitely one of the top networks . I
                                                            have ever worked with. Their account manager is always
                                                            helpful, willing to try to scale the activities with new offers. I
                                                            hope there will be many more successful years to come.
                                                        </p> <br>
                                                        <h5 class="mb-0">Mobinner</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <br><br>
                                            <!-- Single Testimonials -->
                                            <div class="item-testimonial-box-div-design">
                                                <div class="row">
                                                    <div class="col-md-12" style="padding: 30px;">
                                                        <span class="testimonial-box"> <i class="fa fa-quote-left"></i> </span> <br><br><br><br>
                                                        <p class="para-testimonial-div-design">
                                                            Basebone has been working closely with RoyalWorld and we couldn't be
                                                            happier with our partnership, as the high amount of traffic at fair 
                                                            rates makes a good match with our needs. Our account managers at 
                                                            RoyalWorld have always been professional, responsive and attentive
                                                            to our requests which makes for a great working relationship!
                                                        </p> <br>
                                                        <h5 class="mb-0">Basebone</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <!--<a class="next" onclick="plusSlides(1)" style="margin-top: 45%;">&#10095;</a>-->
                                </div>
                            </div>
                            <div class="col-md-2">
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-12">
                    <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">

                                </div>
                                <div class="col-md-6">
                                    <center>
                                        <span class="why-choose-us-div-design"> Download Our Android Apps From Here! </span> <br><br><br>
                                        <input type="button" onclick="downloadAndroidApps()" value="Download Apps Now" class="btn download-android-app-div-design" />
                                    </center>
                                </div>
                                <div class="col-md-3">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br><br>
                
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</body>
</html>
