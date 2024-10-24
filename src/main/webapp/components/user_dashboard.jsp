<%@page import="com.org.dto.User"%>
<%
User nuser = (User) session.getAttribute("obj");
if (nuser != null) { %>
<div
	class="d-flex flex-column flex-shrink-0 pt-3 bg-secondary note_page"
	style="width: 280px;">
	<ul class="nav nav-pills flex-column mb-auto mynav">
		<li class="nav-item"><a href="note.jsp" class="nav-link active"
			aria-current="page">Dashboard</a></li>
		<li>
			<a href="addNote.jsp?id=<%=nuser.getId()%>" class="nav-link">AddNote</a>
		</li>
		<li>
			<a href="viewNote.jsp?id=<%= nuser.getId() %>" class="nav-link">View Notes</a>
		</li>
		<li>
			<a href="#" class="nav-link">Change Password</a>
		</li>
	</ul>
</div>
<% } else {
	response.sendRedirect("login.jsp");
} %>