/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author julia
 */
public class ValidationFilter implements Filter
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException 
    {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    {
        String user_name2 = request.getParameter("user_name1");
        String user_email2 = request.getParameter("user_email1");
        String user_contact_no2 = request.getParameter("user_contact_no1");
        String user_password2 = request.getParameter("user_password1");
        String user_confirm_password2 = request.getParameter("user_confirm_password1");
        String user_state2 = request.getParameter("user_state1");
        String term_condition2 = request.getParameter("term_and_condition1");
        
        Validations validation = new Validations();
        
        if( !validation.nameValidate(user_name2) )
        {
            request.setAttribute("error_message", "Name : Please Provided Name...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( !validation.emailValidate(user_email2) )
        {
            request.setAttribute("error_message", "Email : Please Provided Email...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( !validation.phoneValidate(user_contact_no2) )
        {
            request.setAttribute("error_message", "Contact Number : Please Provided Contact Number...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( !validation.passwordValidate(user_password2) )
        {
            request.setAttribute("error_message", "Password : Please Provided Password...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( !validation.passwordValidate(user_confirm_password2) )
        {
            request.setAttribute("error_message", "Password : Please Provided Password...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( !user_password2.equals(user_confirm_password2))
        {
            request.setAttribute("error_message", "Password : Password Can't Matched...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( user_state2.equals("Select State") || (user_state2 == "Select State") )
        {
            request.setAttribute("error_message", "State : Please Select Your State...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else if( (term_condition2 == null) || (term_condition2.equals("")) )
        {
            request.setAttribute("error_message", "Term and Condition : Please Agree Term and Condition...!!!");
            
            RequestDispatcher rd1 = request.getRequestDispatcher("error_page.jsp");
            rd1.include(request, response);
            
            RequestDispatcher rd2 = request.getRequestDispatcher("register.jsp");
            rd2.include(request, response);
        }
        else
        {
            chain.doFilter(request, response);
        }
            
    }

    @Override
    public void destroy() 
    {
        
    }
    
}
