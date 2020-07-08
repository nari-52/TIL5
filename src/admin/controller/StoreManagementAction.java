package admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.InterStoreDAO;
import admin.model.StoreDAO;
import admin.model.StoreVO;
import common.controller.AbstractController;

public class StoreManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// == 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. ==
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
			
			String message = "먼저 로그인 해야 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		
		else {
			String userid = loginuser.getUserid();
			
			if(!"admin".equals(userid)) {
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
		}
		
		InterStoreDAO storeDAO = new StoreDAO();
		
		// *** 페이징 처리한 전체 매장 목록 보여주기 *** // --------------------------
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		String sizePerPage = request.getParameter("sizePerPage"); // 기본값 무조건 10
	
		if (currentShowPageNo == null)
			currentShowPageNo = "1";
		
		if (sizePerPage == null)
			sizePerPage = "10";
		
		HashMap<String,String> sMap = new HashMap<String,String>();
		
		sMap.put("currentShowPageNo", currentShowPageNo);
		sMap.put("sizePerPage", sizePerPage);
		
		// -----------------------------------------------------------------

		// 전체 매장 정보 가져오기 메소드 생성
		List<StoreVO> storeList = storeDAO.selectPagingStore(sMap);

		for(StoreVO svo : storeList) {
			int income = storeDAO.selectIncomeByStore(svo.getStore_id());
			svo.setIncome(income);
		}
		
//		List<StoreVO> incomeList = storeDAO.selectIncomeByStore(sMap);
		
		
		request.setAttribute("storeList", storeList);
		request.setAttribute("sizePerPage", sizePerPage);
		
		// *** 페이지바 만들기 *** // -----------------------------------------------------
		// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
		int totalPage = storeDAO.getTotalPage(sMap);
		
		int pageNo = 1;
		// pageNo 는 페이지바에서 보여지는 첫번째 페이지번호이다.
		
		int blockSize = 10;
		// blockSize 는 블럭당 보여지는 페이지 번호의 개수이다.
		
		int loop = 1;
		// loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다.
		
		// !!! 다음은 pageNo를 구하는 공식이다. !!!
		pageNo = ((Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
	
		String pageBar = "";
		
		
		// *** [이전] 만들기 *** //
		 if( pageNo != 1 ) {
			pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"'>[이전]</a>&nbsp;";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				// 현재 클릭한 페이지 넘버라면
				pageBar += "&nbsp;<span style='color:red; border: solid 1px gray; padding: 2px 4px;'>"+pageNo+"</span>&nbsp;";
			}
			
			else {
				pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++; // 1 2 3 4 5 6 7 8 9 10 11 12 ... 40 41 42
			loop++;	  // 1 2 3 4 5 6 7 8 9 10		
		}
		
		// *** [다음] 만들기 *** //
		if( !(pageNo > totalPage) ) {
			pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a>&nbsp;";
		}

		request.setAttribute("pageBar", pageBar);

		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/store_management.jsp");
	}

}
