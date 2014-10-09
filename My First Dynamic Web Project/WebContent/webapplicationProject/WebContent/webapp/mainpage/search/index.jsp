<%@page import="Utilities.ContextVariable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
                 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		request.getSession().setAttribute("page", ContextVariable.Page.SEARCHORDER);
		if(session.getAttribute("store") != null)
			response.sendRedirect(request.getContextPath()+"/webapp/mainpage/store/orderlist.jsp");
	%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"  type="text/css" />
</head>
<body>

	 <%@ include file="/includes/header_title.jsp" %>

	 <%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	     String greeting = RB.getString("language");
	 %>

	<div class="master-container">
		<%@ include file="/includes/header_menu.jsp" %>
		<div class="parent-container">
			<form id="effectsExplode" class="form-1" method="POST" action="${pageContext.request.contextPath}/userlogin">
				<p class="field">
					<input type="text" name="first_name" placeholder="<%= RB.getString("phone") %>">
					<i class="icon-user icon-large"></i>
				</p>
				
				<p class="submit">
					<button class="submitButton" id="buttonexplode" type="submit" name="loginsubmit" >
						<i class="icon-arrow-right icon-large"><%= RB.getString("enter") %></i>
					</button>
				</p>
		
			</form>
		</div> 	

	</div>
	
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>