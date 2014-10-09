<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/icon/webicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerfooter.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notif.css">
	
	<title>Your cart</title>
</head>
<body>
	
	<%@ include file="/includes/header_title.jsp" %>
	
	<%
	    ResourceBundle RB = MultiLang.generateResourceBdl(request,session);
	    String greeting = RB.getString("language");
	 	request.getSession().setAttribute("page", ContextVariable.Page.NONE);
	 %>

	<div class='master-container'>
	
		<%@ include file="/includes/header_menu.jsp" %>
		
		<div class="parent-cart-table">
			<h1>Cart</h1>
			<table class="cart-table">
				<thead>
					<tr>
						<th><%=RB.getString("pizza") %></th>
						<th><%=RB.getString("small") %></th>
						<th><%=RB.getString("medium") %></th>
						<th><%=RB.getString("large") %></th>		
						<th><%=RB.getString("xlarge") %></th>	
						<th></th>
					</tr>
				</thead>
	
				<c:forEach items="${sessionScope.cart.hash }" var="pizzaHash">
					
					<tr class="pizza-size">
						<th class="pizza-name">${pizzaHash.value.pizza.name}</th>
						<th id = "ismall${pizzaHash.value.pizza.initial}" class="count"><span>${pizzaHash.value.smallCount}</span></th>
						<th id = "imedium${pizzaHash.value.pizza.initial}" class="count"><span>${pizzaHash.value.mediumCount}</span></th>
						<th id = "ilarge${pizzaHash.value.pizza.initial}" class="count"><span>${pizzaHash.value.largeCount}</span></th>
						<th id = "ixlarge${pizzaHash.value.pizza.initial}" class="count"><span>${pizzaHash.value.xLargeCount}</span></th>
						<th class="pizza-count-edit"><input type="button" class="edit-button" value="Edit" maxlength="2" size="2" onclick="toPerform(this, '${pizzaHash.value.pizza.initial}')"/></th>
					</tr>
	
				</c:forEach>
				
				<tr>
					<th><%=RB.getString("total") %></th>
					<th colspan="3" id="pizza-total" class="pizza-total">$<c:choose><c:when test="${sessionScope.cart != null}">${sessionScope.cart.totalPrice}</c:when><c:otherwise>0.00</c:otherwise></c:choose></th>
					<th colspan="2" ><input type="button" class="pizza-total-button" value="<%=RB.getString("checkout") %>"/></th>
				</tr>
			</table>
		</div>

	</div>
	
	<%@ include file="/includes/footer.jsp" %>
	<%@ include file="/includes/notification.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>