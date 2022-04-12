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
public class ForgotPassword extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String new_password2 = req.getParameter("new_password1");
        String confirm_password2 = req.getParameter("confirm_password1");
        
        Connection con = null;
        
        try
        {
            if( !new_password2.equals(confirm_password2) )
            {
                req.setAttribute("error_message", "Password : New Password and Confirm Password didn't Matched...!!!");

                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("forgot_password.jsp");
                rd2.include(req, resp);
            }
            else if( new_password2.equals(confirm_password2) )
            {
                try
                {
                    con = DBConnection.getConnect();
                    
                    con.setAutoCommit(false);

                    PreparedStatement ps = con.prepareStatement("UPDATE register SET password=? WHERE email=?");
                    
                    ps.setString(1, confirm_password2);
                    ps.setString(2, email2);
                    
                    int i = ps.executeUpdate();
                    
                    if( i > 0 )
                    {
                        con.commit();
                        
                        req.setAttribute("success_message", "Password : Password Updated Successfully...!!!");
                
                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                        rd2.include(req, resp);
                    }
                    else
                    {
                        con.rollback();
                        
                        req.setAttribute("error_message", "Password : Password Updation Failed...!!!");
                
                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("forgot_password.jsp");
                        rd2.include(req, resp);
                    }
                }
                catch(SQLException | ServletException | IOException e)
                {
                    try
                    {
                        out.print("Inner Exception : "+e);
                        con.rollback();
                    }
                    catch(Exception ee)
                    {
                        out.print("Exception : "+ee);
                    }
                }
            }
        }
        catch(ServletException | IOException e)
        {
            out.print("Outer Exception : "+e);
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception eee)
            {
                out.print("Exception : "+eee);
            }
        }
        
    }
    
}
