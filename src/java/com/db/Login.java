package com.db;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.tomcat.jni.User.username;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Graduate
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String c = request.getParameter("verify");
        try {
            Dbconnection conn= new Dbconnection();
            /*Class.forName("com.mysql.jdbc.Driver");*/
            Connection con = conn.setConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from users");
            int count = 0;
            while (rs.next()) {
                if (uname.equals(rs.getString(1)) && pass.equals(rs.getString(2))) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", uname);
                    response.sendRedirect("welcome.jsp");
                    count++;
                }

            }
            if (count == 0) {
                c="0";
                request.setAttribute("clar", c);
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);con.close();
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
