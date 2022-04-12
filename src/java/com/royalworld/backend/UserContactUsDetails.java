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
public class UserContactUsDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String name2 = req.getParameter("name1");
        String email2 = req.getParameter("email1");
        String subject2 = req.getParameter("subject1");
        String message2 = req.getParameter("message1");
        
        String date2 = null;
        String time2 = null;
        
        
        /*
        * ----------   For Date   ----------
        */
        Date d = new Date();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        date2 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        time2 = sdf2.format(d);
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Empty , Please Provide Email...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
            rd2.include(req, resp);
        }
        else if( name2 == null || name2.equals("") )
        {
            req.setAttribute("error_message", "Error : Name Can't Be Empty, Please Provide Name...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
            rd2.include(req, resp);
        }
        else if( subject2 == null || subject2.equals("") )
        {
            req.setAttribute("error_message", "Error : Subject Can't Be Empty, Please Provide Subject...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
            rd2.include(req, resp);
        }
        else if( message2 == null || message2.equals("") )
        {
            req.setAttribute("error_message", "Error : Message Can't Be Empty, Please Provide Message...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
                
                con.setAutoCommit(false);
                
                /*
                *   ----------   For Add User Contact Us Details Part   ----------
                */
                ps1 = con.prepareStatement("INSERT INTO user_contact_us_details (name , email , subject , message , date1 , time1) VALUES(?,?,?,?,?,?)");
                
                ps1.setString(1, name2);
                ps1.setString(2, email2);
                ps1.setString(3, subject2);
                ps1.setString(4, message2);
                ps1.setString(5, date2);
                ps1.setString(6, time2);
                    
                    
                int i1 = ps1.executeUpdate();


                if( i1 > 0 )
                {
                    con.commit();

                    req.setAttribute("success_message", "Success : Message Send Successfully...!!!");

                    RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
                    rd2.include(req, resp);
                    
                    /*
                    *   ---------- For Send Mail To User ----------
                    */ 
                    String mail_subject = "Thank You "+name2+" For Submitting Your Query";
                    String mail_message = "Your query to RoyalWorld send successfully! We will revert soon"
                            + "and as soon as your query is solved by our teams. So to be pleased passioned."
                            + " Thanking you to co-opperate with us."
                            + "\n\n\t\tThank You"+name2+""
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
                    
                    SendConfirmationMailToUser.sendConfirmationMailToUser(email2, mail_subject, mail_message);
                    
                }
                else
                {
                    con.rollback();

                    req.setAttribute("error_message", "Error : Message Can't Be Send Successfully...!!!");

                    RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("contact_us.jsp");
                    rd2.include(req, resp);
                }
            }
            catch(SQLException | ServletException | IOException e)
            {
                try
                {
                    out.print("SQLException | ServletException | IOException : "+e);
                    con.rollback();
                }
                catch(Exception ee)
                {
                    out.print("Exception : "+ee);
                }
            }
            finally
            {
                try
                {
                    ps1.close();
                    con.close();
                }
                catch(Exception e)
                {
                    out.print("Another Exception : "+e);
                }
            }
        }
    }
}
