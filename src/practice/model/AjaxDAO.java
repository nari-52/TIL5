package practice.model;

import java.sql.*;
import javax.naming.*;

import javax.sql.DataSource;


public class AjaxDAO implements InterExamMemberDAO {

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

	
	// 직원 추가하기 메소드 생성하기 -------------------------------------
	@Override
	public void registerEmp(ExamMemberVO empvo) throws SQLException {
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into exam_ajaxmember (name, email)"
					   + " values(?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empvo.getName());
			pstmt.setString(2, empvo.getEmail());
			
			pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
	} // end of public void registerEmp(EmployeeVO empvo)----------------

	

	// 이메일 중복 검사하는 메소드 생성하기 ---------------------------------
	@Override
	public boolean examCheckEmail(String email) throws SQLException {
		boolean isUse;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select email " + 
						 " from exam_ajaxmember " + 
						 " where email = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			isUse = !rs.next(); 

		} finally {
			close();
		}
		
		return isUse;
	} // end of public boolean emailDuplicateCheck(String email)-------------
	


}
