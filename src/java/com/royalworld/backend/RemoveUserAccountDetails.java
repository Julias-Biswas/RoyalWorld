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
public class RemoveUserAccountDetails extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doServices(req, resp);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doServices(req, resp);
    }

    protected void doServices(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String bank_account_id2 = req.getParameter("bank_account_id1");
        String email2 = req.getParameter("email1");
        String account_no2 = req.getParameter("account_no1");
        
        
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
        else if( bank_account_id2 == null || bank_account_id2.equals("") )
        {
            req.setAttribute("error_message", "Error : Bank Not Found , Please Select Any Bank...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("view_banks_details.jsp");
            rd2.include(req, resp);
        }
        else if( account_no2 == null || account_no2.equals("") )
        {
            req.setAttribute("error_message", "Error : Bank Not Found , Please Select Any Bank...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("view_banks_details.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
                
                con.setAutoCommit(false);
                
                /*
                *   ----------   For User Account Details Part   ----------
                */
                ps1 = con.prepareStatement("SELECT * FROM user_account_details WHERE id=? AND email=? AND account_no=?");
                
                ps1.setString(1, bank_account_id2);
                ps1.setString(2, email2);
                ps1.setString(3, account_no2);
                
                
                rs1 = ps1.executeQuery();
                
                
                if( rs1.next() )
                {
                    /*
                    *   ----------   For User Account Details Part   ----------
                    */
                    ps2 = con.prepareStatement("DELETE FROM user_account_details WHERE id=? AND email=? AND account_no=?");
                    
                    ps2.setString(1, bank_account_id2);
                    ps2.setString(2, email2);
                    ps2.setString(3, account_no2);
                    
                      
                    int i1 = ps2.executeUpdate();
                     
                    
                    if( i1 > 0 )
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Account Deleted Successfully...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("view_banks_details.jsp");
                        rd2.include(req, resp);
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("error_message", "Error : Account Deleted Failed...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("edit_user_bank_details.jsp");
                        rd2.include(req, resp);
                    }
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
