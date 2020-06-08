package practice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/practice/examCheckEmail")
public class ExamCheckEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		// *** 웹브라우저에 출력하기 *** // ----------------------------------------
		// HttpServletResponse response 객체는 넘어온 데이터를 조작하여 결과물을 나타내고자 할 때 쓰인다.
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		// out은 웹브라우저에 기술하는 대상체라고 생각하자.
		
		out.print("사용중인 email 입니다");
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/practice/exam_member.html");
		dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		doGet(request, response);
	}

}
