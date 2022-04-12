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
public class UploadAadhaarAndPanCardNumber extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String aadhaar_no2 = req.getParameter("aadhaar_no1");
        String pan_no2 = req.getParameter("pan_no1");
        
        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        
        ResultSet rs1 = null;
        
        
        if( email2 == null || email2.equals("") )
        {
            req.setAttribute("error_message", "Error : Email Can't Be Register, Please Register Now...!!!");
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);
                        
            RequestDispatcher rd2 = req.getRequestDispatcher("profile.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try
            {
                con = DBConnection.getConnect();
               
                con.setAutoCommit(false);
                
                /*
                *   ----------   For Update KYC Details Part   ----------
                */
                ps1 = con.prepareStatement("SELECT * FROM update_kyc_details WHERE email=?");
                
                ps1.setString(1, email2);
                
                
                rs1 = ps1.executeQuery();
                
                
                if( rs1.next() )
                {
                    /*
                    *   ----------   For Update KYC Details Part   ----------
                    */
                    ps2 = con.prepareStatement("UPDATE update_kyc_details SET aadhaar_no=? , pan_no=? WHERE email=?");
                        
                    ps2.setString(1, aadhaar_no2);
                    ps2.setString(2, pan_no2);
                    ps2.setString(3, email2);
                        
                        
                    int i1 = ps2.executeUpdate();
                     
                    
                    if( i1 > 0 )
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Aadhaar No & Pan No Updated Successfully...!!!");

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
                    *   ----------   For Update KYC Details Part   ----------
                    */
                    ps3 = con.prepareStatement("INSERT INTO update_kyc_details (email, aadhaar_no , pan_no) VALUES(?,?,?)");
                
                    ps3.setString(1, email2);
                    ps3.setString(2, aadhaar_no2);
                    ps3.setString(3, pan_no2);


                    int i2 = ps3.executeUpdate();


                    if( i2 > 0 )
                    {
                        con.commit();

                        req.setAttribute("success_message", "Success : Aadhaar No & Pan No Updated Successfully...!!!");

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
