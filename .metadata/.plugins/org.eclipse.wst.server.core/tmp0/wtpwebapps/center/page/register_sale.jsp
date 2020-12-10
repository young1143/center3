<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<from action="action.jsp" name="action_form"  method="post">
	
		<table border="1">
			<tr>
				<Td>매출전표번호</Td>
				<Td><input type="number" name="saleno"></Td>
			</tr>
			<tr>
				<Td>지점코드</Td>
				<Td><input type="text" name="scode"></Td>
			</tr>
			<tr>
				<Td>판매일자</Td>
				<Td><input type="date" name="sale_date"></Td>
			</tr>
			<tr>
				<Td>피자코드</Td>
				<Td>
				<select name="pcode">
				<% 
					 try {
				       	 Class.forName("oracle.jdbc.OracleDriver");
				         Connection conn = DriverManager.getConnection
	                                ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	            
	
					     Statement stmt = conn.createStatement();
				         ResultSet rs = stmt.executeQuery("select pdoce, pname ");
											
					      while (rs.next()) {
					     	%>
					     	
					     	<option value="<%=rs.getString(1) %>"><%String %>
					     	<%
					      }
					        stmt.close();
					        conn.close();
					    }
					    catch (Exception e) {
					        e.printStackTrace();
					    }
            	%>
            	</select>
				</Td>
			</tr>
			<tr>
				<Td>판매수량</Td>
				<Td><input type="number" name="amount"></Td>
			</tr>
			<tr>
				<Td colspan="2">
				<input type="button" value="전표등록" onclick="summit_form()"></Td>
				<input type="button" value="다시쓰기" onclick="reset_form()"></Td>
			</tr>
		</table>
	</from>
	<script>
		function submit_form(){
			if(document.action_form.saleno.value === ""){
				alert("매출전표번호가 정상적으로 등록 되지 않았습니다");
				document.action_form.saleno.focus()
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("지점코드가 입력되지 않았습니다");
				document.action_form.scode.focus()
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("판매일자가 입력되지 않았습니다");
				document.action_form.slae_date.focus()
				return;
			}
			if(document.action_form.saleno.value === "0"){
				alert("피자코드가 선택되지 않았습니다");
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("판매수량이 입력되지 않았습니다");
				document.action_form.amount.focus()
				return;
			}
			alert("매물전표가 정상적으로 등록되었습니다");
			document.action_form.submit();
		}
			
		
		}
		function reset_form() {
			alert("매출전표가 정상적으로 등록 되었습니다!");
			document.action_form.reset();
		}

	</script>
