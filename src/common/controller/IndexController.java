package common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import index.bootstrap.model.*;

public class IndexController extends AbstractController {
	
	@Override
	public String toString() {
		
		return "클래스 IndexController 의 인스턴스 메소드 toString() 호출함";
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		
		// System.out.println("~~~ 확인용 IndexController 의 execute 메소드가 호출됨" );
		
		request.setAttribute("storeName", "대박쇼핑");
		
		InterImageDAO dao = new ImageDAO();
		List<ImageVO> imgList = dao.selectAll();
		
		request.setAttribute("imgList", imgList);		
		
		super.setRedirect(false); // forward 방식이다.
		super.setViewPage("/WEB-INF/index.jsp");
		
	}

}
