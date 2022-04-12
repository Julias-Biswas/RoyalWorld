/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.royalworld.backend;

import com.royalworld.database.DBConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author julia
 */
public class UploadProfilePicture extends HttpServlet 
{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();

        String email2 = (String) session.getAttribute("session_email");

        String file_name = null;

        try
        {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(factory);
            List<FileItem> items = sfu.parseRequest(req);
            FileItem item = items.get(0);
            String file_path = item.getName();
            File file = new File(file_path);
            file_name = file.getName();
            
            File f1 = new File(PathsDetails.PROFILE_PICTURE_PATH + file_name);
            item.write(f1);
        } 
        catch (Exception e)
        {
            //out.print("Exception : " + e);
            e.printStackTrace();
        }

        
        Connection con = null;
        
        PreparedStatement ps1 = null;
        
        
        if( file_name == null || file_name.equals(""))
        {
            req.setAttribute("error_message", "Image : Profile Picture Can't Select...!!!");
                
            RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_pic.jsp");
            rd2.include(req, resp);
        }
        else
        {
            try 
            {
                con = DBConnection.getConnect();

                
                con.setAutoCommit(false);

                
                /*
                *    ----------   For Profile Picture   ----------
                */
                ps1 = con.prepareStatement("UPDATE profile_picture SET path=? WHERE email=?");

                ps1.setString(1, file_name);
                ps1.setString(2, email2);

                int i1 = ps1.executeUpdate();

                if (i1 > 0) 
                {
                    session.setAttribute("session_profile_pic", file_name);

                    con.commit();

                    resp.sendRedirect("profile.jsp");
                } 
                else 
                {
                    con.rollback();
                    
                    req.setAttribute("error_message", "Image : Profile Picture Can't Updated...!!!");
                
                    RequestDispatcher rd1 = req.getRequestDispatcher("error_page.jsp");
                    rd1.include(req, resp);

                    RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_pic.jsp");
                    rd2.include(req, resp);
                }
            } 
            catch (SQLException | IOException e) 
            {
                try
                {
                    con.rollback();
                }
                catch(Exception ee)
                {
                    out.print("Rollback in Exception : "+ee);
                }
                out.print("Another Exception : " + e);
            }
            finally
            {
                try
                {
                    con.close();
                }
                catch(Exception e)
                {
                    out.print("Connection Close Exception : "+e);
                }
            }
        }
    }
}
