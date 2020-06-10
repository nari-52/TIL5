package ajaxstudy.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxstudy.model.*;

import common.controller.AbstractController;

public class XmltestNewsWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String title = request.getParameter("title");
		String newscontents = request.getParameter("newscontents");
		
	//	System.out.println("~~~~~~ 확인용 title : " + title); // 기사제목 연습 
	//	System.out.println("~~~~~~ 확인용 newscontents : " + newscontents); // 기사내용 연습입니다. 
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("newscontents", newscontents);
		
		InterAjaxDAO dao = new AjaxDAO();
		dao.newsWrite(map);
		
	}

}
