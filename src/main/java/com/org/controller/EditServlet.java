package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NoteDao;
import com.org.dto.Note;

@WebServlet("/editnote")
public class EditServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int note_id = Integer.parseInt(req.getParameter("nid"));
		String title = req.getParameter("title");
		String content = req.getParameter("desc");
		
		Note note = new Note();
		note.setTitle(title);
		note.setDesc(content);
		
		NoteDao ndao = new NoteDao();
		ndao.updateNoteById(note_id, note);
		
		HttpSession session = req.getSession();
		session.setAttribute("edit", "Note Updated Successfully");
		res.sendRedirect("note.jsp");
	}
}
