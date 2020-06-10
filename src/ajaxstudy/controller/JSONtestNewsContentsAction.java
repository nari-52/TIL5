package ajaxstudy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import ajaxstudy.model.AjaxDAO;
import ajaxstudy.model.InterAjaxDAO;
import common.controller.AbstractController;

public class JSONtestNewsContentsAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String seqno = request.getParameter("seqno");
		
		InterAjaxDAO dao = new AjaxDAO();
		String newscontents = dao.newsContents(seqno);
		
		JSONObject jsobj = new JSONObject();  
		jsobj.put("newscontents", newscontents); 
		
		String json = jsobj.toString();
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/ajaxstudy/jsontest/jsonview.jsp");
		
	}

}
