package ajaxstudy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import ajaxstudy.model.AjaxDAO;
import ajaxstudy.model.InterAjaxDAO;
import ajaxstudy.model.NewsTitleVO;
import common.controller.AbstractController;

public class JSONtestNewsTitleAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterAjaxDAO dao = new AjaxDAO();
		
		List<NewsTitleVO> newsTitleList = dao.newsTitleList();
		
		// ===== org.json.* 을 사용한 것 ===== //
		JSONArray jsonArr = new JSONArray();
			
		for(NewsTitleVO vo : newsTitleList) {
			JSONObject jsobj = new JSONObject();  
			jsobj.put("seqtitleno", vo.getSeqtitleno()); 
			jsobj.put("title", vo.getTitle()); 
			jsobj.put("registerday", vo.getRegisterday());
			
			jsonArr.put(jsobj); 
		}
		
		String json = jsonArr.toString();
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/ajaxstudy/jsontest/jsonview.jsp");
		
	}

}
