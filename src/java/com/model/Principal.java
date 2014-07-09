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
 * @author tinku
 */
public class Principal  extends Profile {

 private String [] class_name;
 private String [] teachers;
  // private String []  subjects;


    Principal(String id_no,Connection con) throws ClassNotFoundException, SQLException, IOException
    {
        super(id_no,con);

         PreparedStatement stmt= con.prepareStatement("select   distinct (class_name) from student " +
                 "where id_no IN (select id_no from profile where school=?)");
            stmt.setString(1, this.getSchool());
            ResultSet rs= stmt.executeQuery();

            rs.last();
   int size= rs.getRow();
   rs.beforeFirst();
   class_name=new String[size];
  // subjects=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
          //   subjects[i]=rs.getString("subject_name");
             class_name[i]=  rs.getString("class_name");
           }




    stmt= con.prepareStatement("select   id_no from account where designation=? AND id_no IN (select id_no from profile where school=?)");
      stmt.setString(1, "teacher");
      stmt.setString(2, this.getSchool());

            rs= stmt.executeQuery();

            rs.last();
    size= rs.getRow();
   rs.beforeFirst();
   teachers=new String[size];
  // subjects=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
          //   subjects[i]=rs.getString("subject_name");
             teachers[i]=  rs.getString("id_no");
           }

    }


 


public void sendNotice(String subject,String body,String file) throws SQLException
{

    String school=this.getSchool();
 PreparedStatement stmt= con.prepareStatement("insert into notices(sender,date_,subject,body,school,file) values(?,?,?,?,?,?)");
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());



 
 System.out.println(subject.length());


//System.out.println("ddddddd" + id_no);
 stmt.setString(1, id_no);
 //stmt.setString(2, r_class_name);
 stmt.setDate(2, sqlDate);
 stmt.setString(3, subject);
 stmt.setString(4, body);
 stmt.setString(5, school);
 stmt.setString(6, file);


 stmt.executeUpdate();
 //System.out.print("hellllllllllllllll" +i);



 stmt=con.prepareStatement("insert into recent (type,subject,school,date_,sender) values(?,?,?,?,?)");
 // stmt.setString(1,r_id);
 // stmt.setString(1, r_class_name);
  stmt.setString(1, "notice");
  stmt.setString(2, subject);
  stmt.setString(3, school);
  stmt.setDate(4, sqlDate);
  stmt.setString(5, id_no);
  stmt.executeUpdate();
}

    public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Principal pr=new Principal("verma",con);
      String ss[]=  pr.getClass_name();
      for (String s:ss)
          System.out.println(s);
    }

    /**
     * @return the class_name
     */
    public String[] getClass_name() {
        return class_name;
    }

    /**
     * @return the teachers
     */
    public String[] getTeachers() {
        return teachers;
    }

    /**
     * @return the subjects
     */
  


}
