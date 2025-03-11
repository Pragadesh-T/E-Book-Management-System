package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
@MultipartConfig
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String em = req.getParameter("em");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			
			boolean f = dao.oldBookDelete(em, "Old",id);
			
			
			HttpSession session = req.getSession();

			if (f) {
//				System.out.println("Book Deleted Sucessfully");
				session.setAttribute("succMsg", "Old Book Delete Successfully...");
				resp.sendRedirect("old_book.jsp");

			} else {
				
//				System.out.println("Something went wrong on server");
				session.setAttribute("succMsg", "Something wrong on Server");
				resp.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
