<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<h3>상품별 매출 현황</h3>
	
	<%@ page import="java.sql.*" %>
	<%@page import="java.text.SimpleDateFormat" %>
	<%@page import="java.text.DateFormat" %>
	<table border="1">
	<tr>
		<td>지점코드</td>
		<td>지점 명</td>
		<td>총매출액</td>
	</tr>
	
	<%
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection
                                ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
            

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select pizza.pcode, pizza.pname, num(salelist.amount * pizza.cost)" +
						            		"frome tbl_salelist_01 salelist, tbl_pizza_01 pizza" +
						            		"where"+
						            		"salelist.pcode = pizza.pcode"+
						        		    "group by pizza.pcode, pizza.pname"+
						            		"order by num(salelist.amount * pizza.cost) desc");

            while (rs.next()) {
            	Date sale_date = rs.getDate(3);

            	
               %>
               <tr>
	               <td><%=rs.getString(1) %></td>
	               <td><%=rs.getString(2) %></td>
	               <td><%=String.format("\%,d", slae_cost) %></td>
               </tr>
               
               <%
            }

            stmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </table>
	
	
