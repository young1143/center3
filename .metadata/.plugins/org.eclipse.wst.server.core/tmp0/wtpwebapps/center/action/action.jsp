<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
<% 

String saleno = request.getParameter("saleno");
String scode = request.getParameter("scode");
String sale_date = request.getParameter("sale_date");
String pcode = request.getParameter("pcode");
int amount = Integer.parseInt(request.getParameter("amount"));



try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection
                        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    

    Statement stmt = conn.createStatement();
    
    String query = "insert into tbl_salelist_01(saleno, scode, saledate, pcode, amount)values('%s', '%s', '%s', '%s', %d)";
    ResultSet rs = stmt.executeQuery(String.format(query, saleno, scode, sale_date, pcode, amount));




    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
response.sendRedirect("lookup_sale.jsp");
%>