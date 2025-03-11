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
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg ", "User Profile Update Successfully..");
					resp.sendRedirect("Edit_profile.jsp");
			} else {
				session.setAttribute("failedMsg ", "Something went erong on server");
				resp.sendRedirect("Edit_profile.jsp");
			}
			
		} else {
			session.setAttribute("failedMsg ", "Your Password is Incorrect");
			resp.sendRedirect("Edit_profile.jsp");
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

}
