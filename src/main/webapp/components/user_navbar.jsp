<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.navbar {
	background: linear-gradient(transparent, #7c9ed0);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
}

.navbar-brand {
	font-weight: bold;
}
</style>
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-secondary">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">MY NOTEBOOK</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#home_section">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="note.jsp">Note</a></li>
				</ul>
				<% User u = (User) session.getAttribute("obj"); %>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" href="profile.jsp?id=<%=u.getId()%>">Profile</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>