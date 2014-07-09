/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tinku
 */
public class Attendance {

    private String []subject;
    private String []status;
    private String []teacher_id;
    private String []total_lectures;

    Attendance(String id_no,Connection con) throws SQLException
    {

         PreparedStatement stmt= con.prepareStatement("select t1.subject,t1.status,t2.teacher_id,t2.total_lectures,t2.month from attendance_student  as t1 inner join attendance_subject as t2 on t1.subject=t2.subject and t2.class_name IN (select class_name from student where id_no=?) where id_no=?");
stmt.setString(1, id_no);
stmt.setString(2, id_no);

ResultSet res=stmt.executeQuery();
 res.last();
  int size= res.getRow();
  res.beforeFirst();
subject=new String [size];
status=new String [size];
teacher_id=new String[size];
total_lectures=new String[size];

for(int i=0;i<size;i++)
           {
               res.next();

             subject[i]=  res.getString("subject");
             status[i]=res.getString("status");
             teacher_id[i]=res.getString("teacher_id");
             total_lectures[i]=res.getString("total_lectures");
                       }

    }

    /**
     * @return the subject
     */
    public String[] getSubject() {
        return subject;
    }

    /**
     * @return the status
     */
    public String[] getStatus() {
        return status;
    }

    /**
     * @return the teacher_id
     */
    public String[] getTeacher_id() {
        return teacher_id;
    }

    /**
     * @return the total_lectures
     */
    public String[] getTotal_lectures() {
        return total_lectures;
    }

    /**
     * @param total_lectures the total_lectures to set
     */

    public static void main(String args[]) throws SQLException, ClassNotFoundException
    {
         Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Attendance at=new Attendance("b351",con);

       System.out.println( at.getTeacher_id()[0]);
    }
    
}
