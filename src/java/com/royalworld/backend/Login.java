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
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class Login extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String email2 = req.getParameter("email1");
        String password2 = req.getParameter("password1");
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        
        try
        {
            con = DBConnection.getConnect();
            
            
            /*
            *     ----------   For Register Part   ----------
            */
            ps1 = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
            
            ps1.setString(1, email2);
            ps1.setString(2, password2);
            
            
            /*
            *    ----------   For Sponser Details   ----------
            */
            ps2 = con.prepareStatement("SELECT * FROM sponser_details WHERE email=?");
            
            ps2.setString(1, email2);
            
            
            /*
            *    ----------   For Profile Picture   ----------
            */
            ps3 = con.prepareStatement("SELECT * FROM profile_picture WHERE email=?");
            
            ps3.setString(1, email2);
            
            
            rs1 = ps1.executeQuery();
            rs2 = ps2.executeQuery();
            rs3 = ps3.executeQuery();
            
            
            if( rs1.next() && rs2.next() && rs3.next() )
            {
                String name2 = rs1.getString("name");
                String contact_no2 = rs1.getString("contact_no");
                String state2 = rs1.getString("state");
                
                String sponser_id2 = rs2.getString("sponser_id");
                String sponser_name2 = rs2.getString("sponser_name");
                String sponser_contact_no2 = rs2.getString("sponser_contact_no");
                String position2 = rs2.getString("position");
                
                String profile_pic = rs3.getString("path");
                
                
                /*
                *        -------------    For HttpSession     -------------
                */         
                session.setAttribute("session_email", email2);
                session.setAttribute("session_password", password2);
                session.setAttribute("session_sponser_id", sponser_id2);
                session.setAttribute("session_sponser_name", sponser_name2);
                session.setAttribute("session_sponser_contact_no", sponser_contact_no2);
                session.setAttribute("session_position", position2);
                session.setAttribute("session_name", name2);
                session.setAttribute("session_contact_no", contact_no2);
                session.setAttribute("session_state", state2);
                session.setAttribute("session_profile_pic", profile_pic);
                
                
                RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                rd2.include(req, resp);
            }
            else
            {
                req.setAttribute("error_message", "Name & Password : Please Provided Valid Name & Password...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);
                        
                RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                rd2.include(req, resp);
            }
        }
        catch(SQLException | ServletException | IOException e)
        {
            try
            {
                req.setAttribute("error_message", "Name & Password : Please Provided Valid Name & Password...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);
                        
                RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                rd2.include(req, resp);
            }
            catch(ServletException | IOException ee)
            {
                out.print(ee);
                
                req.setAttribute("error_message", "Name & Password : Please Provided Valid Name & Password...!!!");
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);
                        
                RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
                rd2.include(req, resp);
            }
            out.print(e);
        }
        finally
        {
            try 
            {
                rs1.close();
                rs2.close();
                rs3.close();
                ps1.close();
                ps2.close();
                ps3.close();
                con.close();
            } 
            catch(Exception e) 
            {
                out.print(e);
            }
        }
    }
}
