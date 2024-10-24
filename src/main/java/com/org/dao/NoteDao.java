package com.org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.org.dto.Note;

public class NoteDao {
	
	public void addNote(Note note) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_notebook", "root","hkb@12345");
			PreparedStatement pstmt = con.prepareStatement("insert into notes(user_id,title,d_time,content) values(?,?,?,?)");
			pstmt.setInt(1, note.getUser_id());
			pstmt.setString(2, note.getTitle());
			pstmt.setString(3, note.getD_time());
			pstmt.setString(4, note.getDesc());

			pstmt.executeUpdate();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Note> fetchNotesByUserId(int uid) {
		List<Note> list = new ArrayList<Note>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_notebook","root","hkb@12345");
			Statement stmt = con.createStatement();
			ResultSet rst = stmt.executeQuery("select * from notes where user_id = "+uid+"");
			while (rst.next()) {
				Note note = new Note();
				note.setNote_id(rst.getInt("id"));
				note.setTitle(rst.getString("title"));
				note.setD_time(rst.getString("d_time"));
				note.setDesc(rst.getString("content"));
				list.add(note);
			}
			con.close();
			return list;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null ;
	}
	
	
	public void updateNoteById(int id, Note note) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_notebook","root","hkb@12345");
			PreparedStatement pstmt = con.prepareStatement("update notes set  title=?,content=? where id=?");
			pstmt.setString(1, note.getTitle());
			pstmt.setString(2, note.getDesc());
			pstmt.setInt(3, id);
			pstmt.executeUpdate();
			
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteNoteById(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_notebook","root","hkb@12345");
			PreparedStatement pstmt = con.prepareStatement("delete from notes where id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
