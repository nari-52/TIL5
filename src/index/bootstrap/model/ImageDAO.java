package index.bootstrap.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImageDAO implements InterImageDAO {
	
	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ImageDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 상품이미지를 모두 조회(select) ---------------------------------------------------
	@Override
	public List<ImageVO> selectAll() throws SQLException {
		
		List<ImageVO> imgList = new ArrayList<ImageVO>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "    select imgno, imgfilename  " + 
						 "    from mymvc_main_image " + 
						 "    order by imgno asc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImageVO imgvo = new ImageVO();
				imgvo.setImgno(rs.getInt("IMGNO"));
				imgvo.setImgfilename(rs.getString("IMGFILENAME"));
				
				imgList.add(imgvo);				
			} // end of while()-----------
			
			
		} finally {
			close(); // 사용한 자원 반납
		}
		
		
		return imgList;
	} // end of public List<ImageVO> selectAll()-----------------------------
	
	
	
	
	
	

}
