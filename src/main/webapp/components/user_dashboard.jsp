<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Your Note</title>
<%@ include file="bootstrapCss.jsp"%>
<style type="text/css">
	.nav-link:active {
		background-color: blue;
		color: white;
	}
</style>
</head>
<body>
	<%
	User nuser = (User) session.getAttribute("obj");
	if (nuser != null) { %>
	<div
		class="d-flex flex-column flex-shrink-0 pt-3 bg-secondary note_page"
		style="width: 280px;">
		<ul class="nav nav-pills flex-column mb-auto mynav">
			<li class="nav-item"><a href="note.jsp" class="nav-link"
				aria-current="page">Dashboard</a></li>
			<li>
				<a href="addNote.jsp?id=<%=nuser.getId()%>" class="nav-link">AddNote</a>
			</li>
			<li>
				<a href="viewNote.jsp?id=<%= nuser.getId() %>" class="nav-link">View Notes</a>
			</li>
		</ul>
	</div>
	<% } else {
		response.sendRedirect("login.jsp");
	} %>
</body>
</html>