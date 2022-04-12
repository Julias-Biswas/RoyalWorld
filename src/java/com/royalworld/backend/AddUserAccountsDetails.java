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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author julia
 */
public class AddUserAccountsDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String bank_name2 = req.getParameter("bank_name1");
        String account_no2 = req.getParameter("account_no1");
        String re_account_no2 = req.getParameter("re_account_no1");
        String bank_ifsc2 = req.getParameter("bank_ifsc1");
        String account_holder_name2 = req.getParameter("account_holder_name1");
        String mobile_no2 = req.getParameter("mobile_no1");
        String transaction_password2 = req.getParameter("transaction_password1");
        String re_transaction_password2 = req.getParameter("re_transaction_password1");
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Register, Please Register Now...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else if( bank_name2 == null || bank_name2.equals("") )
        {
            req.setAttribute("error_message", "Error : You Can't Select Any Bank , Please Select Any Bank...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("user_add_accounts.jsp");
            rd2.include(req, resp);
        }
        else if( (account_no2 == null ? re_account_no2 != null : !account_no2.equals(re_account_no2)) || !account_no2.equals(re_account_no2) )
        {
            req.setAttribute("error_message", "Error : Account No & Re-Account No Can't Matched...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("user_add_accounts.jsp");
            rd2.include(req, resp);
        }
        else if( (transaction_password2 == null ? re_transaction_password2 != null : !transaction_password2.equals(re_transaction_password2)) || !transaction_password2.equals(re_transaction_password2) )
        {
            req.setAttribute("error_message", "Error : Transaction Password & Re-Transaction Password Can't Matched...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("user_add_accounts.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
                
                con.setAutoCommit(false);
                
                /*
                *   ----------   For Add User Account Details Part   ----------
                */
                ps1 = con.prepareStatement("INSERT INTO user_account_details (email , bank_name , account_no , bank_ifsc_no , account_holder_name , bank_register_mobile_no , money_transaction_password) VALUES(?,?,?,?,?,?,?)");
                
                ps1.setString(1, email2);
                ps1.setString(2, bank_name2);
                ps1.setString(3, account_no2);
                ps1.setString(4, bank_ifsc2);
                ps1.setString(5, account_holder_name2);
                ps1.setString(6, mobile_no2);
                ps1.setString(7, transaction_password2);
                    
                    
                int i1 = ps1.executeUpdate();


                if( i1 > 0 )
                {
                    con.commit();

                    req.setAttribute("success_message", "Success : Bank Account Added Successfully...!!!");

                    RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("user_add_accounts.jsp");
                    rd2.include(req, resp);
                }
                else
                {
                    con.rollback();

                    req.setAttribute("error_message", "Error : Bank Account Can't Be Added Successfully...!!!");

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
