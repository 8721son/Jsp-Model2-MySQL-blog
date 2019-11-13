package com.cos.action.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.ReplyDao;
import com.cos.model.Comment;
import com.cos.model.Reply;
import com.cos.util.Script;
import com.google.gson.Gson;

public class ReplyWriteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		String content = request.getParameter("content");
		
		System.out.println("userId :"+userId);
		System.out.println("commentId :"+commentId);
		System.out.println("content :"+content);
		
		Reply reply = new Reply();
		reply.setUserId(userId);
		reply.setCommentId(commentId);
		reply.setContent(content);
		
		ReplyDao dao = new ReplyDao();
		//form으로 받은 데이터를 Comment 객체로 변환
		int result = dao.save(reply);
		
		if(result==1) {
			//Comment 테이블에 가장 마지막에 만들어진 Comment의 튜플이 필요
			Reply rp = dao.findByMaxId();
			rp.getResponseData().setStatusCode(1);
			rp.getResponseData().setStatus("ok");
			rp.getResponseData().setStatusMessage("Write was completed");
			Gson gson = new Gson();
			String replyJson = gson.toJson(rp);
			System.out.println("(1)commentJson:"+replyJson);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(replyJson);
			out.flush();
		}else {
			Script.back(response);
		}
	}
	
}
