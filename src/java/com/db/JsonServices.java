package com.db;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NareshKumar
 */
public class JsonServices {
    public static List<JSONObject> getResult(ResultSet rs)
    {
        List<JSONObject> rsList = new ArrayList<JSONObject>();
        try{
            java.sql.ResultSetMetaData rsmeta = rs.getMetaData();
            int columncount = rsmeta.getColumnCount();
            List<String> columnnames = new ArrayList<String>();
            for(int i=1;i<=columncount;i++)
            {
                columnnames.add(rsmeta.getColumnName(i));
            }
            while(rs.next())
            {
                JSONObject obj = new JSONObject();
                for(int i=1;i<=columncount;i++)
                {
                    //System.out.println("sdhsdj");
                    String key = columnnames.get(i-1);
                    String value = rs.getString(i);
                    obj.put(key,value);
                }
                rsList.add(obj);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            try{
                rs.close();
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        return rsList;
        
    }

    
    
}
