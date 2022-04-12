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
    
    String user_sponser_id2 = null;
    String get_sponser_id2 = null;

</jsp:declaration>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<jsp:scriptlet>

    get_sponser_id2 = request.getParameter("UniqueNo");

    
    try
    {
        con = DBConnection.getConnect();
        
        ps1 = con.prepareStatement("SELECT * FROM user_sponser_details WHERE email=? AND user_sponser_id=?");
        
        ps1.setString(1, email);
        ps1.setString(2, get_sponser_id2);
        
        rs1 = ps1.executeQuery();
        
        if( rs1.next() )
        {
            user_sponser_id2 = rs1.getString("user_sponser_id");
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
        catch(Exception ee)
        {
            out.print("Another Exception 1 : "+ee);
        }
    }

</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Copy My Link </title>

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

                <br>
                    
                <div class="col-md-12">
                                        
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8" style="border: 1px solid #ff66ff; box-shadow: 2px 2px 2px #ff00ff; border-radius: 10px;">
                            <strong  style="font-size: 35px; color: #ff0000;"> <center> © Copy My User Link © </center> </strong>
                        </div>
                        <div class="col-md-2">
                            
                        </div>
                    </div>
                    
                    <br>
                    
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8">
                            <center>
                                <p>Click on the button to copy the text from the text field. Try to paste the text (e.g. ctrl+v) afterwards in a different window, to see the effect.</p>
                            </center>
                        </div>
                        <div class="col-md-2">
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-2">
                            
                        </div>
                        <div class="col-md-8">
                            <center>
                                <input class="copy_paste_textfield_div_design" type="text" value="http://localhost:8084/RoyalWorld/register.jsp?sponser_id=<jsp:expression>user_sponser_id2</jsp:expression>" id="myInput" disabled="" /> &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-primary" onclick="myFunction()">Copy Text</button>
                            </center>
                        </div>
                        <div class="col-md-2">
                            
                        </div>
                    </div>
                    
                    <br><br><br>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
            
        <script>
            
            function myFunction()
            {
                var copyText = document.getElementById("myInput");
                
                /* Select the text field */
                copyText.select();
                
                /* For mobile devices */
                copyText.setSelectionRange(0, 99999);
                
                /* Copy the text inside the text field */
                navigator.clipboard.writeText(copyText.value);
                
                /* Alert the copied text */
                alert("Link Copy Successfully ");
            }
            
        </script>
            
    </body>
</html>
