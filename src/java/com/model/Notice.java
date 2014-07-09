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
 * @author Tinku
 */
public class Notice {
    private String  [] subject;
    private String[] body;
    private Date[] date;
    private String[] sender;
    private String[] file;

    Notice(String id_no , Connection con) throws SQLException
    {

     PreparedStatement stmt= con.prepareStatement("select * from notices where  school IN (select school from profile where id_no=?)  order by date_ desc limit 30");
     stmt.setString(1, id_no);
     ResultSet rs= stmt.executeQuery();
     rs.last();
  int size= rs.getRow();
  rs.beforeFirst();
     subject=new String[size];
     body=new String[size];
     date=new Date[size];
     sender=new String[size];
     file= new String[size];
     for (int i=0;i<size;i++)
     {
      rs.next();
      subject[i]=rs.getString("subject");
      body[i]=rs.getString("body");
      date[i]=rs.getDate("date_");
      sender[i]=rs.getString("sender");
      file[i]=rs.getString("file");
     }

    }


   
    /**
     * @return the subject
     */
    public String[] getSubject() {
        return subject;
    }

    /**
     * @return the body
     */
    public String[] getBody() {
        return body;
    }

    /**
     * @return the date
     */
    public Date[] getDate() {
        return date;
    }

    /**
     * @return the sender
     */
    public String[] getSender() {
        return sender;
    }

    /**
     * @return the file
     */
    public String[] getFile() {
        return file;
    }


    public static void main(String args[]) throws ClassNotFoundException, SQLException, IOException
    {
        Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root","new");
          Student st= new Student("b351",con);
         System.out.print( st.getNotice().getFile()[0]);
    }

}
