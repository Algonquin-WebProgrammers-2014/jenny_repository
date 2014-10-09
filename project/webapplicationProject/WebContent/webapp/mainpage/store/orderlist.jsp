<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,
				 Utilities.DatabaseConnection,
				 java.sql.Statement,
				 java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
		if(session.getAttribute("store") == null)
			response.sendRedirect(request.getContextPath()+"/webapp/verification/store/");
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderlist.css"/>
<title>STORE</title>
</head>
<body>
<p style="font-size: 40px">THIS IS STORE LIST PAGE</p>
<div class="parent-div">

<%
	try {
		
		Connection con = DatabaseConnection.createDataBaseConnection("mydb","rodolfouser","poldz123");
		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery("SELECT * FROM orderlist");
		int id = 0;
		while(rs.next()) {
%>
			<div class="child-div">
				<div class="right-container">
					<button type="button" class="child-div-button-blue" id="<%= id %>" onclick="info(this)">
						<i>Info</i>
					</button><br/>
					<button type="button" class="child-div-button-orange" id="<%= id %>" onclick="clearOrder(this)">
						<i>Clear Order</i>
					</button>
					
				</div>
				<div class="right-container-status" >
					<div>
						<table>
							<tr>
								<td class="order-delivered"><i>order</i><br/><i>delivered</i><br/>
									<a class="check-mark">✔</a>
								</td>
								<td class="prep-pizza"><i>prep</i><br/><i>pizza</i><br/>
									<a class="check-mark">✔</a>
								</td>
								<td class="bake-pizza"><i>bake</i><br/><i>pizza</i><br/>
									<a class="check-mark">✔</a>
								</td>
								<td class="out-for-deliver"><i>out for</i><br/><i>delivery</i><br/>
									<a class="check-mark">✔</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="left-container">
					<i >Order #:</i><i style="color: blue; font-weight: bold;"> 811-2316-209730201</i><br/>
					<div>Special Pizza:</div>
					<table class="t1">
					  <thead>
					    <tr>
						    <th>Item</th>
						    <th>Count</th>
						    <th>Size</th>
					    </tr>
					  </thead>
					  <tr>
					    <td>Hawaiin</td>
					    <td>500</td>
					    <td>M</td>
					  </tr>
					</table>
					<div>Topping Pizza:</div>
					
					<table class="t2">
					  <thead>
					    <tr>
						    <th>Item</th>
						    <th>Size</th>
						    <th>Topping</th>
					    </tr>
					  </thead>
					  <tr>
					    <td>1-Topping</td>
					    <td>S</td>
					    <td><i>bacon</i></td>
					  </tr>
					 <tr>
					    <td>3-Topping</td>
					    <td>M</td>
					    <td><i>bacon</i><br/><i>bacon</i><br/><i>bacon</i></td>
					  </tr>
					</table>
					
				</div>
			</div>
			<div class="child-info-div" id="info<%= id %>">
				<i>Name: Rodolfo Navalon</i><br/>
				<i>Phone Number: 613-123-1234</i><br/>
				<i>Address: 1234 Hollywood California, USA</i>
			</div>
<%			id++; 
		} 
		DatabaseConnection.closeDataBaseConnection(con, s);
	}catch (ClassNotFoundException | SQLException e) {
		//link to error page
	}
%>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/orderlist.js"></script>
</body>
</html>