<%@ page import="java.util.ResourceBundle,
                 Utilities.MultiLang,Utilities.ContextVariable" %>
	<%
	     ResourceBundle RBheaderTitle = MultiLang.generateResourceBdl(request,session);
	     HttpSession s = request.getSession();
	 %>
		<div id='menu'>
			<ul>
				<li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.HOME) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/"><%= RBheaderTitle.getString("home") %> </a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.MENU) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/menu/"><%=RBheaderTitle.getString("pizzamenu") %></a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.ORDERNOW) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/verification/user/"><%= RBheaderTitle.getString("ordernow") %></a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.SEARCHORDER) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/mainpage/search/"><%=RBheaderTitle.getString("searchorder") %></a></li><!--  
				--><li><a class='styleanchor' id="<%= (s.getAttribute("page").equals(ContextVariable.Page.STORELOGIN) ? "selected" : "not")%>" href="${pageContext.request.contextPath}/webapp/verification/store/"><%= RBheaderTitle.getString("storelogin") %></a></li> 
			</ul>	
		</div>