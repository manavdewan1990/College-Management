/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.sql.SQLException;

/**
 *
 * @author tinku
 */
public interface Faculty {

    void sendAssignment(String r_class_name,String subject,String body,String file) throws SQLException;
    

}
