package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				
			try {
				
				String name = req.getParameter("fname");
				String email = req.getParameter("email");
				String phno = req.getParameter("phno");
				String password = req.getParameter("password");
				String check = req.getParameter("check");
				
				//System.out.println(name + " " + email + " " + phno + " " + password + " " + check);
				
				User us = new User();
				us.setName(name);
				us.setEmail(email);
				us.setPhno(phno);
				us.setPassword(password);
				
				HttpSession session = req.getSession();
				
				if (check != null) {
					UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
					boolean f2 = dao.checkUser(email);
					if (f2) {
						
						boolean f = dao.userRegister(us);
						
						if (f) {
//							System.out.println("Data Register Success...");
							session.setAttribute("succMsg ", "Registration Successfully..");
							res.sendRedirect("Register.jsp");
						}
						else {
//							System.out.println("Something wrong on server..");
							session.setAttribute("failedMsg ", "Something wrong on server..");
							res.sendRedirect("Register.jsp");
						}
						
					} else {
						session.setAttribute("failedMsg ", "User Already Exist Try Another Email id");
						res.sendRedirect("Register.jsp");
						
					}
				}
				else {
//					System.out.println("Please Check Agree & Terms Conditions");
					session.setAttribute("failedMsg ", "Please Check Agree & Terms Conditions");
					res.sendRedirect("Register.jsp");
				}
				
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		
	}

}
