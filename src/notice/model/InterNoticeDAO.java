package notice.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterNoticeDAO {

	// 공지사항 글쓰기
	int noticeWrite(HashMap<String, String> map) throws SQLException;

	// 공지사항 글목록 불러오기
	List<NoticeVO> noticeTitleList() throws SQLException;
	
	
}
