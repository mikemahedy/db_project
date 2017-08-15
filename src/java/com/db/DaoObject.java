package com.db;


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NareshKumar
 */
public class DaoObject {
    
    Dbconnection dbcon = new Dbconnection();
    private static final String SQL = "select * from deal limit 100;";
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet resultset = null;
    public ResultSet getResultSet(){
        try{
            con = dbcon.setConnection();
            pst =  (PreparedStatement) con.prepareStatement(SQL);
            resultset = pst.executeQuery();
        }
        catch(Exception e)
        {
            System.out.println("error occured");
            e.printStackTrace();
        }
        
        return resultset;
    }

    
    
}
