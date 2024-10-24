package com.org.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NoteDao;
import com.org.dto.Note;

@WebServlet("/addnote")
public class AddNote extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int userid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("title");
		String desc = req.getParameter("desc");
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatobj = DateTimeFormatter.ofPattern("dd-MM-yy HH:mm");
		String time = now.format(formatobj);
		
		Note note = new Note();
		note.setUser_id(userid);
		note.setTitle(title);
		note.setD_time(time);
		note.setDesc(desc);
		
		NoteDao ndao = new NoteDao();
		ndao.addNote(note);
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", "Note added Successfully");
		
		res.sendRedirect("note.jsp");
				
	}
}
