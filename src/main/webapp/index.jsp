<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Index Page</title>
<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/images.jpg");
	height: 80vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<% 
	 User u = (User) session.getAttribute("userobj"); %>

	<%@ include file="all_Components/navbar.jsp"%>
	<div class="container-fluit back-img">
		<h2 class="text-center text-">EBook Management System</h2>
	</div>


	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName() %></p>
						<p><%= b.getAuthor() %></p>
						
						<%
						
						if (b.getBookCategory().equals("Old")) { %>
							<p>Categories : <%=b.getBookCategory() %></p> 
							<div class="row "><a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%= b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
							
						<% } else { %>
							
							
							<p>Categories : <%=b.getBookCategory() %></p>
						<div class="row ">
						
						<% if (u == null) { %>
							<a href="Login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
						<% } else { %>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
						<% } %>
						
						
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							 <a href="" class="btn btn-danger btn-sm"><%= b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%}
						%>
						
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			List<BookDtls> list = dao.getNewBook();

			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories :
							<%=b.getBookCategory()%></p>
						<div class="row ">
						
						<% if (u == null) { %>
							<a href="Login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
						<% } else { %>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
						<% } %>
						
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-0.10"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getCon());
			List<BookDtls> list3 = dao2.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName() %></p>
						<p><%= b.getAuthor() %></p>
						<p><%= b.getBookCategory() %></p>
						<div class="row "> <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Old Book -->
	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>