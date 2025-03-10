package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/userlogin")
public class userlogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email= req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session =req.getSession();
		
		UserDao dao = new UserDao(DBConnect.getConn());
		User user = dao.login(email, password);
		

		if (user != null) {
			session.setAttribute("userObj", user);
		    session.setAttribute("userId", user.getId()); // Ensure this is set correctly
		    System.out.println("User ID stored in session: " + user.getId()); // Debug log
		    resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("userlogin.jsp");
		}
	}
	
	

}
