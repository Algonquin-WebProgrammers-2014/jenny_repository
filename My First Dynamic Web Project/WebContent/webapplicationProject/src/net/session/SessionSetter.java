package net.session;

//Author: David Yu & Jenny Liu
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionSetter extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if (req.getParameter("english") != null) {
			resp.getWriter().print("ENGLISH");
			req.getSession().setAttribute("lang", "en");
		}
		else if (req.getParameter("french") != null) {
			resp.getWriter().print("FRANCIAS");
			req.getSession().setAttribute("lang", "fr");
		}
		else if (req.getParameter("chinese") != null) {
			resp.getWriter().print("Zhong Wen");
			req.getSession().setAttribute("lang", "cn");			
		}
			
		else 
			resp.getWriter().print("NOTHING");
		
		
		
		
		resp.sendRedirect("webapp/mainpage/");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}
}
