<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("${message}");
	="${loc}"; // 페이지이동

	self.close(); // 팝업창 닫기
	opener.location.reload(true); // 부모창 새로고침
/*	
	="javascript:history.go(-2);";  // 이전이전 페이지로 이동 
 	="javascript:history.go(-1);";  // 이전 페이지로 이동
 	="javascript:history.go(0);";   // 현재 페이지로 이동(==새로고침) 캐시에서 읽어옴.
 	="javascript:history.go(1);";   // 다음 페이지로 이동.
 	
 	="javascript:history.back();";       // 이전 페이지로 이동 
 	="javascript:location.reload(true)"; // 현재 페이지로 이동(==새로고침) 서버에 가서 다시 읽어옴. 
 	="javascript:history.forward();";    // 다음 페이지로 이동.
*/ 	
	
</script>    
