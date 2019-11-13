package com.cos.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.UserDao;
import com.cos.util.Script;

public class UserEmailCheckAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String email = request.getParameter("email");
      String username = request.getParameter("username");
      UserDao dao = new UserDao();
      
      int result = dao.emailCheckUpdate(email,username);
      
      if(result == 1) {
         response.sendRedirect("/blog/user/login.jsp");
      }else{
         Script.back(response);
      }

   }

}