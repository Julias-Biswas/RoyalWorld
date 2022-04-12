<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> RoyalWorld : Update Image </title>

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
                                    <center> <strong style="font-size: 30px; color: #ee3b24;">Update Image</strong> </center> <br>
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
                                    <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="220" width="200" style="border: 0.5px solid #cccccc; border-radius: 50%; image-resolution: normal;" />
                                    </div>
                                    <div class="col-md-8 col-sm-8">
                                        <form action="UploadProfilePicture" method="POST" enctype="multipart/form-data">
                                            <b style="color: #6600cc; font-size: 16px;"> Name : <span style="color: #000000; font-size: 16px;"> <jsp:expression>name</jsp:expression> </span> </b> <br><br>
                                            <b style="color: #6600cc; font-size: 16px;"> Email : <span style="color: #000000; font-size: 16px;"> <jsp:expression>email</jsp:expression> </span> </b>  <br><br>
                                            <b style="color: #6600cc; font-size: 16px;"> Contact Number : <span style="color: #000000; font-size: 16px;"> <jsp:expression>contact_no</jsp:expression> </span> </b> <br><br>
                                            <input type="file" name="uploadprofilepic1" /> <br><br>
                                            <input type="submit" value="Upload Image" class="btn upload-image-button-design-div" /> <br><br>
                                        </form>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">

                            </div>
                        </div>

                        <br><br>

                    </div>
                    <br><br><br>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
