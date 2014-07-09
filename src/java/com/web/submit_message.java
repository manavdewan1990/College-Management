/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.web;

import com.model.Profile;
import com.model.Student;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class submit_message extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             HttpSession session=request.getSession();
  String designation= (String) session.getAttribute("profile");


String value[]=new String[10];
ServletContext sc=this.getServletContext();
            MultipartRequest multi = new MultipartRequest(request, sc.getInitParameter("data"),20000000);
            //MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\tinku\\Documents\\College_Managment\\web\\data",20000000);
            int k=0;
            int count=0;
  Enumeration params = multi.getParameterNames();
String body="";
String subject="";
String reciever="";
  while (params.hasMoreElements()) {
        String name = (String)params.nextElement();
        out.println(name );
        if (name.equals("body"))
        {


            body=value[count] = multi.getParameter(name);
            //  out.println(name  + count + "===" + value[count] );
        }
        else if (name.equals("subject"))
        {
            subject=value[count] = multi.getParameter(name);
            //  out.println(name  + count + "===" + value[count] );
        }
        else if (name.equals("reciever"))

        {     if (multi.getParameter(name).equals("Principal"))
                  reciever="Principal";
              else
            reciever=value[count] = multi.getParameter(name);
       
        }
        else if (name.equals("id_no"))

        {
            reciever=value[count] = multi.getParameter(name);

        }
        // out.println(name  + count + "===" + value[count] );
        count++;
        //out.println("___>>" + count + ">>" +name);
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

       // out.println("filename: " + filename);
k++;
      }


 String teacher_name[]=null;

  if (designation.equals("student"))
  {
      out.println("here");
          Student st = (Student)session.getAttribute("student");
          if (!st.checkReciever(reciever))
       response.sendRedirect("index.jsp?msg=Error Sending Message");
          out.println("----");
  }
    Profile pr = (Profile)session.getAttribute(designation);

    pr.sendMessage(reciever, "nill", subject, body, filename);
           // .sendMessage(value[2], "nil", value[1], value[0],filename);



        String url="Error Sending Message";
    if (designation.equals("admin"))
    {
       url="adindex.jsp?msg=Message has been Succefully sent";
    }
    else if (designation.equals("principal"))
    {
       url="pindex.jsp?msg=Message has been Succefully sent";
    }
    else  if (designation.equals("student"))
    {
       url="scindex.jsp?msg=Message has been Succefully sent";
    }
    else  if (designation.equals("teacher"))
    {
       url="scindex.jsp?msg=Message has been Succefully sent";
    }

          response.sendRedirect(url);

      
        }
        catch(SQLException ex)
        {
           response.sendRedirect("index.jsp?msg=Error Sending Message");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(submit_message.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(submit_message.class.getName()).log(Level.SEVERE, null, ex);
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
