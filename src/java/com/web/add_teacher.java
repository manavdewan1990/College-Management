/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Admin;
import com.model.Faculty;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class add_teacher extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             HttpSession session=request.getSession();
  String designation= (String) session.getAttribute("profile");
  if (!designation.equals("admin"))
   {
        response.sendRedirect("index.jsp?msg=BAD REQUEST");
   }
String value[]=new String[20];
         ServletContext sc=this.getServletContext();
            MultipartRequest multi = new MultipartRequest(request, sc.getInitParameter("data"),20000000);
            int k=0;
  Enumeration params = multi.getParameterNames();

  while (params.hasMoreElements()) {
        String name = (String)params.nextElement();
         value[k] = multi.getParameter(name);
        out.println("File key = " + k + "===" + value[k]);
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

        out.println("filename: " + filename);
k++;
      }


 String teacher_name[]=null;

String class_name[]={value[15],value[13],value[11],value[9],value[8]};
String section_name[]={value[1],value[16],value[14],value[12],value[10]};
    Admin pr = (Admin)session.getAttribute(designation);
   Date dob= java.sql.Date.valueOf(value[8].replace('/', '-'));
  // out.print( value[5] + value[0]+ value[2] + value[6] + value[3] + dob + value[7] + value[9] + "teacher" + value[4]  + filename);
   // out.println("##########" + value[2] + value[3] +  value[1]  + value[0] +  filename  + value[5]  +value[4]);
 pr.createProfile(value[5], value[0], value[2], value[6], value[3], dob, value[7], value[9], "teacher",value[4], filename);
  //  pr.sendMessage(value[2], "nil", value[1], value[0],filename);
//java.sql.Date.valueOf(value[10].replace('/', '-'));
//out.print( value[5] + value[0]+ value[2] + value[6] + value[3] + dob + value[7] + value[9] + "teacher" + value[4]  + value[10]);

      RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        }
        catch(Exception ex)
        {
         response.sendRedirect("index.jsp?msg=BAD REQUEST. LOGIN AGAIN");
        }
            finally {
            out.close();

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
