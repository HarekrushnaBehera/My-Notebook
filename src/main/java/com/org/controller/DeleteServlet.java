package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NoteDao;

@WebServlet("/deletenote")
public class DeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int note_id = Integer.parseInt(req.getParameter("nid"));
		
		NoteDao ndao = new NoteDao();
		ndao.deleteNoteById(note_id);
		
		HttpSession session = req.getSession();
		session.setAttribute("delete", "Note Deleted Successfully");
		res.sendRedirect("note.jsp");
	}
}