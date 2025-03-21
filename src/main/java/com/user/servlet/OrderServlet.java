package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			String fullAddress = address+","+landmark+","+city+","+state+","+pincode;
//			System.out.println(name + " " + email+ " " + phno+" " +fullAddress+" " + paymentType);
			
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
			List<Cart> blist = dao.getBookByUser(id);
			
			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkout.jsp");
			} else {
				
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getCon());
				
				
				
				Book_Order o = null;
				Random r = new Random();
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				for(Cart c : blist) {
					o = new Book_Order();
					o.setOrderId("Book-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
				}
				
				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);
					
					if (f) {
						resp.sendRedirect("order_sucess.jsp");
					} else {
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
		
}
