<%-- 
    Document   : welcome
    Created on : 03-Aug-2017, 17:49:20
    Author     : Graduate
--%>
<script src="js/toggle_menu.js" type="text/javascript"></script>
<%@page import="dnl.utils.text.table.TextTable"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.Mop"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<style src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></style>
<style src="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css"></style>
        <script type="text/javascript" src="http://mbostock.github.com/d3/d3.js?2.1.3"></script>
       <!--    <script type="text/javascript" src="http://mbostock.github.com/d3/d3.geom.js?2.1.3"></script>
     <script type="text/javascript" src="http://mbostock.github.com/d3/d3.layout.js?2.1.3"></script> !-->
        <jsp:include page="header.jsp" />
        <title>Welcome to Dashboard</title>
        <link href="css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <style>
            body, html {
                background-image: url(dashboard_background.jpg);
                height: 100%; 
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <script>
 $(document).ready(function(){
     $('#myTable').dataTable();
 });
        </script>
        <!--         
                    /*Mop m = new Mop();
                    List<JSONObject> jobj = m.getJsonObject();
                    remove *=% and /=> */
        <!--
        <table>
            <th>Deal Instrument ID</th>
                /*for (int i = 0; i < jobj.size(); i++) {
                    */
            <tr><td>/*=jobj.get(i).get("deal_instrument_id") */
                </td></tr>
                    }
                %>
        </table>
        !-->

        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#">
                            Menu
                        </a>
                    </li>
                    <li>
                        <a onclick="searchInfo()">Table</a>
                    </li>
                    <li>
                        <a onclick="pieinfo()">Pie Chart</a>
                    </li>
                    <li>
                        <a href="#">Bar Chart</a>
                    </li>
                    <li>
                        <a href="#">Histogram</a>
                    </li>
                    <li>
                        <a href="#">Logout</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>Dashboard</h>
                                <p>Welcome To Trading</p>
                                <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <center><div id="mylocation"></div> </center> 

    <center><div id="pie"></div> </center> 

    <!-- /#wrapper -->



    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {

            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
</body>
</html>