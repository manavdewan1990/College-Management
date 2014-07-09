/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tinku
 */
public class WebModel {

    public static boolean validate(HttpServletRequest request,HttpServletResponse response,Connection con) throws SQLException, ClassNotFoundException, IOException
    {

         //   PrintWriter out = response.getWriter();
//out.println("working");

       boolean flag=false;
       String name="nil";
       String designation="";
       String id=request.getParameter("id");
       String password=request.getParameter("password");
       String school= request.getParameter("school");
       PreparedStatement stmt= con.prepareStatement("select designation from account where id_no=? AND password=? AND (school=? or designation='admin')");
     stmt.setString(1, id);
     stmt.setString(2, password);
     stmt.setString(3, school);
     ResultSet rs= stmt.executeQuery();

       while(rs.next())
       {
      
        designation=rs.getString("designation");
        flag=true;
       }
      HttpSession session = request.getSession(true);
     if (flag==false)
     {
         session.invalidate();
          response.sendRedirect("index.jsp?msg=INCORRECT USERNAME/PASSWORD");
     }
         // out.print(designation);

     if(flag==true)
     {
         

      if (designation.equals("student"))
      {

        session.setAttribute("profile", "student");
        session.setAttribute("student",new Student(id,con));
      }
// out.print("errorro");
      else   if (designation.equals("teacher"))
      {
        session.setAttribute("profile", "teacher");
        session.setAttribute("teacher",new Teacher(id, (com.mysql.jdbc.Connection) con));
      }
      else if (designation.equals("principal"))
      {
        session.setAttribute("profile", "principal");
        session.setAttribute("principal",new Principal(id, (com.mysql.jdbc.Connection) con));
      }
      else if (designation.equals("admin"))
      {
        session.setAttribute("profile", "admin");
        session.setAttribute("admin",new Admin(id, (com.mysql.jdbc.Connection) con));
  //      out.print("admin");
      }
     }
         
     return (flag);
}

    static public String[] getschools(Connection con) throws SQLException
    {
       
            PreparedStatement stmt= con.prepareStatement("select school_name from school");
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
   String school_name[]=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
             school_name[i]=  rs.getString("school_name");
           }
return school_name;
    }

   /* public static String adjustString(String value)
    {
        String adjusted="";

        if (value.length()>60)
         {
int parts=value.length()/70;
System.out.print(parts);
String newString="";
for (int i=0;i<=parts;i++)
    {
        System.out.print("  done  ");
        if (i==parts)
              adjusted+=value.substring(70*i,value.length()) +"<br>";
        else
    adjusted+=value.substring(70*i,70*(i+1)) +"<br>";
     }
    }
return adjusted;

}
 
    
*/
    public static String [] getsections(String class_name,Connection con) throws SQLException
    {

            
            PreparedStatement stmt= con.prepareStatement("select section from section where class_name=?");
            stmt.setString(1, class_name);
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
   String school_name[]=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
             school_name[i]=  rs.getString("section");
           }
return school_name;
    }
    public static String[] getClasses(String school,Connection con) throws SQLException
    {
        PreparedStatement stmt= con.prepareStatement("select class_name from classes");
          //  stmt.setString(1, class_name);
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
   String school_name[]=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
             school_name[i]=  rs.getString("class_name");
           }
return school_name;
    }
    public static void main(String args[])
    {
//        /System.out.print(WebModel.adjustString("weeeeeeqweqweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeuyuy"));
    }
}