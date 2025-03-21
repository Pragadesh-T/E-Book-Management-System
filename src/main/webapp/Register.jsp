<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Register</title>
<%@ include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_Components/navbar.jsp"%>
<h4 class="text-center">Registration Page</h4>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						

						<c:if test="${ not empty succMsg }">
							<p class="text-center text-success">${ succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${ not empty failedMsg }">
							<p class="text-center text-danger">${ failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="Register" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name </label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="fname" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number </label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="phno" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required name="password" required>
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1" required> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="all_Components/footer.jsp"%>
</body>
</html>