<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<from action="action.jsp" name="action_form"  method="post">
	
		<table border="1">
			<tr>
				<Td>������ǥ��ȣ</Td>
				<Td><input type="number" name="saleno"></Td>
			</tr>
			<tr>
				<Td>�����ڵ�</Td>
				<Td><input type="text" name="scode"></Td>
			</tr>
			<tr>
				<Td>�Ǹ�����</Td>
				<Td><input type="date" name="sale_date"></Td>
			</tr>
			<tr>
				<Td>�����ڵ�</Td>
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
				<Td>�Ǹż���</Td>
				<Td><input type="number" name="amount"></Td>
			</tr>
			<tr>
				<Td colspan="2">
				<input type="button" value="��ǥ���" onclick="summit_form()"></Td>
				<input type="button" value="�ٽþ���" onclick="reset_form()"></Td>
			</tr>
		</table>
	</from>
	<script>
		function submit_form(){
			if(document.action_form.saleno.value === ""){
				alert("������ǥ��ȣ�� ���������� ��� ���� �ʾҽ��ϴ�");
				document.action_form.saleno.focus()
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("�����ڵ尡 �Էµ��� �ʾҽ��ϴ�");
				document.action_form.scode.focus()
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("�Ǹ����ڰ� �Էµ��� �ʾҽ��ϴ�");
				document.action_form.slae_date.focus()
				return;
			}
			if(document.action_form.saleno.value === "0"){
				alert("�����ڵ尡 ���õ��� �ʾҽ��ϴ�");
				return;
			}
			if(document.action_form.saleno.value === ""){
				alert("�Ǹż����� �Էµ��� �ʾҽ��ϴ�");
				document.action_form.amount.focus()
				return;
			}
			alert("�Ź���ǥ�� ���������� ��ϵǾ����ϴ�");
			document.action_form.submit();
		}
			
		
		}
		function reset_form() {
			alert("������ǥ�� ���������� ��� �Ǿ����ϴ�!");
			document.action_form.reset();
		}

	</script>