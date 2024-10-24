<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
<%@ include file="components/bootstrapCss.jsp"%>
<style type="text/css">
	.paint-card {
		width: 86%;
	}
</style>
</head>
<body>
	<%@ include file="components/user_navbar.jsp"%>
	<% int userid = Integer.parseInt(request.getParameter("id"));
		UserDao udao = new UserDao();
		User tuser = udao.fetchUserById(userid);
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 d-flex">
				<%@ include file="components/user_dashboard.jsp"%>
				<div class="d-flex col-md-4 offset-md-3 align-items-center">
					<div class="shadow p-3 mb-5 bg-body rounded car paint-card">
						<div class="card-body">
							<p class="fs-4 text-center"><%= tuser.getName() %>'s Profile</p>
							<form action="update_profile" method="post">
								<div class="mb-2">
									<label class="form-label">Name</label>
									<input name="name" type="text" class="form-control" value="<%= tuser.getName() %>" required>
								</div>
								<div class="mb-2">
									<label class="form-label">Age</label>
									<input name="age" type="number" class="form-control" value="<%= tuser.getAge() %>" required>
								</div>
								<div class="mb-2">
									<label class="form-label">Email Address</label>
									<input name="email" type="email" class="form-control" value="<%= tuser.getEmail() %>" required>
								</div>
								<div class="mb-3">
									<label class="form-label">Mobile No</label>
									<input name="mobile" type="tel" class="form-control" value="<%= tuser.getMobile() %>" required>
								</div>
								<input name="id" type="hidden" value="<%= tuser.getId() %>">
								<div class="d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-primary">Update</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>