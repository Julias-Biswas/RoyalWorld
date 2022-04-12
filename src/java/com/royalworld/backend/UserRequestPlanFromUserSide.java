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
public class UserRequestPlanFromUserSide extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String plan_cost2 = req.getParameter("plan_cost1");
        String plan_no2 = req.getParameter("plan_no1");
        String user_email2 = req.getParameter("user_email1");
        
        
        String date2 = null;
        String time2 = null;

        
        Connection con = null;

        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        
        ResultSet rs1 = null;

        
        /*   ------------------------ For Date --------------------------    */
        Date d = new Date();

        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        date2 = sdf1.format(d);

        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        time2 = sdf2.format(d);
        
        
        if( user_email2 == null || user_email2.equals("") )
        {
            req.setAttribute("error_message", "Email Not Found...!!!");

            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else if( (plan_no2 == null || plan_no2.equals("")) && (plan_cost2 == null || plan_cost2.equals("")) )
        {
            req.setAttribute("error_message", "Plan is Not Available Right Now...!!!");

            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("our_plans.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try 
            {
                con = DBConnection.getConnect();

                con.setAutoCommit(false);
                
                ps2 = con.prepareStatement("SELECT * FROM user_request_for_plan_details WHERE user_email=?");
                
                ps2.setString(1, user_email2);
                
                rs1 = ps2.executeQuery();
                
                if( rs1.next() )
                {
                    req.setAttribute("error_message", "Already A Plan has been buy in This Email Id, You Can't Buy This Plan Right Now...!!!");

                    RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("view_my_plan.jsp");
                    rd2.include(req, resp);
                }
                else
                {
                    ps1 = con.prepareStatement("INSERT INTO user_request_for_plan_details(user_email, plan_no, plan_cost, date1, time1) VALUES(?,?,?,?,?)");

                    ps1.setString(1, user_email2);
                    ps1.setString(2, plan_no2);
                    ps1.setString(3, plan_cost2);
                    ps1.setString(4, date2);
                    ps1.setString(5, time2);

                    int rowCount1 = ps1.executeUpdate();

                    if (rowCount1 > 0) 
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Plan Requested Successfully, Wait Some Time Your Plan is Actived As Soon As Possible...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                        rd2.include(req, resp);
                    } 
                    else
                    {
                        req.setAttribute("error_message", "Plan is Not Available Right Now...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("our_plans.jsp");
                        rd2.include(req, resp);

                        con.rollback();
                    }
                }

            }
            catch (SQLException | ServletException | IOException e) 
            {
                try
                {
                    con.rollback();
                }
                catch (Exception ee) 
                {
                    out.print("Inner Exception 3 : " + ee);
                }
                
                //out.print("Exception 3 : "+e);
                
                req.setAttribute("error_message", "Already A Plan has been buy in This Email Id, You Can't Buy This Plan Right Now...!!!");

                RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("view_my_plan.jsp");
                rd2.include(req, resp);
            
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
                catch (Exception ee)
                {
                    out.print("Another Exception 3 : " + ee);
                }
            }
        }
        
    }
    
}
