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
public class AddMyTaskDayByDayDetails extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String user_email2 = req.getParameter("user_email1");
        String task_id2 = req.getParameter("task_id1");
        String task_link2 = req.getParameter("task_link1");
        String task_number2 = req.getParameter("task_number1");
        String task_name2 = req.getParameter("task_name1");

        
        String date2 = null;
        String time2 = null;

        
        Connection con = null;

        PreparedStatement ps1 = null;

        
        /*   ------------------------ For Date --------------------------    */
        Date d = new Date();

        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        date2 = sdf1.format(d);

        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        time2 = sdf2.format(d);

        
        if( user_email2 == null || user_email2.equals(""))
        {
            req.setAttribute("error_message", "Email Not Found...!!!");

            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else if ((task_id2 == null || task_id2.equals(""))
                && (task_link2 == null || task_link2.equals(""))
                && (task_number2 == null || task_number2.equals(""))
                && (task_name2 == null || task_name2.equals(""))) 
        {
            req.setAttribute("error_message", "Task is Not Available Right Now...!!!");

            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("our_tasks_and_our_ads.jsp");
            rd2.include(req, resp);
        } 
        else 
        {
            try 
            {
                con = DBConnection.getConnect();

                con.setAutoCommit(false);

                ps1 = con.prepareStatement("INSERT INTO climb_my_tasks_day_by_day_details(user_email, climb_task_id, climb_task_link, climb_task_number, climb_task_name, date1, time1) VALUES(?,?,?,?,?,?,?)");

                ps1.setString(1, user_email2);
                ps1.setString(2, task_id2);
                ps1.setString(3, task_link2);
                ps1.setString(4, task_number2);
                ps1.setString(5, task_name2);
                ps1.setString(6, date2);
                ps1.setString(7, time2);

                int rowCount1 = ps1.executeUpdate();

                if (rowCount1 > 0) 
                {
                    con.commit();
                                        
                    resp.sendRedirect(task_link2);
                } 
                else
                {
                    req.setAttribute("error_message", "Task is Not Available Right Now...!!!");

                    RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("our_tasks_and_our_ads.jsp");
                    rd2.include(req, resp);
                    
                    con.rollback();
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
                
                out.print("Exception 3 : " + e);
            
            }
            finally
            {
                try 
                {
                    ps1.close();
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
