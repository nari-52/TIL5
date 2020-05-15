<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 10까지의 합을 자바에서 구한 다음 그 결과물을 HTML으로 보여주기.</title>
<style type="text/css">
	span#result {
		color : red;
	}
</style>

</head>
<body>

<% 
	// *** 스크립틀릿(scriptlet)이라고 부른다. ***
	// 스크립틀릿(scriptlet)은 자바코드가 들어오는 부분
	// F12로 코드 확인이 불가능해 보안상 좋다.
	
	// 1줄 주석문
	/*
		여러줄
		주석문
	*/
	
	int sum = 0;
	
	for(int i=0; i<=10; i++) {
		sum += i;		
	}

%>

	<!-- HTML 주석문 -->
	<%-- JSP 주석문 --%>
	
	<%-- 
		<%로 시작하여 %>로 끝나는 것을 스크립틀릿(scriptlet)이라고 부른다.
		스크립틀릿에 자바 코딩이 들어가는 것이다.
		그런데 스크립틀릿에 코딩된 부분은 웹브라우저에서
		소스보기를 하더라도 안 보여지므로 보안성이 좋다.
		
		<%= %> 을 expression(표현식)이라고 부른다.
		이 expression(표현식)은 스크립틀릿에서 작성된 결과값을
		웹브라우저상에 보여주고자 할 떄 사용하는 것이다.
		
		==============================================
		01_oneToTenSum.jsp 라는 파일은 실제로는
		확장자.java 파일로 저장되어서 컴파일 되어진
		확장자.class 파일로 저장되어지는데
		어느경로에 저장되어지는지 알아본다.
		
		C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MyMVC\org\apache\jsp\_01_005fbegin\chap01\_01_005foneToTenSum_jsp.java
		C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MyMVC\org\apache\jsp\_01_005fbegin\chap01\_01_005foneToTenSum_jsp.class                  
		위와 같이 저장된다.
		
		01_oneToTenSum.jsp 파일을 수정했지만 수정이 반영되지 않는 경우에는
		위에 탐색기에서 _01_005foneToTenSum_jsp.java 파일과 _01_005foneToTenSum_jsp.class 파일을 삭제한다.
		삭제 후 다시 서버를 돌리면 자동적으로 파일이 생성될 것이다.
	--%>
	
	<h2>
		1부터 10까지의 합은? <span id="result"><%= sum%></span> 입니다.
	</h2>


</body>
</html>