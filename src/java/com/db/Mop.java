package com.db;


import com.sun.org.apache.bcel.internal.generic.D2F;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import org.json.JSONObject;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * o
 *
 * @author NareshKumar
 */

public class Mop {

   public List<JSONObject> getJsonObject() {
        ResultSet resultset = null;
        DaoObject dao = new DaoObject();
        resultset = dao.getResultSet();
        List<JSONObject> jlist = JsonServices.getResult(resultset);
        return jlist;
    }

    /* public static void main(String args[])
    {
        Mop m = new Mop();
        List<JSONObject> jobj = m.getJsonObject();
        for(int i=0;i<jobj.size();i++)
        {
            System.out.println(jobj.get(i));
        }
        
    }*/
}
