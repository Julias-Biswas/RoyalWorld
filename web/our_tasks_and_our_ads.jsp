<%-- 
    Document   : index
    Created on : 11 Jan, 2022, 7:38:20 PM
    Author     : julia
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.royalworld.database.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<jsp:declaration>
    Connection con = null;

    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    PreparedStatement ps4 = null;
    PreparedStatement ps5 = null;
    PreparedStatement ps6 = null;
    PreparedStatement ps7 = null;

    ResultSet rs1 = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    ResultSet rs5 = null;

    int id2 = 0;
    String task_id2 = null;
    String task_link2 = null;
    String task_number2 = null;
    String task_name2 = null;
    String task_desc2 = null;

    String date2 = null;
    String time2 = null;

    int total_tasks = 0;
    int my_climb_tasks = 0;

    String user_email2 = null;

    String climb_task_id2 = null;
    String climb_task_link2 = null;
    String climb_task_number2 = null;
    String climb_task_name2 = null;
    String another_date2 = null;
    String another_time2 = null;

</jsp:declaration>


<%

    Date d = new Date();
                                
    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
    date2 = sdf1.format(d);
    
    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
    time2 = sdf2.format(d);
    

    try {
        con = DBConnection.getConnect();

        total_tasks = 0;
        my_climb_tasks = 0;

        ps1 = con.prepareStatement("SELECT * FROM user_all_tasks_details");

        rs1 = ps1.executeQuery();

        ps4 = con.prepareStatement("SELECT * FROM register WHERE email=?");

        ps4.setString(1, email);
        
        rs3 = ps4.executeQuery();
        
        ps3 = con.prepareStatement("SELECT * FROM climb_my_tasks_day_by_day_details WHERE user_email=? AND date1=?");
        
        ps3.setString(1, user_email2);
        ps3.setString(2, date2);

        rs4 = ps3.executeQuery();
        
        while (rs1.next()) {
            total_tasks = total_tasks + 1;
        }

        if (rs3.next()) {
            user_email2 = rs3.getString("email");
        }
        
        while(rs4.next())
        {
            if( total_tasks > my_climb_tasks )
            {
                my_climb_tasks = my_climb_tasks + 1;
            }
            else if( total_tasks < my_climb_tasks )
            {
                my_climb_tasks = total_tasks;
            }
        }

    } catch (Exception e) {
        out.print("Exception 1 : " + e);
    } finally {
        try {
            rs1.close();
            rs3.close();
            ps1.close();
            ps4.close();
            con.close();
        } catch (Exception ee) {
            out.print("Another Exception 1 : " + ee);
        }
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Royal World - All Ads </title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link rel="stylesheet" href="css/style.css" />

        <script>

            function myTasks()
            {
                var message1 = "This Task is comming soon. Thank You...!!!";

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
                    <a href="profile.jsp" class="previous-logo-design-div" title="Back To Profile Page">&#10094;</a>
                <jsp:scriptlet>
                    }
                </jsp:scriptlet>

                <br>

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4">

                        </div>
                        <div class="col-md-8">
                            <center>
                                <b class="why-choose-us-div-design">
                                    Your All Tasks
                                </b>
                            </center>
                        </div>
                    </div>

                    <br><br>

                    <div class="row">
                        <div class="col-md-5">
                            <center>
                                <b class="complete-today-tasks-div-design">
                                    Total Tasks :  <jsp:expression>total_tasks+" / "+total_tasks</jsp:expression>
                                    </b> <br><br>
                                    <b class="complete-today-tasks-div-design">
                                        Your Completed Tasks : <jsp:expression>my_climb_tasks+" / "+total_tasks</jsp:expression> 
                                    </b> <br><br>
                                </center>
                            </div>
                                    
                            <jsp:scriptlet>
                            
                                try
                                {
                                    con = DBConnection.getConnect();
                                    
                                    con.setAutoCommit(false);
                                    
                                    ps5 = con.prepareStatement("SELECT * FROM every_day_climb_task_numbers WHERE user_email=? AND date1=?");
                                    
                                    ps5.setString(1, user_email2);
                                    ps5.setString(2, date2);
                                    
                                    rs5 = ps5.executeQuery();
                                    
                                    if( rs5.next() )
                                    {
                                        // Update Part                                        
                                        ps7 = con.prepareStatement("UPDATE every_day_climb_task_numbers SET climb_user_tasks=? , time1=? WHERE user_email=? AND date1=?");
                                        
                                        ps7.setInt(1, my_climb_tasks);
                                        ps7.setString(2, time2);
                                        ps7.setString(3, user_email2);
                                        ps7.setString(4, date2);
                                        
                                        int rowCount2 = ps7.executeUpdate();
                                        
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
                                    else
                                    {
                                        // Insert Part
                                        ps6 = con.prepareStatement("INSERT INTO every_day_climb_task_numbers(user_email, total_tasks, climb_user_tasks, date1, time1) VALUES(?,?,?,?,?)");
                                        
                                        ps6.setString(1, user_email2);
                                        ps6.setInt(2, total_tasks);
                                        ps6.setInt(3, my_climb_tasks);
                                        ps6.setString(4, date2);
                                        ps6.setString(5, time2);
                                        
                                        int rowCount1 = ps6.executeUpdate();
                                        
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
                                    
                            <div class="col-md-7 item-testimonial-box-div-design" style="background-color: #f7fefa;">
                                
                            <jsp:scriptlet>

                                try {
                                    con = DBConnection.getConnect();

                                    ps2 = con.prepareStatement("SELECT * FROM user_all_tasks_details");

                                    rs2 = ps2.executeQuery();

                                    while (rs2.next()) {
                                        id2 = rs2.getInt("id");
                                        task_id2 = rs2.getString("task_id");
                                        task_link2 = rs2.getString("task_link");
                                        task_number2 = rs2.getString("task_number");
                                        task_name2 = rs2.getString("task_name");
                                        task_desc2 = rs2.getString("task_desc");
                                            
                            </jsp:scriptlet>
                            <div class="row">
                                <div class="col-md-1 col-sm-1">

                                </div>
                                <div class="col-md-10">
                                    <form action="AddMyTaskDayByDayDetails?MyTaskID=<jsp:expression>task_id2</jsp:expression>" method="POST">
                                        <input type="text" name="user_email1" value="<jsp:expression>user_email2</jsp:expression>" style="display: none;" />
                                        <input type="text" name="task_id1" value="<jsp:expression>task_id2</jsp:expression>" style="display: none;" />
                                        <input type="text" name="task_link1" value="<jsp:expression>task_link2</jsp:expression>" style="display: none;" />
                                        <input type="text" name="task_number1" value="<jsp:expression>task_number2</jsp:expression>" style="display: none;" />
                                        <input type="text" name="task_name1" value="<jsp:expression>task_name2</jsp:expression>" style="display: none;" />
                                            <button style="background-color: #ffffff; border: 0px solid #ffffff;" class="my-task-hyperlink-div-design" title="Click Me"> 
                                                <div class="col-md-12 our-varity-div-design" id="example1">
                                                    <center>
                                                        <strong class="task-number-div-design"> <jsp:expression>task_number2</jsp:expression> </strong>
                                                        <h3 class="my-task-span-text-div-design"> <jsp:expression>task_name2</jsp:expression> </h3>
                                                        <p style="font-size: 18px;">
                                                        <jsp:expression>task_desc2</jsp:expression>
                                                        </p> <br>
                                                        <p style="font-size: 18px;"> Thank You &#128522; </p>
                                                    </center>
                                                </div>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                            <jsp:scriptlet> }
                                } catch (Exception e) {
                                    out.print("Exception 2 : " + e);
                                } finally {
                                    try {
                                        rs2.close();
                                        ps2.close();
                                        con.close();
                                    } catch (Exception ee) {
                                        out.print("Another Exception 2 : " + ee);
                                    }
                                }

                            </jsp:scriptlet>

                            <br>

                        </div>
                    </div>
                    <br><br><br>
                </div>

                <jsp:include page="footer.jsp"></jsp:include>

            </div>
        </div>
    </body>
</html>
