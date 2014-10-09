<%@page import="pizza.Pizza, java.util.ArrayList, Utilities.Util, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(session.getAttribute("cart") == null){
		session.setAttribute("cart", new ArrayList<Pizza>());
	}

	List<Pizza> pizzaList;

	if(session.getAttribute("cart") instanceof ArrayList)
		pizzaList = (ArrayList<Pizza>)session.getAttribute("cart");

	String name = request.getParameter("name");
	String small = request.getParameter("s");
	String medium = request.getParameter("m");
	String large = request.getParameter("l");
	String xlarge = request.getParameter("xl");
	
	int pizzaAdded = 0;
	
	if(!Util.isEmptyAndZero(name)){
		
	}
	
	%><a style="color:green; font-weight: bold">12</a><%
	
%>
