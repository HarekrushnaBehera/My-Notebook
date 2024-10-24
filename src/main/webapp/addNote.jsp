<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Your Note</title>
<%@ include file="components/bootstrapCss.jsp"%>
<style type="text/css">
	.add_note input {
		width: 80%;
	}
	.add_note textarea {
		width: 80%;
		height: 130px;
	}
</style>
</head>
<body>
	<%@ include file="components/user_navbar.jsp"%>
	<% int userid = Integer.parseInt(request.getParameter("id"));
		UserDao dao = new UserDao();
		User use = dao.fetchUserById(userid);
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 d-flex">
				<%@ include file="components/user_dashboard.jsp"%>
				<div class="card">
					<div class="card-body ml-3">
						<h5 class="card-title mb-1">Add Note</h5>
						<p class="card-subtitle mb-3 text-muted fs-6">Home / Add Note</p>
						<div class="col-md-12 shadow pb-3">
							<form class="p-4 add_note" action="addnote">
								<div class="d-flex justify-content-between mb-4">
									<label for="exampleInputEmail1" class="form-label">Note Title</label>
									<input type="text" class="form-control" id="exampleInputEmail1" name="title" aria-describedby="emailHelp">
								</div>
								<div class="d-flex justify-content-between mb-3">
  									<label for="floatingTextarea2">Note Content</label>
  									<textarea class="form-control" placeholder="Write your content here" id="floatingTextarea2" name="desc"></textarea>
								</div>
								<input name="uid" type="hidden" value="<%=use.getId()%>">
								<div class="d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-primary">Add</button>
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