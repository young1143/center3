<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<h3>���ո�����ȸ</h3>
	
	<%@ page import="java.sql.*" %>
	<%@page import="java.text.SimpleDateFormat" %>
	<%@page import="java.text.DateFormat" %>
	<table border="1">
	<tr>
		<td>������ǥ��ȣ</td>
		<td>����</td>
		<td>�Ǹ�����</td>
		<td>�����ڵ�</td>
		<td>���ڸ�</td>
		<td>�Ǹż���</td>
		<td>�����</td>
	</tr>
	
	<%
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection
                                ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
            

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select pcode, pname feom table");
            while (rs.next()) {
            	Date sale_date = rs.getDate(3);
            	int sale_cost = rs.getInt(7);
            	
               %>
              	<option value = "<% %>">
               
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
	
