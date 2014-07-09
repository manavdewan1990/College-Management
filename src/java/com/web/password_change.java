/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tinku
 */
public class password_change extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, Exception {
        
        try {
             HttpSession session=request.getSession();
             String designation= (String) session.getAttribute("profile");
             Profile pr=(Profile)session.getAttribute(designation);
             
String current=request.getParameter("current");
String pass1=request.getParameter("pass1");
            try {
                pr.change_password(current, pass1);


        String url="Error Sending Message";
    if (designation.equals("admin"))
    {
       url="adindex.jsp?msg=Password has been successfuly changed";
    }
    else if (designation.equals("principal"))
    {
       url="pindex.jsp?msg=Password has been successfuly changed";
    }
    else  if (designation.equals("student"))
    {
       url="scindex.jsp?msg=Password has been successfuly changed";
    }
    else  if (designation.equals("teacher"))
    {
       url="tcindex.jsp?msg=Password has been successfuly changed";
    }
 response.sendRedirect(url);
            } catch (Exception ex) {
                response.sendRedirect("index.jsp?msg=BAD REQUEST. LOGIN AGAIN");
            }






        } finally { 
          
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(password_change.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(password_change.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
