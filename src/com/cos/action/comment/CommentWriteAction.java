package com.cos.action.comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.CommentDao;
import com.cos.model.Comment;
import com.cos.util.Script;
import com.google.gson.Gson;

public class CommentWriteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String content = request.getParameter("content");
		
		System.out.println("userId :"+userId);
		System.out.println("boardId :"+boardId);
		System.out.println("content :"+content);
		
		Comment cmt = new Comment();
		cmt.setUserId(userId);
		cmt.setBoardId(boardId);
		cmt.setContent(content);
		
		CommentDao dao = new CommentDao();
		//form으로 받은 데이터를 Comment 객체로 변환
		int result = dao.save(cmt);
		
		if(result==1) {
			//Comment 테이블에 가장 마지막에 만들어진 Comment의 튜플이 필요
			Comment comment = dao.findByMaxId();
			comment.getResponseData().setStatusCode(1);
			comment.getResponseData().setStatus("ok");
			comment.getResponseData().setStatusMessage("Write was completed");
			Gson gson = new Gson();
			String commentJson = gson.toJson(comment);
			System.out.println("(1)commentJson:"+commentJson);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(commentJson);
			out.flush();
		}else {
			Script.back(response);
		}
	}
}
