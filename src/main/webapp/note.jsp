<%@page import="com.org.dto.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My E-Diary</title>
<%@ include file="components/bootstrapCss.jsp"%>
<style type="text/css">
	.card-text {
		margin: 9px 14px;
		padding-top: 8px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<% User user = (User) session.getAttribute("obj");
		if(user != null) { %>
	<%@ include file="components/user_navbar.jsp"%>
	<% String msg = (String) session.getAttribute("update"); %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 d-flex">
				<%@ include file="components/user_dashboard.jsp"%>
				<div class="card">
					<div class="card-body ml-3">
					<% if (msg != null){ %>
						<div class="alert alert-success" role="alert"><%= msg %></div>
					<% }
						session.removeAttribute("update");
					%>
						<h5 class="card-title mb-1">Dashboard</h5>
						<p class="card-subtitle mb-3 text-muted fs-6">Home / Dashboard</p>
						<% String edit = (String) session.getAttribute("edit");
						   String del = (String) session.getAttribute("delete");
							if(edit != null) { %>
								<div class="alert alert-success" role="alert"><%= edit %></div>
						<% } else if(del != null) { %>
								<div class="alert alert-success" role="alert"><%= del %></div>
						<% }
							session.removeAttribute("edit");
							session.removeAttribute("delete");
						%>
						<div class="col-md-3 shadow pb-3">
							<p class="card-text">Total Notes</p>
							<div class="icon">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								<%	NoteDao ndao = new NoteDao();
									List<Note> notes = ndao.fetchNotesByUserId(user.getId()); %>
								<div><%= notes.size() %></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% } else {
			response.sendRedirect("login.jsp");
		} %>
</body>
</html>