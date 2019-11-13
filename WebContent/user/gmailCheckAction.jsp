<%@page import="java.io.PrintWriter"%>
<%@page import="com.cos.util.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//code 값 받기
	String code = request.getParameter("code");
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	//return code값이랑 send code 값을 비교해서 동일하면
	boolean rightCode = SHA256.getEncrypt(email,"cos").equals(code) ? true:false;
	PrintWriter script = response.getWriter();
	if(rightCode == true){
		//DB에 emailCheck 칼럼 update 해주기 1 : 인증완료, -1 : 미인증
		script.println("<script>");
		script.println("alert('이메일 인증에 성공하였습니다.')");
		script.println("location.href='/blog/user?cmd=emailCheck&email="+email+"&username="+username+"'");
		script.println("</script>");
		//response.sendRedirect("/blog/user/login.jsp");
	} else{
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("location.href='error.jsp'");
		script.println("</script>");
		//response.sendRedirect("/blog/user/error.jsp");
	}
	
	//인증 완료 로그인 페이지 이동

	//미인증 error 페이지 이동

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>