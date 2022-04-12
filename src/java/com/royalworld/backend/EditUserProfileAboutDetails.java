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
public class EditUserProfileAboutDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String father_name2 = req.getParameter("father_name1");
        String mother_name2 = req.getParameter("mother_name1");
        String address2 = req.getParameter("address1");
        String city2 = req.getParameter("city1");
        String state2 = req.getParameter("state1");
        String country2 = req.getParameter("country1");
        String pin_code2 = req.getParameter("pin_code1");
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;
        
        ResultSet rs1 = null;
        
        
        if( mother_name2 == null || mother_name2.equals("") )
        {
            mother_name2 = "- Not Available -";
        }
        if( address2 == null || address2.equals("") )
        {
            address2 = "- Not Available -";
        }
        if( city2 == null || city2.equals("") )
        {
            city2 = "- Not Available -";
        }
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Register, Please Register Now...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
               
                con.setAutoCommit(false);
                
                /*
                *   ----------   For Update User Details Part   ----------
                */
                ps1 = con.prepareStatement("SELECT * FROM update_user_details WHERE email=?");
                
                ps1.setString(1, email2);
                
                
                rs1 = ps1.executeQuery();
                
                
                if( rs1.next() )
                {
                    /*
                    *   ----------   For Update User Details Part   ----------
                    */
                    ps2 = con.prepareStatement("UPDATE update_user_details SET father_name=? , mother_name=? , address=? , city=? , state=? , country=? , pin=? WHERE email=?");
                        
                    ps2.setString(1, father_name2);
                    ps2.setString(2, mother_name2);
                    ps2.setString(3, address2);
                    ps2.setString(4, city2);
                    ps2.setString(5, state2);
                    ps2.setString(6, country2);
                    ps2.setString(7, pin_code2);
                    ps2.setString(8, email2);
                    
                    
                    /*
                    *   ----------   For Update Register Details Part   ----------
                    */
                    ps3 = con.prepareStatement("UPDATE register SET state=? WHERE email=?");
                    
                    ps3.setString(1, state2);
                    ps3.setString(2, email2);
                    
                      
                    int i1 = ps2.executeUpdate();
                    int i2 = ps3.executeUpdate();
                     
                    
                    if( i1 > 0 && i2 > 0 )
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Profile Updated Successfully...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                        rd2.include(req, resp);
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("error_message", "Error : Please Checked Your Documents...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
                        rd2.include(req, resp);
                    }
                }
                else
                {
                    /*
                    *   ----------   For Update User Details Part   ----------
                    */
                    ps4 = con.prepareStatement("INSERT INTO update_user_details (email, father_name , mother_name , address , city , state , country , pin) VALUES(?,?,?,?,?,?,?,?)");
                
                    ps4.setString(1, email2);
                    ps4.setString(2, father_name2);
                    ps4.setString(3, mother_name2);
                    ps4.setString(4, address2);
                    ps4.setString(5, city2);
                    ps4.setString(6, state2);
                    ps4.setString(7, country2);
                    ps4.setString(8, pin_code2);
                    
                    
                    /*
                    *   ----------   For Update Register Details Part   ----------
                    */
                    ps5 = con.prepareStatement("UPDATE register SET state=? WHERE email=?");
                    
                    ps5.setString(1, state2);
                    ps5.setString(2, email2);
                    
                    
                    int i3 = ps4.executeUpdate();
                    int i4 = ps5.executeUpdate();


                    if( i3 > 0 && i4 > 0 )
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Profile Updated Successfully...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("success_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
                        rd2.include(req, resp);
                    }
                    else
                    {
                        con.rollback();

                        req.setAttribute("error_message", "Error : Please Checked Your Documents...!!!");

                        RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                        rd1.include(req, resp);

                        RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
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
                    ps3.close();
                    ps4.close();
                    ps5.close();
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
