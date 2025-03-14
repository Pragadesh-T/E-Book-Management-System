<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_Components/navbar.jsp"%>

		
	<c:if test="${empty userobj }">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
		

	<div class="centainer p-1">
		<h3 class="text-center text-primary">Your Order </h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			
			
		User u = (User)session.getAttribute("userobj");
		BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getCon());
		List<Book_Order> blist = dao.getBook(u.getEmail());
		
		for(Book_Order b : blist) { %>
			<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUsername() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
		<% } %>
			

			
				
				
			</tbody>
		</table>
	</div>

</body>
</html>