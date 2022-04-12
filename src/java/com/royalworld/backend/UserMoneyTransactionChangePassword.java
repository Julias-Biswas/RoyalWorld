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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julia
 */
public class UserMoneyTransactionChangePassword extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String account_no2 = req.getParameter("account_no1");
        String old_transaction_password2 = req.getParameter("old_transaction_password1");
        String new_transaction_password2 = req.getParameter("new_transaction_password1");
        String confirm_transaction_password2 = req.getParameter("confirm_transaction_password1");
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        
        ResultSet rs1 = null;
        
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Register, Please Register Now...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else if( (old_transaction_password2 == null ? new_transaction_password2 == null : old_transaction_password2.equals(new_transaction_password2)) || old_transaction_password2.equals(new_transaction_password2))
        {
            req.setAttribute("error_message", "Error : Old Transaction Password & New Transaction Password Both are Same , Please Enter Differente...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("user_transaction_change_password.jsp");
            rd2.include(req, resp);
        }
        else
        {
            if( (new_transaction_password2 == null ? confirm_transaction_password2 != null : !new_transaction_password2.equals(confirm_transaction_password2)) || !new_transaction_password2.equals(confirm_transaction_password2) )
            {
                req.setAttribute("error_message", "Error : New Transaction Password & Confirm New Transaction Password Can't Matched...!!!");
            
                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("user_transaction_change_password.jsp");
                rd2.include(req, resp);
            }
            else
            {
                try
                {
                    con = DBConnection.getConnect();
                    
                    con.setAutoCommit(false);
                    
                    
                    /*
                    * ----------   For User Account Details Part   ----------
                    */
                    ps1 = con.prepareStatement("SELECT * FROM user_account_details WHERE email=? AND account_no=?");
                    
                    ps1.setString(1, email2);
                    ps1.setString(2, account_no2);
                    
                    
                    rs1 = ps1.executeQuery();
                    
                    
                    if( rs1.next() )
                    {
                        /*
                        *   ----------   For User Account Details Part   ----------
                        */
                        ps2 = con.prepareStatement("UPDATE user_account_details SET money_transaction_password=? WHERE email=? AND account_no=? AND money_transaction_password=?");
                        
                        ps2.setString(1, new_transaction_password2);
                        ps2.setString(2, email2);
                        ps2.setString(3, account_no2);
                        ps2.setString(4, old_transaction_password2);
                        
                        
                        int i1 = ps2.executeUpdate();
                        
                        
                        if( i1 > 0 )
                        {
                            con.commit();

                            req.setAttribute("success_message", "Success : New Transaction Password Updated Successfully...!!!");

                            RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                            rd1.include(req, resp);

                            RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                            rd2.include(req, resp);
                        }
                        else
                        {
                            con.rollback();

                            req.setAttribute("error_message", "Error : Old Transaction Password is Incorrect , Please Enter Valid Old Transaction Password...!!!");

                            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                            rd1.include(req, resp);

                            RequestDispatcher rd2 = req.getRequestDispatcher("user_transaction_change_password.jsp");
                            rd2.include(req, resp);
                        }
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("error_message", "Error : Account Number is Incorrect , Please Enter Valid Account Number...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("user_transaction_change_password.jsp");
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
                        rs1.close();
                        ps1.close();
                        ps2.close();
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
}
