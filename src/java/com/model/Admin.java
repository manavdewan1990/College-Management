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
import java.util.Date;

/**
 *
 * @author tinku
 */
public class Admin extends Profile{
    private String id_no;
    private Connection con;
    Admin(String id_no,Connection con) throws ClassNotFoundException, SQLException, IOException
    {
        super(id_no,con);
this.con=con;
this.id_no=id_no;
    }

    public String [] getClass_name() throws SQLException
    {

         PreparedStatement stmt= con.prepareStatement("select class_name from classes");
          ResultSet rs=  stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
  String class_name[]=new String[size];
         for(int i=0;i<size;i++)
           {
               rs.next();
             class_name[i]=rs.getString("class_name");
         }
  return class_name;

          
    }


    public void addSchool(String school_name,String about,String principal,String adress) throws SQLException
    {
 PreparedStatement stmt= con.prepareStatement("insert into school (school_name,about,principal,adress) values(?,?,?,?)");
 stmt.setString(1, school_name);
 stmt.setString(2, about);
 stmt.setString(3, principal);
     stmt.setString(4, adress);
         stmt.executeUpdate();
    }

 


    public void addSection(String class_name,String section,String school) throws SQLException
    {
         PreparedStatement stmt= con.prepareStatement("insert into section (class_name,section,school) values(?,?,?)");
     stmt.setString(1,class_name);
     stmt.setString(2,section);
   //  stmt.setString(3,designation);
     stmt.setString(3,school);
     stmt.executeUpdate();
    }



     public void sendBook(String r_class_name,String subject,String body,String photo,String file) throws SQLException
    {


 PreparedStatement stmt= con.prepareStatement("insert into book(class_name,date_,subject,body,photo,file) values(?,?,?,?,?,?)");
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
//System.out.println("ddddddd" + id_no);

 stmt.setString(1, r_class_name);
 stmt.setDate(2, sqlDate);
 stmt.setString(3, subject);
 stmt.setString(4, body);
 //stmt.setString(6, school);
 stmt.setString(5, file);
 stmt.setString(6,photo);
 int i=stmt.executeUpdate();
 //System.out.print("hellllllllllllllll" +i);



 stmt=con.prepareStatement("insert into recent (class_name,type,subject,school,date_,sender) values(?,?,?,?,?,?)");
 // stmt.setString(1,r_id);
  stmt.setString(1, r_class_name);
  stmt.setString(2, "message");
  stmt.setString(3, subject);
  stmt.setString(4, "all");
  stmt.setDate(5, sqlDate);
  stmt.setString(6, id_no);
  stmt.executeUpdate();

    }



public void createProfile(String id_no,String name,String adress, String landline,String phno,Date dob,String gender,String password,String designation,String school,String photo) throws SQLException
{

   PreparedStatement stmt= con.prepareStatement("insert into account (id_no,password,designation,school) values(?,?,?,?)");
     stmt.setString(1,id_no);
     stmt.setString(2,password);
     stmt.setString(3,designation);
     stmt.setString(4,school);
     //
    

     stmt.executeUpdate();
     
stmt=con.prepareStatement("insert into profile(id_no,name,photo,adress,landline,phno,dob,sex,school) values(?,?,?,?,?,?,?,?,?)");
stmt.setString(1, id_no);
stmt.setString(2, name);
stmt.setString(3, photo);
 stmt.setString(4,adress);
     stmt.setString(5,landline);
     stmt.setString(6,phno);
     stmt.setDate(7, (java.sql.Date) dob);
     stmt.setString(8,gender);
     stmt.setString(9, school);
stmt.executeUpdate();

}
public void createStudent(String id_no,String name, String adress, String landline,String phno,Date dob,String gender ,String password,String school,String photo,String section,String class_name) throws SQLException
{
    createProfile(id_no,name, adress,landline,phno,dob,gender,password, "student", school,photo);
    //, section, class_name);

    PreparedStatement stmt= con.prepareStatement("insert into student (id_no,class_name,section) values(?,?,?)");
     stmt.setString(1,id_no);
     stmt.setString(2,class_name);
     stmt.setString(3,section);
     stmt.executeUpdate();
}



    /**
     * @return the id_no
     */
    public String getId_no() {
        return id_no;
    }
    
     public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Admin pr=new Admin("verma",con);
      //  pr.createProfile("id1", "name", "adress", "landline", "photo", new java.sql.Date(19999), "m", "pass","teacher", "bnl", "photo.txt");
       pr.addSchool("jj", "fdf", "dfdf", "er");
    }


}
