/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import com.royalworld.database.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julia
 */
public class Register extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String sponser_id2 = req.getParameter("sponser_id1");
        String sponser_name2 = req.getParameter("sponser_name1");
        String sponser_contact_no2 = req.getParameter("sponser_contact_no1");
        String user_sponser_email2 = req.getParameter("user_sponser_email1");
        String position2 = req.getParameter("position1");
        
        String user_name2 = req.getParameter("user_name1");
        String user_email2 = req.getParameter("user_email1");
        String user_contact_no2 = req.getParameter("user_contact_no1");
        String user_password2 = req.getParameter("user_password1");
        String user_confirm_password2 = req.getParameter("user_confirm_password1");
        String user_state2 = req.getParameter("user_state1");
        String term_condition2 = req.getParameter("term_and_condition1");
        
        String user_sponser_id2 = Integer.toString(user_email2.hashCode());
        
        
        /*
        * ----- Date And Time -----
        */
        Date d = new Date();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        String date2 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time2 = sdf2.format(d);
                
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;
        PreparedStatement ps6 = null;
        PreparedStatement ps7 = null;
        
        
        if( (sponser_id2 == null) || (sponser_id2.equals("")) )
        {
            sponser_id2 = "- Not Available -";
        }
        if( (sponser_name2 == null) || (sponser_name2.equals("")) )
        {
            sponser_name2 = "- Not Available -";
        }
        if( (sponser_contact_no2 == null) || (sponser_contact_no2.equals("")) )
        {
            sponser_contact_no2 = "- Not Available -";
        }
        if( (user_sponser_email2 == null) || (user_sponser_email2.equals("")) )
        {
            user_sponser_email2 = "- Not Available -";
        }
        
        if( (position2 == null) || ( position2.equals("")) )
        {
            req.setAttribute("error_message", "Position : Please Select Any Position...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
            
            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else
        {
            if( !user_password2.equals(user_confirm_password2) )
            {
                req.setAttribute("error_message", "Password : Password Can't Matched...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
                rd2.include(req, resp);
            }
            else if( user_password2.equals(user_confirm_password2) )
            {
                try
                {
                    con = DBConnection.getConnect();
                    
                    con.setAutoCommit(false);

                    
                    /*
                    *       ----------   For Register Part     ----------
                    */
                    ps1 = con.prepareStatement("INSERT INTO register (name , email , contact_no , password , state , term_and_condition) VALUES(?,?,?,?,?,?)");

                    ps1.setString(1, user_name2);
                    ps1.setString(2, user_email2);
                    ps1.setString(3, user_contact_no2);
                    ps1.setString(4, user_password2);
                    ps1.setString(5, user_state2);
                    ps1.setString(6, term_condition2);
                    
                    
                    /*
                    *      ----------   For Sponser Details   ----------
                    */
                    ps2 = con.prepareStatement("INSERT INTO sponser_details (email , sponser_id , sponser_name , sponser_contact_no , position) VALUES(?,?,?,?,?)");
                    
                    ps2.setString(1, user_email2);
                    ps2.setString(2, sponser_id2);
                    ps2.setString(3, sponser_name2);
                    ps2.setString(4, sponser_contact_no2);
                    ps2.setString(5, position2);
                    
                    
                    /*
                    *       ----------   For Profile Picture   ----------
                    */
                    ps3 = con.prepareStatement("INSERT INTO profile_picture(email , path) VALUES(?,?)");
                    
                    ps3.setString(1, user_email2);
                    ps3.setString(2, "default_image.png");
                    
                    
                    /*
                    *       ----------   For Update KYC Details   ---------- 
                    */
                    ps4 = con.prepareStatement("INSERT INTO update_kyc_details (email , aadhaar_no , pan_no) VALUES(?,?,?)");
                    
                    ps4.setString(1, user_email2);
                    ps4.setString(2, "");
                    ps4.setString(3, "");
                    
                    /*
                    *       ----------   For Update User Details   ---------- 
                    */
                    ps5 = con.prepareStatement("INSERT INTO update_user_details (email , father_name , mother_name , address , city , state , country , pin) VALUES(?,?,?,?,?,?,?,?)");
                    
                    ps5.setString(1, user_email2);
                    ps5.setString(2, "");
                    ps5.setString(3, "");
                    ps5.setString(4, "");
                    ps5.setString(5, "");
                    ps5.setString(6, user_state2);
                    ps5.setString(7, "");
                    ps5.setString(8, "");
                    
                    /*
                    *       ----------   For User Sponser Details   ---------- 
                    */
                    ps6 = con.prepareStatement("INSERT INTO user_sponser_details (email , user_sponser_id , user_sponser_name , user_sponser_contact_no) VALUES(?,?,?,?)");
                    
                    ps6.setString(1, user_email2);
                    ps6.setString(2, user_sponser_id2);
                    ps6.setString(3, user_name2);
                    ps6.setString(4, user_contact_no2);
                    
                    
                    /*
                    *       ----------   For Refer Income Details   ----------
                    */
                    ps7 = con.prepareStatement("INSERT INTO refer_income_details (user_sponser_email, user_sponser_id, user_sponser_name, sponsed_email, user_sponser_income, date1, time1) VALUES (?,?,?,?,?,?,?)");
                    
                    ps7.setString(1, user_sponser_email2);
                    ps7.setString(2, sponser_id2);
                    ps7.setString(3, sponser_name2);
                    ps7.setString(4, user_email2);
                    ps7.setDouble(5, 0);
                    ps7.setString(6, date2);
                    ps7.setString(7, time2);
                            
                    
                    int i1 = ps1.executeUpdate();
                    int i2 = ps2.executeUpdate();
                    int i3 = ps3.executeUpdate();
                    int i4 = ps4.executeUpdate();
                    int i5 = ps5.executeUpdate();
                    int i6 = ps6.executeUpdate();
                    int i7 = ps7.executeUpdate();
                    
    
                    if( i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0 && i5 > 0 && i6 > 0 && i7 > 0 )
                    {
                        con.commit();
                        
                        req.setAttribute("success_message", "Success : Register Successful , Please Login Now...!!!");
                        
                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);
                        
                        RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                        rd2.include(req, resp);
                        
                        /*
                        *   ---------- For Send Mail To User ----------
                        */                        
                        String mail_subject = "RoyalWorld: Account Created Successfully";
                        String mail_message = "Dear "+user_name2+","
                                + "\n\nCongratulations! You have successfully registered on the RoyalWorld Website."
                                + "As soon as your account is active and you can login in your account."
                                + "You now have access to our current and future opportunities."
                                + "\n\nIf you would like to be notified of future opportunities,"
                                + " please create alert in our RoyalWorld Website."
                                + "\n\n\t\tThank You "+user_name2+""
                                + "\n\nBest Regards,"
                                + "\nRoyalWorld Global Talent Acquisition Team"
                                + "\n\nNote: This is an auto generated e-mail, therefore please do not reply to this email."
                                + "\n\n\n\n\n==========----------==========----------=========="
                                + "\nNotice: The information contained in this e-mail\n" +
                                    "message and/or attachments to it may contain\n" +
                                    "confidential or privileged information. If you are\n" +
                                    "not the intended recipient, any dissemination, use,\n" +
                                    "review, distribution, printing or copying of the\n" +
                                    "information contained in this e-mail message\n" +
                                    "and/or attachments to it are strictly prohibited. If\n" +
                                    "you have received this communication in error,\n" +
                                    "please notify us by reply e-mail or telephone and\n" +
                                    "immediately and permanently delete the message\n" +
                                    "and any attachments. Thank you";
                        
                        SendConfirmationMailToUser.sendConfirmationMailToUser(user_email2, mail_subject, mail_message);
                        
                    }
                    else
                    {
                        con.rollback();
                        
                        req.setAttribute("error_message", "Error : Please Checked Your Documents...!!!");
                        
                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);
                        
                        RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
                        rd2.include(req, resp);
                    }
                }
                catch(SQLException | ServletException | IOException e)
                {
                    try
                    {
                        con.rollback();
                        
                        out.print("SQLException | ServletException | IOException : "+e);
                        
                        req.setAttribute("error_message", "Error : Email is Already Exists, Please Enter Different Email...!!!");
                        
                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);
                        
                        RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
                        rd2.include(req, resp);
                    }
                    catch(ServletException | IOException | SQLException ee)
                    {
                        out.print("Exception : "+ee);
                    }
                }
                finally
                {
                    try
                    {
                        ps1.close();
                        ps2.close();
                        ps3.close();
                        ps4.close();
                        ps5.close();
                        ps6.close();
                        ps7.close();
                        con.close();
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                }
            }
        }
    }
}
