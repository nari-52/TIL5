package ajaxstudy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jsontest02")
public class JSONTest02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		// **** 웹브라우저에 출력하기 시작 **** //
		// HttpServletResponse response 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할때 쓰인다.
		response.setContentType("text/html; charset=UTF-8");
				
		PrintWriter out = response.getWriter();
		// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
		
		String str = "[{\"name\":\"이순신\",\"age\":27,\"address\":\"서울시 강남구\"}"
				   + ",{\"name\":\"삼순신\",\"age\":37,\"address\":\"인천시 연수구\"}"
				   + ",{\"name\":\"사순신\",\"age\":47,\"address\":\"수원시 팔달구\"}]";
		
		out.print(str);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
	
		doGet(request, response);
	}

}
