package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminlogout")
public class AdminLogout extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logoutAdmin(req,resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logoutAdmin(req,resp);
	}
	private void logoutAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		HttpSession session = req.getSession();
		session.removeAttribute("adminObj");
		session.setAttribute("succMsg", "Admin Logout Successfully");
        resp.sendRedirect("index.jsp");
	}
	
	
}
