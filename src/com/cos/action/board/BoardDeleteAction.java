package com.cos.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDao;
import com.cos.util.Script;

public class BoardDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") == null || request.getParameter("id").equals(""))
			return;

		int id = Integer.parseInt(request.getParameter("id"));

		BoardDao dao = new BoardDao();
		int result = dao.delete(id);
		if (result == 1) {
			response.sendRedirect("/blog/index.jsp");

		} else {
			Script.back(response);
		}

	}
}
