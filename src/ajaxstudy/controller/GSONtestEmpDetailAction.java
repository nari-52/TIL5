package ajaxstudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ajaxstudy.model.*;
import common.controller.AbstractController;

public class GSONtestEmpDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		
		InterAjaxDAO dao = new AjaxDAO();
		EmployeeVO empvo = dao.empDetail(email);
		
		Gson gson = new Gson();
		String json = gson.toJson(empvo);
		
		// gson.toJson(empList); 은  Java 객체 또는 Collection 을 JSON 형태의 문자열로 바꾸어주는 것이다.
		// 자바객체를 JSON(자바스크립트에서 사용되어지는 객체표기법)형태의 문자열로 변경해주는 것인데 
		// 키값은 자바객체의 필드(속성,어트리뷰트)명이 키값이 되어지고, value값은 자바객체의 필드(속성,어트리뷰트)에 입력된 값이다.
		
		System.out.println("~~~~ 3.확인용 json => " + json);
		//  ~~~~ 3.확인용 json => {"ename":"이순신","jik":"사장","tel":"010-5678-3456","email":"leess@gmail.com","birthday":"1994.10.19","age":27} 
		
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/ajaxstudy/jsontest/jsonview.jsp");
		
	}

}
