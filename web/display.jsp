<%@page import="com.db.Dbconnection"%>
<%@ page import="java.sql.*" %>  
<%

    String name = request.getParameter("val");
    if (name == null || name.trim().equals("")) {
        out.print("<p>Please enter name!</p>");
    } else {
        try {
            Dbconnection conn = new Dbconnection();
            Connection con = conn.setConnection();
            Statement stmt = con.createStatement();
            String query1 = "select buy.instrument_name, buy.buy_deal_amount, "
                    + "buy.buy_deal_quantity, buy.buy_deal_amount/buy.buy_deal_quantity "
                    + "as average_buy, sell.sell_deal_amount, sell.sell_deal_quantity, "
                    + "sell.sell_deal_amount/sell.sell_deal_quantity as average_sell,"
                    + "sell.sell_deal_amount/sell.sell_deal_quantity-buy.buy_deal_amount/buy.buy_deal_quantity as unit_profit,"
                    + "case when sell.sell_deal_quantity>buy.buy_deal_quantity Then (sell.sell_deal_amount/sell.sell_deal_quantity-buy.buy_deal_amount/buy.buy_deal_quantity)* "
                    + "buy.buy_deal_quantity Else (sell.sell_deal_amount/sell.sell_deal_quantity-buy.buy_deal_amount/buy.buy_deal_quantity)"
                    + "*sell.sell_deal_quantity END AS realised_profit from (select  instrument_name, deal_type,"
                    + " sum(deal_amount*deal_quantity) as buy_deal_amount, sum(deal_quantity) as buy_deal_quantity from deal, "
                    + "instrument where instrument.instrument_id= deal.deal_instrument_id group by  instrument.instrument_id,"
                    + "deal.deal_type having deal_type='B') as buy INNER JOIN(select instrument_name"
                    + ", deal_type, sum(deal_amount*deal_quantity) as sell_deal_amount,"
                    + " sum(deal_quantity) as sell_deal_quantity from deal, "
                    + "instrument where instrument.instrument_id= deal.deal_instrument_id group by  instrument.instrument_id,"
                    + "deal.deal_type having deal_type='S') as sell ON sell.instrument_name=buy.instrument_name;";
            ResultSet rs = stmt.executeQuery(query1);
            if (!rs.isBeforeFirst()) {
                out.println("<p>No Record Found!</p>");
            } else {
                out.print("<div class=\"table-responsive\">");
                out.print("<table id=\"myTable\" class=\"table table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");

                out.print("<thead> <tr><th>S.No.</th><th>Instrument Name</th><th>Buy Deal Amount</th>"
                        + "<th>Buy Deal Quantity</th>"
                        + "<th>Average Buy</th>"
                        + "<th>Seal Deal Amount</th>"
                        + "<th>Seal Deal Quantity</th>"
                        + "<th>Average Sell</th>"
                        + "</tr>"
                        + "</thead>");
                int coun = 1;
                out.print("<tbody>");
                while (rs.next()) {
                    out.print("<tr><td>" + coun + "</td><td>" + rs.getString(1) + "</td>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>" + rs.getString(4) + "</td>"
                            + "<td>" + rs.getString(5) + "</td>"
                            + "<td>" + rs.getString(6) + "</td>"
                            + "<td>" + rs.getString(7) + "</td></tr>"
                    );
                    coun++;
                }
                out.print("</tbody>");
                out.print("</table>");
                out.print("</div>");
            }//end of else for rs.isBeforeFirst  
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
    }//end of else  
%>  