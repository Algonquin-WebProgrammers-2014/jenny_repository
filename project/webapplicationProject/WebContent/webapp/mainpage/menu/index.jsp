<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.ResourceBundle,Utilities.MultiLang,Utilities.ContextVariable, Utilities.DatabaseConnection, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header to be used in different pages -->
<head>
	<head>
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/icon/webicon.ico" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">		
		<title>Pizza Ordering System Title Here</title>
	</head>
</head>

<body>

	<%@ include file="/includes/header_title.jsp" %>

	 <%
	 	 request.getSession().setAttribute("page", ContextVariable.Page.MENU);
	     ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	     String greeting = RB.getString("language");
	 %>
	 
	
	<div class='master-container'>
	
		<%@ include file="/includes/header_menu.jsp" %>
	
		<sql:setDataSource var="menulist" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:8888/storedb" user="rodolfouser" password="poldz123"/>
		
		<sql:query dataSource="${menulist}" var="result">
			SELECT * FROM special_pizza_list
		</sql:query>
		
		<table class="menu-table">
			<tr>
				<c:forEach var="menu" items="${result.rows}">
						<th>
							<div class="pizza-title" id="pizza-title${menu.idspecial_pizza_list}" initial="${menu.initial}" pizza="${menu.name}" type="sp"><c:out value="${menu.name}" /> Pizza</div>
						
							<div class="image-info">
								<img id="cart-image" src="${pageContext.request.contextPath}/webapp/pizzaimage/house.jpg">
								<div class="pizza-hint"><c:out value="${menu.info}" /></div>
							</div>					
							<table>
								<tr>
									<th>
										<img src="${pageContext.request.contextPath}/webapp/sizeimage/small.png">
									</th>
									<th>
										<img src="${pageContext.request.contextPath}/webapp/sizeimage/medium.png">
									</th>
									<th>
										<img src="${pageContext.request.contextPath}/webapp/sizeimage/large.png">
									</th>
									<th>
										<img src="${pageContext.request.contextPath}/webapp/sizeimage/xlarge.png">
									</th>
								</tr>
								
								<sql:query dataSource="${menulist}" var="prices">
									SELECT * FROM special_pizza_price WHERE idspecial_pizza_price = ${menu.special_pizza_price_idspecial_pizza_price}
								</sql:query>
								
								<c:forEach var="price" items="${prices.rows}">
								
									<tr>
												<th>
													<span>$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.small }"/></span>
												</th>
												<th>
													<span>$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.medium }"/></span>
												</th>
												<th>
													<span>$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.large }"/></span>
												</th>
												<th>
													<span>$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price.xlarge }"/></span>
												</th>
									</tr>
									
								</c:forEach>
									
								<tr>
									<th>
										<input type="text" id="ismall${menu.idspecial_pizza_list}" maxlength="2" size="2" placeholder="0">
									</th>
									<th>
										<input type="text" id="imedium${menu.idspecial_pizza_list}" maxlength="2" size="2" placeholder="0">
									</th>
									<th>
										<input type="text" id="ilarge${menu.idspecial_pizza_list}" maxlength="2" size="2" placeholder="0">
									</th>
									<th>
										<input type="text" id="ixlarge${menu.idspecial_pizza_list}" maxlength="2" size="2" placeholder="0">
									</th>
								</tr>
								<tr>
									<th colspan="4" style="padding: 0px">
										<div class="add-to-cart" onclick="addToCart(${menu.idspecial_pizza_list})"><%= RB.getString("addtopizzacart") %></div>
									</th>
								</tr>
							</table>
						</th>
						
						<c:if test="${(menu.idspecial_pizza_list % 3) == 0}">
							</tr><tr>
						</c:if>

				</c:forEach>
		</table>
	
	</div>
	
	<%@ include file="/includes/footer.jsp" %>
	<%@ include file="/includes/notification.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>

</body>
</html>