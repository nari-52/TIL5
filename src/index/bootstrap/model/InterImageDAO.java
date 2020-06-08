package index.bootstrap.model;

import java.sql.SQLException;
import java.util.List;

public interface InterImageDAO {
	
	// 상품이미지를 모두 조회(select)
	List<ImageVO> selectAll() throws SQLException;

}
