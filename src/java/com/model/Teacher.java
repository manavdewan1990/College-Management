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
public class Teacher extends Profile implements Faculty{

    private String [] class_name;
    private String []  subjects;
    public Teacher(String id_no,Connection con) throws ClassNotFoundException, SQLException, IOException
    {
        super(id_no,con);

         PreparedStatement stmt= con.prepareStatement("select  distinct class_name,subject from teacher where id_no=?");
            stmt.setString(1, id_no);
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
   class_name=new String[size];
   subjects=new String[size];
           for(int i=0;i<size;i++)
           {
               rs.next();
             subjects[i]=rs.getString("subject");
             class_name[i]=  rs.getString("class_name");
           }
    }
 public void sendResourse(String r_class_name,String subject,String file) throws SQLException
    {

String school=this.getSchool();
 PreparedStatement stmt= con.prepareStatement("insert into resourse(sender,class_name,date_,subject,teacher_subject,school,file) values(?,?,?,?,?,?,?)");
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
//System.out.println("ddddddd" + id_no);
 stmt.setString(1, id_no);
 stmt.setString(2, r_class_name);
 stmt.setDate(3, sqlDate);
 stmt.setString(4, subject);
 stmt.setString(5, this.getTeacher_subject(r_class_name));
 stmt.setString(6, school);
 stmt.setString(7, file);
 int i=stmt.executeUpdate();
 //System.out.print("hellllllllllllllll" +i);



 stmt=con.prepareStatement("insert into recent (class_name,type,subject,school,date_,sender) values(?,?,?,?,?,?)");
 // stmt.setString(1,r_id);
  stmt.setString(1, r_class_name);
  stmt.setString(2, "message");
  stmt.setString(3, subject);
  stmt.setString(4, school);
  stmt.setDate(5, sqlDate);
  stmt.setString(6, id_no);
  stmt.executeUpdate();

    }

    public String getTeacher_subject(String class_name) throws SQLException
    {
        PreparedStatement stmt= con.prepareStatement("select subject from teacher where id_no=? and class_name=?");
            stmt.setString(1, this.id_no);
            stmt.setString(2, class_name);
           ResultSet rs= stmt.executeQuery();
           System.out.println(class_name + id_no);
           rs.next();
           return rs.getString("subject");
    }


     public String getTeacher_subject(String class_name,String section) throws SQLException
    {
        PreparedStatement stmt= con.prepareStatement("select subject from teacher where id_no=? and class_name=? and section=?");
            stmt.setString(1, this.id_no);
            stmt.setString(2, class_name);
            stmt.setString(2, section);
           ResultSet rs= stmt.executeQuery();
           System.out.println(class_name + id_no);
           rs.next();
           return rs.getString("subject");
    }

  
    public void sendAssignment(String r_class_name,String subject,String body,String file) throws SQLException
    {

String school=this.getSchool();
 PreparedStatement stmt= con.prepareStatement("insert into assignment(sender,class_name,date_,subject,body,school,file) values(?,?,?,?,?,?,?)");
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
//System.out.println("ddddddd" + id_no);
 stmt.setString(1, id_no);
 stmt.setString(2, r_class_name);
 stmt.setDate(3, sqlDate);
 stmt.setString(4, subject);
 stmt.setString(5, body);
 stmt.setString(6, school);
 stmt.setString(7, file);
 int i=stmt.executeUpdate();
 //System.out.print("hellllllllllllllll" +i);



 stmt=con.prepareStatement("insert into recent (class_name,type,subject,school,date_,sender) values(?,?,?,?,?,?)");
 // stmt.setString(1,r_id);
  stmt.setString(1, r_class_name);
  stmt.setString(2, "message");
  stmt.setString(3, subject);
  stmt.setString(4, school);
  stmt.setDate(5, sqlDate);
  stmt.setString(6, id_no);
  stmt.executeUpdate();

    }



    


   


    public void uploadAttendance(String class_name,String month,String subject,String lectures, String id_no[],String status[]) throws SQLException
    {

         PreparedStatement stmt= con.prepareStatement("insert into attendance_subject (teacher_id,class_name,subject,school,month,total_lectures) values(?,?,?,?,?,?)");
stmt.setString(1,this.getId_no() );
stmt.setString(2,class_name );
stmt.setString(3, subject);
stmt.setString(4, this.getSchool());
stmt.setString(5,month );
stmt.setString(6, lectures);
stmt.executeUpdate();


stmt=con.prepareStatement("insert into attendance_student (subject,id_no,month,status) values(?,?,?,?)");

for (int i=0;i<id_no.length;i++)
{
stmt.setString(1, subject);
stmt.setString(2, id_no[i]);
stmt.setString(3, month);
stmt.setString(4,status[i]);
stmt.executeUpdate();

}

    }

    public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Teacher tc=new Teacher("prem",con);
        System.out.println(tc.getId_no());
        
//String id_no[]={"b351","b353"};
//String status[]={"2","3"};

        
   // tc.uploadAttendance("20", "2", tc.getSubjects()[0], "5", id_no, status);
        tc.sendResourse("10", "Math", "desi.txt");
    }

    /**
     * @return the class_name
     */
    public String[] getClass_name() {
        return class_name;
    }

    /**
     * @return the subjects
     */
    public String[] getSubjects() {
        return subjects;
    }


     public String [] [] getRecievers(String class_name) throws SQLException, IOException
    {
        String school=this.getSchool();
          PreparedStatement stmt= con.prepareStatement("select id_no,name from Profile where id_no IN (select id_no from student where class_name=?) AND school =? ");
       // stmt.setString(1, id_no);
        stmt.setString(1,class_name);
        stmt.setString(2,school);
            ResultSet rs= stmt.executeQuery();

            rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
        String  [] []students;
       students=new String[size][2];

           for(int i=0;i<size;i++)
           {
               rs.next();
           students[i][0]=  rs.getString("id_no");
           students[i][1]=   rs.getString("name");

           }
        return students;


    }




}
