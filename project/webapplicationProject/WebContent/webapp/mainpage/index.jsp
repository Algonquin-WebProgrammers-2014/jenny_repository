<%@page import="Utilities.ContextVariable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
    Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header to be used in different pages -->
<head>
	<head>
		<link href="${pageContext.request.contextPath}/css/headerfooter.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
		<title>Pizza Ordering System Title Here</title>
	</head>
</head>

<body>
	 <%
	 	 request.getSession().setAttribute("page", ContextVariable.Page.HOME);
	     ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	     String greeting = RB.getString("language");
	 %>
	 
	<%@ include file="/includes/header_title.jsp" %>
	
	<div class='master-container'>
		<%@ include file="/includes/header_menu.jsp" %>
		<h1>Welcome to the homepage</h1>
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>