package ajaxstudy.model;

import java.sql.*;
import java.util.*;
import javax.naming.*;

import javax.sql.DataSource;

public class AjaxDAO implements InterAjaxDAO {

	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AjaxDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}	
	
	
	// 광고이미지 전체 목록 조회해주는 메소드 생성하기
	@Override
	public List<HashMap<String, String>> imgList() throws SQLException {

		List<HashMap<String, String>> imgList = new ArrayList<HashMap<String, String>>();
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "select imgno, imgfilename " + 
			 		     " from mymvc_main_image " + 
			 		     " order by imgno asc ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 
				 HashMap<String, String> map = new HashMap<String, String>();
				 map.put("IMGNO", rs.getString("IMGNO"));
				 map.put("IMGFILENAME", rs.getString("IMGFILENAME"));
				 
				 imgList.add(map);
			 }// end of while----------------------
			 
		} finally {
			close();
		}
		
		return imgList;
	}

	
	// 뉴스제목 목록 조회 메소드 생성하기 
	@Override
	public List<NewsTitleVO> newsTitleList() throws SQLException {
		
		List<NewsTitleVO> newsTitleList = new ArrayList<NewsTitleVO>();
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = "select seqtitleno " + 
			 		      "     , case when length(title) > 22 then substr(title, 1, 20)||'..' " + 
			 		      "       else title end AS title " + 
			 		      "     , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday " + 
			 		      "from test_ajaxnews " + 
			 		      "order by seqtitleno desc ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 NewsTitleVO vo = new NewsTitleVO();
				 vo.setSeqtitleno(rs.getInt(1));
				 vo.setTitle(rs.getString(2));
				 vo.setRegisterday(rs.getString(3));
				 
				 newsTitleList.add(vo);
			 }// end of while----------------------
			 
		} finally {
			close();
		}
		
		return newsTitleList;
	}

	
	// 특정 뉴스내용을 조회해주는 메소드 생성하기
	@Override
	public String newsContents(String seqno) throws SQLException {
		
		String newsContents = "";
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " select newscontents " + 
			 		      " from test_ajaxnews_contents " + 
			 		      " where fk_seqtitleno = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, seqno);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 newsContents = rs.getString(1);
			 }// end of if----------------------
			 
		} finally {
			close();
		}
		
		return newsContents;		
	}

	
	// 뉴스제목, 뉴스내용 쓰기 메소드 생성하기
	@Override
	public void newsWrite(HashMap<String, String> map) throws SQLException {
	
		try {
			 conn = ds.getConnection();
			 
			 // 시퀀스 값 채번해오기
			 String sql = " select seq_test_ajaxnews_seqtitleno.nextval " + 
			 		      " from dual ";
			 
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 rs.next();
			 int seqtitleno = rs.getInt(1);
			 
			 /////////////////////////////////////////////////////////
			 sql = " insert into test_ajaxnews(seqtitleno, title) "
			 	 + " values(?,?) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, seqtitleno);
			 pstmt.setString(2, map.get("title"));
			 
			 pstmt.executeUpdate();
			 ///////////////////////////////////////////////////////////
			 
			 sql = " insert into test_ajaxnews_contents(fk_seqtitleno, newscontents) "
			     + " values(?,?) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, seqtitleno);
			 pstmt.setString(2, map.get("newscontents"));
			 
			 pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
	}

	
	// 직원추가하기 메소드 생성하기 
	@Override
	public void registerEmp(EmployeeVO empvo) throws SQLException {
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " insert into test_ajaxemp(ename, jik, tel, email, birthday) "
			 		    + " values(?,?,?,?,?) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, empvo.getEname());
			 pstmt.setString(2, empvo.getJik());
			 pstmt.setString(3, empvo.getTel());
			 pstmt.setString(4, empvo.getEmail());
			 pstmt.setString(5, empvo.getBirthday());
			 
			 pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
	}

	
	// 모든 직원 정보 조회해주는 메소드 생성하기 
	@Override
	public List<EmployeeVO> empList() throws SQLException {

		List<EmployeeVO> empList = new ArrayList<EmployeeVO>();
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " select ename, jik, tel, email " + 
			 		      " from test_ajaxemp " + 
			 		      " order by ename ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 EmployeeVO empvo = new EmployeeVO();
				 empvo.setEname(rs.getString(1));
				 empvo.setJik(rs.getString(2));
				 empvo.setTel(rs.getString(3));  // "01056783456" 이  "010-5678-3456" 으로 set 되어짐.
				 empvo.setEmail(rs.getString(4));
				 
				 empList.add(empvo);
			 }// end of while----------------------
			 
		} finally {
			close();
		}
		
		return empList;		
		
	}

	
	// 특정 직원 정보 조회해주는 메소드 생성하기
	@Override
	public EmployeeVO empDetail(String email) throws SQLException {

		EmployeeVO empvo = null;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " select ename, jik, tel, email, birthday " + 
			 		      " from test_ajaxemp " + 
			 		      " where email = ? ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, email);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 empvo = new EmployeeVO();
				 empvo.setEname(rs.getString(1));
				 empvo.setJik(rs.getString(2));
				 empvo.setTel(rs.getString(3));      // "01056783456" 이  "010-5678-3456" 으로 set 되어짐.
				 empvo.setEmail(rs.getString(4));
				 empvo.setBirthday(rs.getString(5)); // "19910501" 이 "1991.05.01" 으로 set 되어지고,
				                                     // empvo의 나이(age)도 동시에 set 되어짐.
				 
			 }// end of if----------------------------
			 
		} finally {
			close();
		}
		
		return empvo;				
		
	}
	
	
	
	

}









