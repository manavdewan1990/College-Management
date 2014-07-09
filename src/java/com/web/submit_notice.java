/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Faculty;
import com.model.Principal;
import com.model.Teacher;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tinku
 */
public class submit_notice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   //     response.setContentType("text/html;charset=UTF-8");
     //   PrintWriter out = response.getWriter();
        try {
                   HttpSession session=request.getSession();
  String designation= (String) session.getAttribute("profile");
 if (!designation.equals("principal"))
   {
        response.sendRedirect("index.jsp?msg=BAD REQUEST");
   }
  
String value[]=new String[10];
           ServletContext sc=this.getServletContext();
            MultipartRequest multi = new MultipartRequest(request, sc.getInitParameter("data"),20000000);
            int k=0;
  Enumeration params = multi.getParameterNames();

  while (params.hasMoreElements()) {
        String name = (String)params.nextElement();
         value[k] = multi.getParameter(name);
       // out.println("File key = " + k + "===" + value[k]);
        k++;
      }


     Enumeration files = multi.getFileNames();
String filename=new String ();
k=0;
      while (files.hasMoreElements()) {
        String name = (String)files.nextElement();
        filename = multi.getFilesystemName(name);
        String original = multi.getOriginalFileName(name);
        String type = multi.getContentType(name);
        File f = multi.getFile(name);

     //   out.println("filename: " + filename);
k++;
      }


 String teacher_name[]=null;
// HttpSession session=request.getSession();
  //String designation= (String) session.getAttribute("profile");

    Principal pr = (Principal)session.getAttribute(designation);

   // out.println(value[0] + value[1] + filename);

   pr.sendNotice(value[1],value[0], filename);
  //  pr.sendMessage(value[2], "nil", value[1], value[0],filename);


   String url="Error Sending Message";
    if (designation.equals("principal"))
    {
       url="pindex.jsp?msg=Notice has been Succefully sent";
    }

  response.sendRedirect(url);
        }
        catch(Exception ex)
        {
         response.sendRedirect("index.jsp?msg=BAD REQUEST. LOGIN AGAIN");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
