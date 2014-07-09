/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Tinku
 */
public class Assignments {
    private String  [] subject;
    private String[] body;
    private Date[] date;
    private String[] sender;
  private String[] file;
    Assignments(String id_no , Connection con) throws SQLException
    {

     PreparedStatement stmt= con.prepareStatement("select * from assignment where class_name IN (select class_name from student where id_no=? ) AND school IN (select school from student where id_no=?)   order by date_ desc");
     stmt.setString(1, id_no);
     stmt.setString(2, id_no);
      
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

}
