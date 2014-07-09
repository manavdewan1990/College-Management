/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Tinku
 */
public class Student extends Profile{
private String school_name;
private String class_name;
private Assignments assignment;
private Attendance attendance;
private Resourse resourse;
private Books books;
//Notice notice;

  public  Student(String id_no, Connection con) throws ClassNotFoundException, SQLException, IOException
    {

        super(id_no,con);
       assignment=new Assignments(id_no,con);
       attendance=new Attendance(id_no,con);
       resourse=new Resourse(id_no,con);
       books=new Books(id_no,con);
       // out.print(":))))))))))");
     PreparedStatement stmt=con.prepareStatement("select * from student where id_no=?");
     stmt.setString(1, id_no);
     ResultSet res=stmt.executeQuery();
    }


    
    
  public Resourse getResourse() {
        return resourse;
    }

public boolean checkReciever(String id_no) throws SQLException
{
     PreparedStatement stmt=con.prepareStatement("select distinct id_no from teacher");
    boolean flag=false;

     ResultSet res=stmt.executeQuery();
     while(res.next())
     {
        if (res.getString("id_no").equals(id_no))
        {
            flag=true;
            return true;
        }
     }
     return false;
}
   

    public String[] getRecievers() throws SQLException, IOException
    {
        PreparedStatement stmt= con.prepareStatement("select distinct id_no from teacher");
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
   String teacher_name[]=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
                         
             teacher_name[i]=  rs.getString("id_no");
                       }
return teacher_name;

    }

    /**
     * @return the school_name
     */
    public String getSchool_name() {
        return school_name;
    }

    /**
     * @param school_name the school_name to set
     */
    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    /**
     * @return the class_name
     */
    public String getClass_name() {
        return class_name;
    }

     /**
     * @return the attendance
     */
    public Attendance getAttendance() {
        return attendance;
    }
    
    /**
     * @param class_name the class_name to set
     */
    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    /**
     * @return the assignment
     */
    public Assignments getAssignment() {
        return assignment;
    }

     public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Student tc=new Student("b351",con);
    
System.out.println(tc.checkReciever("prem"));

    }

    /**
     * @return the books
     */
    public Books getBooks() {
        return books;
    }

   

    /**
     * @return the resourse
     */
  

}