package com.cos.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {

	public static void back(HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
