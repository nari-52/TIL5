package ajaxstudy.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxstudy.model.*;
import common.controller.AbstractController;

public class XmltestImageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterAjaxDAO dao = new AjaxDAO();
		
		List<HashMap<String, String>> imgList = dao.imgList();
		
		request.setAttribute("imgList", imgList);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/ajaxstudy/xmltest/imgList.jsp");
		
	}

}
