/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Admin;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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
public class submit_book extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    //    response.setContentType("text/html;charset=UTF-8");
      //  PrintWriter out = response.getWriter();
        try {
              HttpSession session=request.getSession();
  String designation= (String) session.getAttribute("profile");
 if (!designation.equals("teacher"))
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
      //  out.println("File key = " + k + "===" + value[k]);
        k++;
      }


     Enumeration files = multi.getFileNames();
String[] filename=new String [2];
k=0;
int i=0;

     while (files.hasMoreElements()) {
        String name = (String)files.nextElement();
        filename[k] = multi.getFilesystemName(name);
        String original = multi.getOriginalFileName(name);
        String type = multi.getContentType(name);
        File f = multi.getFile(name);
 //       out.println("File title: " + name);
 //       out.println("filename: " + filename[k]);
k++;
//out.println("=-=-=-=-=-");

      }

//out.println("=-=-=-=-=-");
 String teacher_name[]=null;
// HttpSession session=request.getSession();
 // String designation= (String) session.getAttribute("profile");

    Admin pr= (Admin)session.getAttribute(designation);
//out.println("+++++++++++++");
//   out.print("-------" +  value[2] + "-- "+ value[1] + "--"+ value[0] + filename[0] +"--"  +filename[1]);
    pr.sendBook(value[2], value[1], value[0], filename[1], filename[0]);

    String url="Error Sending Message";
    if (designation.equals("admin"))
    {
       url="adindex.jsp?msg=Book has been Succefully sent";
    }
    
  response.sendRedirect(url);
  //  pr.sendMessage(value[2], "nil", value[1], value[0],filename);


     // RequestDispatcher view = request.getRequestDispatcher("index.jsp");
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
