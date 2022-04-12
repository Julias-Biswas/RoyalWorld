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
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    
    
    String user_sponser_id2 = null;
    String user_sponser_name2 = null;
    String user_sponser_contact_no2 = null;
    String position2 = null;

    String sponsed_email2 = null;
    String sponsed_name2 = null;
    String sponsed_contact2 = null;
    String sponsed_state2 = null;

    int serialNumber;
    
</jsp:declaration>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - Invitation Details </title>

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
                    <a href="login.jsp" class="previous-logo-design-div" title="Back To Our Plan Page">&#10094;</a>
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
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-10">
                            <div class="row" style="border: 1px solid #ff66ff; box-shadow: 2px 2px 2px #ff00ff; border-radius: 10px;">
                                <div class="col-md-12">
                                    <strong  style="font-size: 35px; color: #ff0000;"> <center> © Your Invitation Details © </center> </strong>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                </div>

                <br><br>
                
                <div class="col-md-12">
                    
                    <div class="row">
                        <div class="col-md-1">
                            
                        </div>
                        <div class="col-md-10">
                        
                            <table class="table table-hover table-bordered">
                                <thead class="bg-primary">
                                    <tr>
                                        <th scope="col">Serial No</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Contact No</th>
                                        <th scope="col">State</th>
                                        <th scope="col">Position</th>
                                    </tr>
                                </thead>
                                
                                <jsp:scriptlet>

                                    serialNumber = 0;
                                
                                    try {
                                        con = DBConnection.getConnect();

                                        ps1 = con.prepareStatement("SELECT * FROM user_sponser_details WHERE email=?");

                                        ps1.setString(1, email);

                                        rs1 = ps1.executeQuery();

                                        if (rs1.next()) {

                                            user_sponser_id2 = rs1.getString("user_sponser_id");
                                            user_sponser_name2 = rs1.getString("user_sponser_name");
                                            user_sponser_contact_no2 = rs1.getString("user_sponser_contact_no");

                                            ps2 = con.prepareStatement("SELECT * FROM sponser_details WHERE sponser_id=? AND sponser_name=? AND sponser_contact_no=?");

                                            ps2.setString(1, user_sponser_id2);
                                            ps2.setString(2, user_sponser_name2);
                                            ps2.setString(3, user_sponser_contact_no2);

                                            rs2 = ps2.executeQuery();

                                            while( rs2.next() )
                                            {
                                                sponsed_email2 = rs2.getString("email");
                                                position2 = rs2.getString("position");

                                                serialNumber = serialNumber + 1;

                                                ps3 = con.prepareStatement("SELECT * FROM register WHERE email=?");

                                                ps3.setString(1, sponsed_email2);

                                                rs3 = ps3.executeQuery();

                                                if( rs3.next() )
                                                {
                                                    sponsed_name2 = rs3.getString("name");
                                                    sponsed_contact2 = rs3.getString("contact_no");
                                                    sponsed_state2 = rs3.getString("state");

                                </jsp:scriptlet>

                                        <tbody>
                                            <tr>
                                                <th scope="row"><jsp:expression>serialNumber</jsp:expression></th>
                                                <td><jsp:expression>sponsed_name2</jsp:expression></td>
                                                <td><jsp:expression>sponsed_email2</jsp:expression></td>
                                                <td><jsp:expression>sponsed_contact2</jsp:expression></td>
                                                <td><jsp:expression>sponsed_state2</jsp:expression></td>
                                                <td><jsp:expression>position2</jsp:expression></td>
                                            </tr>
                                          </tbody>

                                <jsp:scriptlet>

                                                }
                                            }

                                </jsp:scriptlet>

                                <jsp:scriptlet>

                                            }
                                        } catch (Exception e) {
                                            out.print("Exception : " + e);
                                        } finally {
                                            try {
                                                rs3.close();
                                                rs2.close();
                                                rs1.close();
                                                ps3.close();
                                                ps2.close();
                                                ps1.close();
                                                con.close();
                                            } catch (Exception e) {
                                                out.print("Another Exception : " + e);
                                            }
                                        }
                                </jsp:scriptlet>
                                
                            </table>

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
