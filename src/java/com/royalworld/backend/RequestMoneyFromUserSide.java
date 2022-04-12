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
import java.sql.ResultSet;
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
public class RequestMoneyFromUserSide extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String bank_name2 = req.getParameter("bank_name1");
        String acc_no2 = req.getParameter("acc_no1");
        String re_acc_no2 = req.getParameter("re_acc_no1");
        String bank_ifsc2 = req.getParameter("bank_ifsc1");
        String mobile_no2 = req.getParameter("mobile_no1");
        String acc_holder_name2 = req.getParameter("acc_holder_name1");
        String request_money2 = req.getParameter("request_money1");
        
        
        double userTotalBalance ;
        double userRequestMoney ;
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        
        ResultSet rs1 = null;
        ResultSet rs2 = null;
                
        
        // ----- Date & Time -----
        Date d = new Date();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        String date2 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time2 = sdf2.format(d);
        
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Register, Please Register Now...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else if( (bank_name2 == null || bank_name2.equals("")) && (bank_name2 == "Select Bank" || bank_name2.equals("Select Bank")) )
        {
            req.setAttribute("error_message", "Error : Bank Name Can't be Choosen...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else if( (acc_no2 == null ? re_acc_no2 != null : !acc_no2.equals(re_acc_no2)) || !acc_no2.equals(re_acc_no2) )
        {
            req.setAttribute("error_message", "Error : Account No & Re-Account No Can't Matched...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else if( bank_ifsc2 == null || bank_ifsc2.equals("") )
        {
            req.setAttribute("error_message", "Error : Bank IFSC Can't be Empty...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else if( mobile_no2 == null || mobile_no2.equals("") )
        {
            req.setAttribute("error_message", "Error : Mobile Number Can't be Empty...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else if( acc_holder_name2 == null || acc_holder_name2.equals("") )
        {
            req.setAttribute("error_message", "Error : Account Holder Name Can't be Empty...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else if( (request_money2 == null || request_money2.equals("")) && (request_money2 == "Select Amount" || request_money2.equals("Select Amount")) )
        {
            req.setAttribute("error_message", "Error : Request Money Can't be Choosen...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
                
                con.setAutoCommit(false);
                
                ps1 = con.prepareStatement("SELECT * FROM user_total_balance_details WHERE user_email=?");
                
                ps1.setString(1, email2);
                
                rs1 = ps1.executeQuery();
                
                if( rs1.next() )
                {
                    userTotalBalance = rs1.getDouble("user_total_balance");
                    
                    
                    // Convert String into Double
                    userRequestMoney = Double.parseDouble(request_money2);
                    
                    
                    ps3 = con.prepareStatement("SELECT * FROM user_request_money_details WHERE user_email=? AND date1=?");
                    
                    ps3.setString(1, email2);
                    ps3.setString(2, date2);
                    
                    rs2 = ps3.executeQuery();
                    
                    if( rs2.next() )
                    {
                        req.setAttribute("error_message", "Error : You can do Only One Transaction in One Day, Thank You...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
                        rd2.include(req, resp);
                    }
                    else
                    {
                        if( userTotalBalance < userRequestMoney )
                        {
                            req.setAttribute("error_message", "Error : Your Total Balance is Less Than Your Request Balance...!!!");

                            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                            rd1.include(req, resp);

                            RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
                            rd2.include(req, resp);
                        }
                        else if( userTotalBalance > userRequestMoney )
                        {

                            ps2 = con.prepareStatement("INSERT INTO user_request_money_details(user_email, bank_name, account_no, bank_ifsc, mobile_no, account_holder_name, request_amount, date1, time1, amount_paid_or_not) VALUES(?,?,?,?,?,?,?,?,?,?)");

                            ps2.setString(1, email2);
                            ps2.setString(2, bank_name2);
                            ps2.setString(3, acc_no2);
                            ps2.setString(4, bank_ifsc2);
                            ps2.setString(5, mobile_no2);
                            ps2.setString(6, acc_holder_name2);
                            ps2.setDouble(7, userRequestMoney);
                            ps2.setString(8, date2);
                            ps2.setString(9, time2);
                            ps2.setString(10, "Success");

                            int rowCount1 = ps2.executeUpdate();

                            if( rowCount1 > 0 )
                            {
                                con.commit();

                                req.setAttribute("success_message", "Success : Money Request Successfully, You will Receive the Money within 24 Hours...!!!");

                                RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                                rd1.include(req, resp);

                                RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                                rd2.include(req, resp);
                            }
                            else
                            {
                                con.rollback();

                                req.setAttribute("error_message", "Error : Money Request Failed, Due to Some Technical Issue...!!!");

                                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                                rd1.include(req, resp);

                                RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
                                rd2.include(req, resp);
                            }

                        }
                    }
                    
                }
            }
            catch(SQLException | NumberFormatException | ServletException | IOException e)
            {
                try
                {
                    con.rollback();
                    
                    req.setAttribute("error_message", "Error : Money Request Failed, Due to Some Technical Issue...!!!");
            
                    RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("request_for_withdraw_money.jsp");
                    rd2.include(req, resp);
                }
                catch(SQLException | ServletException | IOException eee)
                {
                    out.print("Inner Exception 1 : "+eee);
                }
                out.print("Exception 1 : "+e);
            }
            finally
            {
                try
                {
                    rs2.close();
                    rs1.close();
                    ps3.close();
                    ps2.close();
                    ps1.close();
                    con.close();
                }
                catch(Exception ee)
                {
                    out.print("Another Exception 1 : "+ee);
                }
            }
        }
        
    }
    
}
