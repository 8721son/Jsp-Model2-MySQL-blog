package com.cos.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//추상메소드 = 메소드의 몸체가 없다.
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
