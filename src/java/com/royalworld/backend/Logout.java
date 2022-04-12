/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import java.io.IOException;
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
public class Logout extends HttpServlet
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
        HttpSession session = req.getSession();
        
        session.invalidate();
        
        req.setAttribute("success_message", "Logout : Logout Successfully...!!!");
                
        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
        rd1.include(req, resp);
                        
        RequestDispatcher rd2 = req.getRequestDispatcher("login.jsp");
        rd2.include(req, resp);
    }
    
}
