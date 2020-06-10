package ajaxstudy.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

// import org.json.simple.JSONArray;
// import org.json.simple.JSONObject;

import ajaxstudy.model.AjaxDAO;
import ajaxstudy.model.InterAjaxDAO;
import common.controller.AbstractController;

public class JSONtestImageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterAjaxDAO dao = new AjaxDAO();
		
		List<HashMap<String, String>> imgList = dao.imgList();
		
		// DB에서 얻어온 결과물을 JSON 형식의 문자열로 바꾸어주는 .jar 파일을 다운받으러 간다.
		// https://mvnrepository.com 에 가서 검색어로 json 이라고 입력하자.
		
		// *** DB에서 얻어온 결과물인 imgList 을 JSON 형식의 문자열로 바꾸는 작업을 한다. *** 
		
		// ===== org.json.simple.* 을 사용한 것 ===== //
	/*	
		JSONArray jsonArr = new JSONArray();
		
		for(HashMap<String, String> map : imgList) {
			JSONObject jsobj = new JSONObject();    // {}  {}
			jsobj.put("IMGNO", map.get("IMGNO"));   // {"IMGNO":"1"}  {"IMGNO":"2"}
			jsobj.put("IMGFILENAME", map.get("IMGFILENAME"));  // {"IMGNO":"1", "IMGFILENAME":"미샤.png"}  {"IMGNO":"2", "IMGFILENAME":"동원.png"} 
			
			jsonArr.add(jsobj);  // [{"IMGNO":"1", "IMGFILENAME":"미샤.png"},{"IMGNO":"2", "IMGFILENAME":"동원.png"} ]
		}
		
		String json = jsonArr.toString();
		request.setAttribute("json", json);
	*/	
		
		// ===== org.json.* 을 사용한 것 ===== //
		JSONArray jsonArr = new JSONArray();
			
		for(HashMap<String, String> map : imgList) {
			JSONObject jsobj = new JSONObject();  // {}  {}
			jsobj.put("IMGNO", map.get("IMGNO")); // {"IMGNO":"1"}  {"IMGNO":"2"}
			jsobj.put("IMGFILENAME", map.get("IMGFILENAME")); // {"IMGNO":"1", "IMGFILENAME":"미샤.png"}  {"IMGNO":"2", "IMGFILENAME":"동원.png"}
			
			jsonArr.put(jsobj); // [{"IMGNO":"1", "IMGFILENAME":"미샤.png"},{"IMGNO":"2", "IMGFILENAME":"동원.png"} ]
		}
		
		String json = jsonArr.toString();
		request.setAttribute("json", json);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/ajaxstudy/jsontest/jsonview.jsp");		
		
	}

}
