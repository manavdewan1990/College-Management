/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.listener;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 * @author Tinku
 */
public class ContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        try {
             Class.forName("com.mysql.jdbc.Driver");
             ServletContext sc = sce.getServletContext();

             String url = sc.getInitParameter("url");
    	String user_name = sc.getInitParameter("user_name");
    	String password = sc.getInitParameter("password");
    	String database = sc.getInitParameter("database");

          Connection  con=DriverManager.getConnection(url + database, user_name, password);
            sce.getServletContext().setAttribute("connection", con);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ContextListener.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContextListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
