package com.db;


import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NareshKumar
 */
public class Dbconnection {
    
    
    public Connection con;
    public Dbconnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
         
        }
        catch(Exception e)
        {
            System.out.println("unable to load the server");
        }
    }
    public Connection setConnection()
    {
        try{
           con =  (Connection) DriverManager.getConnection(
                    "jdbc:mysql://192.168.99.100:3306/db_grad_cs_1917", "root", "ppp"); 
           System.out.println("connection successful");
           return con;
        }
        catch(Exception e)
        {
            System.out.println("unable to establish connection");
            e.printStackTrace();
            return null;
        }
        
    }
    
}
