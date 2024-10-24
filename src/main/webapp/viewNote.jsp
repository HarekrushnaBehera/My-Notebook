<%@page import="com.org.dto.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Notes</title>
<style type="text/css">
	.card-text {
		font-weight: normal;
		text-align: justify;
		margin: 3px 6px;
    	padding-top: 2px;
	}
	.icons button {
		padding: 4px 5px;
		font-size: 18px;
	}
	.d-flex .time {
		align-content: center;
    	color: #5283ad;
    	font-weight: 500;
    	font-size: 13px;
	}
	.note_card {
		height: 20vh;
		width: 27%;
	}
	.note_card .card {
		height: 100%;
	}
	.note_card p {
		height: 56px;
    	overflow: auto;
    	scrollbar-width: none;
	}
	.delete {
		font-size: 24px;
		font-weight: bold;
		color: #292326;
	}
</style>
<%@ include file="components/bootstrapCss.jsp"%>
</head>
<body>
<%@ include file="components/user_navbar.jsp"%>
<% int userid = Integer.parseInt(request.getParameter("id"));
	NoteDao ndao = new NoteDao();
	List<Note> notes = ndao.fetchNotesByUserId(userid);
	if (notes != null) {
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 d-flex">
				<%@ include file="components/user_dashboard.jsp"%>
				<div class="card">
					<div class="card-body ml-3">
						<h5 class="card-title mb-1">View Notes</h5>
						<p class="card-subtitle mb-3 text-muted fs-6">Home / View Notes</p>
						<div class="d-flex flex-wrap">
							<% for(Note note: notes) { %>
								<div class="shadow m-2 note_card">
									<div class="card">
  										<div class="card-body p-2 d-flex flex-column justify-content-between">
    										<div>
    											<h5 class="card-title"><%= note.getTitle() %></h5>
    											<p class="card-text"><%= note.getDesc() %></p>
    										</div>
    										<div class="d-flex justify-content-between">
    											<div class="time"><%= note.getD_time() %></div>
    											<div class="d-grid gap-2 d-md-flex justify-content-md-end icons">
    												<button class="btn text-secondary" data-bs-toggle="modal" data-bs-target="#editModal<%=note.getNote_id()%>">
    													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
    												</button>
    												<button class="btn text-secondary ml-2" data-bs-toggle="modal" data-bs-target="#deleteModal<%=note.getNote_id()%>">
    													<i class="fa fa-trash-o" aria-hidden="true"></i>
    												</button>
    											</div>
    										</div>
  										</div>
									</div>
								</div>
							<% } %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% for(Note note: notes) { %>
		<div class="modal fade" id="editModal<%=note.getNote_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  		<div class="modal-dialog">
	    		<div class="modal-content">
	    			<form class="px-3 pt-3" action="editnote">
		      			<div class="mb-2">
							<label class="form-label">Title :</label>
							<input name="title" type="text" value="<%= note.getTitle() %>" class="form-control" required>
						</div>
						<div class="mb-2">
							<label class="form-label">Description :</label>
							<input name="desc" type="text" value="<%= note.getDesc() %>" class="form-control" required>
						</div>
						<input name="nid" type="hidden" value="<%=note.getNote_id()%>">
		      			<div class="modal-footer">
		        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
		        			<button type="submit" class="btn btn-primary">Edit</button>
		      			</div>	
	    			</form>
	    		</div>
	  		</div>
		</div>
	<% } %>
	<% for(Note note: notes) { %>
		<div class="modal fade" id="deleteModal<%=note.getNote_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  		<div class="modal-dialog">
	    		<div class="modal-content">
	    			<form class="px-3 pt-3" action="deletenote">
						<div class="mb-2 delete">Do you want to delete this note ?</div>
						<input name="nid" type="hidden" value="<%=note.getNote_id()%>">
		      			<div class="modal-footer border-top-0">
		        			<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancel</button>
		        			<button type="submit" class="btn btn-danger">Delete</button>
		      			</div>	
	    			</form>
	    		</div>
	  		</div>
		</div>
	<% } %>
	<% } else {  %>
		<div class="alert alert-info" role="alert">
  			You have No notes to show
		</div>
	<% response.sendRedirect("note.jsp");
	} %>
</body>
</html>