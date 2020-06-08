package practice.model;

import java.sql.SQLException;

public interface InterExamMemberDAO {

	// 직원 추가하기 
	void registerEmp(ExamMemberVO empvo) throws SQLException;

	// 이메일 중복 검사
	boolean examCheckEmail(String email) throws SQLException;

}
