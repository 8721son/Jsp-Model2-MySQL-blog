package com.cos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.action.comment.CommentFactory;

//http://localhost:8000/blog/user?cmd=list
@WebServlet("/api/comment")
public class CommentRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommentRestController() {
        super();
     }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 들어오는 모든 문자를 UTF-8로 인코딩
		request.setCharacterEncoding("UTF-8");
		//2. command 처리
		String cmd = request.getParameter("cmd");
		//3. command 검증
		if(cmd==null || cmd.equals("")) {
			return;
		}
		//4. Factory 연결
		Action action = CommentFactory.getAction(cmd);
		//5. execute 실행
		if(action != null) {
			action.execute(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
