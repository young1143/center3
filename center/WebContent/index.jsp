<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	<%
	
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	
	switch(section){
	case "register_sale" :
		%> <%@include file="page/register_sale.jsp" %> <%
		break;
	case "lookup_sale" :
		%> <%@include file="page/lookup_sale.jsp" %> <%
		break;
	case "lookup_sale_shop" :
		%> <%@include file="page/lookup_sale_shop.jsp" %> <%
		break;
	case "lookup_sale_pozza" :
		%> <%@include file="page/lookup_sale_pizza.jsp" %> <%
		break;
		default:
			%> <%@include file="static/index.jsp" %> <%
	}
	%>
	<%@include file="static/footer.jsp" %>
</body>
</html>