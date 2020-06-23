package notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import common.controller.AbstractController;
import notice.model.*;

public class NoticeListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		InterNoticeDAO dao = new NoticeDAO();
		List<NoticeVO> noticeList = dao.noticeTitleList();
		
		request.setAttribute("noticeList", noticeList);
		
		
		// === org.json.* 을 사용한 것 === //
		// JSONArray jsonArr = new JSONArray();
		
		
		// request.setAttribute(name, o); // 넘겨줄 값
		// request.setAttribute("nlist", nlist); // json 객체화를 해주어야 함 (JSONArray 로 보내주어야 함 - javascript에서 이해할 수 있는 데이터 타입으로 전송해야 함.)
		
		// view 단에서 ajax 쓴다.
		
		
		
		
		
		

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/notice/noticeList.jsp");	
	}

}
