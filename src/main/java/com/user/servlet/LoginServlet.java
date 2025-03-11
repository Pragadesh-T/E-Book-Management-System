package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		
		try {
			
			UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
			
			HttpSession session = req.getSession();
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
//			System.out.println(email + " " + password);
			
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				res.sendRedirect("admin/home.jsp");
			}
			else {
				
				User us = dao.login(email,password);
				if (us != null) {
					session.setAttribute("userobj", us);
					res.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Email & Password Invalid");
					res.sendRedirect("Login.jsp");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
