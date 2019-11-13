package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.model.User;
import com.cos.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProfileAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getSession().getServletContext().getRealPath("media");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String username = user.getUsername();
		
		System.out.println(path);
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				path, 
				1024 * 1024 * 2, 
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String filename = multi.getFilesystemName("userProfile");
		String contextPath = request.getSession().getServletContext().getContextPath();
		String filepath = contextPath+"/media/"+filename;
		
		System.out.println(filename);
		System.out.println(filepath);

		UserDao dao = new UserDao();
		int result = dao.profileUpdate(username, filepath);
		if (result == 1) {
			// 세션 불러와서 프로파일 담기
			user.setUserProfile(filepath);
			session.setAttribute("user", user);
			response.sendRedirect("/blog/index.jsp");
		} else {
			Script.back(response);
		}

	}

}