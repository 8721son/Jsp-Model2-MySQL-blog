package com.cos.action.comment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.CommentDao;
import com.cos.util.Script;

public class CommentDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader in = request.getReader();
		String temp = in.readLine();
		int commentId = Integer.parseInt(temp);

		CommentDao dao = new CommentDao();
		int result = dao.delete(commentId);
		
		if (result == 1) {
			PrintWriter out = response.getWriter();
			out.print("ok"); //println을 쓰면 \n이 같이 날라간다
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.print("no");
			out.flush();
		}

	}

}
