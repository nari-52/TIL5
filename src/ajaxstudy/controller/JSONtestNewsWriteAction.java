package ajaxstudy.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxstudy.model.AjaxDAO;
import ajaxstudy.model.InterAjaxDAO;
import common.controller.AbstractController;

public class JSONtestNewsWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String title = request.getParameter("title");
		String newscontents = request.getParameter("newscontents");
	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("newscontents", newscontents);
		
		InterAjaxDAO dao = new AjaxDAO();
		dao.newsWrite(map);		
	}

}
