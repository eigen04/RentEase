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

@WebServlet("/user_register")
public class userRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String username = req.getParameter("fullName");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User u = new User(username,email,password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			boolean f = dao.register(u);
			
			if (f) {
                session.setAttribute("sucMsg", "Register Successfully");
                resp.sendRedirect("userlogin.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("signup.jsp");
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
