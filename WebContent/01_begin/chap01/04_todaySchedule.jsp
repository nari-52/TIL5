<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 스케쥴</title>

<link rel="stylesheeet" type="text/css" href="css/ctyle.css"/>
</head>
<body>

	<h3>오늘의 메뉴</h3>
	<ol style="list-style-type: decimal-leading-zero; ">
		<li>기상</li>
		<li>식사</li>
		<li>공부</li>
		<li>스트레칭</li>
	</ol>
	
	<div id="today">
		현재시각: <%@ include file="04_todayTime.jsp" %>
		<%-- include 지시어인 <%@ include %>을 사용하여 파일을 불러와서 파일의 결과값을 끼워넣는다 --%>
	</div>

</body>
</html>