/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tinku
 */
public  class  Profile {
    private Recent recent;
    private Messages messages;
    private Notice notice;
    protected String id_no;
    private String name;
    private String adress;
    private String sex;
    private String landline;
    private String phno;
    private String school;
    private Date dob;
    private String photo;

    protected Connection con;

    Profile(String id,Connection con) throws ClassNotFoundException, SQLException, IOException
    {

//out.print(":((((");
        recent=new Recent(id,con);
        notice=new Notice(id,con);
        messages=new Messages(id,con);
        this.con=con;
       PreparedStatement stmt= con.prepareStatement("select * from profile where id_no=?");
      stmt.setString(1, id);
     
      ResultSet rs=stmt.executeQuery();
      
      while(rs.next())
      {
         id_no= rs.getString("id_no");
         name=rs.getString("name");
         adress=rs.getString("adress");
         sex=rs.getString("sex");
         landline=rs.getString("landline");
         phno=rs.getString("phno");
         adress=rs.getString("adress");
         dob=rs.getDate("dob");
         school=rs.getString("school");
         photo=rs.getString("photo");
         

      }


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
      public String [] [] getRecievers(String class_name,String section) throws SQLException, IOException
    {
        String school=this.getSchool();
          PreparedStatement stmt= con.prepareStatement("select id_no,name from Profile where id_no IN (select id_no from student where class_name=? and section=?) AND school =? ");
       // stmt.setString(1, id_no);
        stmt.setString(1,class_name);
        stmt.setString(3,school);
        stmt.setString(2,section);
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

     
    public int writeDatabase() throws SQLException
    {


         PreparedStatement stmt= con.prepareStatement("update profile set name=?  , adress=?,sex=?,landline=?,phno=? , dob=? where id_no=?");
         stmt.setString(1, name);
         stmt.setString(2, adress);
         stmt.setString(3, sex);
         stmt.setString(4, landline);
         stmt.setString(5, phno);
         stmt.setDate(6, (java.sql.Date) dob);
         stmt.setString(7, id_no);
         stmt.executeUpdate();
       return 1;
    }
public void sendMessage(String r_id,String r_class_name,String subject,String body,String file) throws SQLException
    {

String school=this.getSchool();
 PreparedStatement stmt= con.prepareStatement("insert into messages (sender,id_no,class_name,subject,body,date_,school,file) values(?,?,?,?,?,?,?,?)");
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());

 stmt.setString(1, id_no);
 stmt.setString(2, r_id);
 stmt.setString(3, r_class_name);
 stmt.setString(4, subject);
 stmt.setString(5, body);
 stmt.setDate(6, sqlDate);
 stmt.setString(7, school);
 stmt.setString(8, file);
 stmt.executeUpdate();



 stmt=con.prepareStatement("insert into recent (id_no,class_name,type,subject,school,date_,sender) values(?,?,?,?,?,?,?)");
    stmt.setString(1,r_id);
   stmt.setString(2, r_class_name);
  stmt.setString(3, "message");
  stmt.setString(4, subject);
  stmt.setString(5, school);
  stmt.setDate(6, sqlDate);
     stmt.setString(7, id_no);
  stmt.executeUpdate();
     
    }
    /**
     * @return the id_no
     */
    public String getId_no() {
        return id_no;
    }

    /**
     * @param id_no the id_no to set
     */
    public void setId_no(String id_no) {
        this.id_no = id_no;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the adress
     */
    public String getAdress() {
        return adress;
    }

    /**
     * @param adress the adress to set
     */
    public void setAdress(String adress) {
        this.adress = adress;
    }

    /**
     * @return the sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return the landline
     */
    public String getLandline() {
        return landline;
    }

    /**
     * @param landline the landline to set
     */
    public void setLandline(String landline) {
        this.landline = landline;
    }

    /**
     * @return the phno
     */
    public String getPhno() {
        return phno;
    }

    /**
     * @param phno the phno to set
     */
    public void setPhno(String phno) {
        this.phno = phno;
    }

    /**
     * @return the dob
     */
    public Date getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(Date dob) {
        this.dob = dob;
    }

    /**
     * @return the messages
     */
    public Messages getMessages() {
        return messages;
    }

    /**
     * @return the notice
     */
    public Notice getNotice() {
        return notice;
    }

    /**
     * @return the recent
     */
    public Recent getRecent() {
        return recent;
    }

    /**
     * @return the school
     */
    public String getSchool() {
        return school;
    }

    /**
     * @param school the school to set
     */
    public void setSchool(String school) {
        this.school = school;
    }

    /**
     * @return the photo
     */
    public String getPhoto() {
        return photo;
    }

    public void change_password(String current_pass,String new_pass) throws SQLException, Exception
    {
 PreparedStatement stmt= con.prepareStatement("select password from account where id_no=?");

 stmt.setString(1, this.getId_no());
 ResultSet rs=stmt.executeQuery();
 rs.next();

 if (rs.getString("password").equals(current_pass))
 {
     stmt= con.prepareStatement("update account set password=? where id_no=?");
     stmt.setString(1,new_pass);
     stmt.setString(2, this.getId_no());
     stmt.executeUpdate();

 }
 else
 {
     throw new Exception();
 }

        
    }
   /*  public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
        Admin tc=new Admin("manav",con);
tc.setSchool("bnl");
//Attendance at=tc.attendance;
for (String s1[]:tc.getRecievers("10", "A"))
    for (String s:s1)
    System.out.println(s + "  ");




    }
    
    */

    }

    


