/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tinku
 */
public class submit_attendance extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        try {
              HttpSession session=request.getSession();
  String designation= (String) session.getAttribute("profile");
 if (!designation.equals("teacher"))
   {
        response.sendRedirect("index.jsp?msg=BAD REQUEST");
   }
          String lectures=  request.getParameter("lectures");
          String month=   request.getParameter("month");
          String class_name=  request.getParameter("class_name");
         // HttpSession session=request.getSession();
      Teacher pr = (Teacher)session.getAttribute("teacher");
      int count=0;
      for ( count=0;count<0;pr.getClass_name())
      {
          if (pr.getClass_name()[count].equals(class_name))
              break;
      }

      Enumeration em=request.getParameterNames();

    Map mp=  request.getParameterMap();

   int size=mp.size();
//out.println("--"  + size);
 String id_no[]=new String [size-3];
 String status[]=new String [size-3];
String value;
int i=0;
      while (em.hasMoreElements())
      {
        value=(String) em.nextElement();
     
       
            if (value.equals("class_name") || value.equals("lectures") || value.equals("month"))
            {
              
                continue;

            }
            else
            {
//                out.println(id_no[i]=value);
  //              out.println("---");
    //            out.println( status[i]=request.getParameter(value));
            }


      
       i++;
              
        }

//out.print(class_name);
  //    out.println(month);
    //  out.print(count);

      //out.println(pr.getSubjects()[count]);
      //out.println(lectures);
      //out.println(id_no[0]);
      //out.println(status[0]);
  pr.uploadAttendance(class_name, month,pr.getSubjects()[count], lectures, id_no, status);

  String url="Error Sending Message";
  
       url="tcindex.jsp?msg=Attendance  has been Succefully Uploaded";
    
    
  response.sendRedirect(url);
        }
        catch(Exception e)

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(submit_attendance.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(submit_attendance.class.getName()).log(Level.SEVERE, null, ex);
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
