<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	     ResourceBundle RB = MultiLang.generateResourceBdl(request);
	     String greeting = RB.getString("language");
	 %>
	<div id=header>
		<h1><%= RB.getString("appname") %></h1>
	</div>
	<div id='menu'>
		<ul>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/mainpage/"><%= RB.getString("home") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/"><%= RB.getString("ordernow") %></a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/user/">Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Replace this LOL</a></li>
			<li><a class='styleanchor' href=index.html>Search Order</a></li>
			<li><a class='styleanchor' href="${pageContext.request.contextPath}/verification/store/"><%= RB.getString("storelogin") %></a></li>
		</ul>	
	</div>