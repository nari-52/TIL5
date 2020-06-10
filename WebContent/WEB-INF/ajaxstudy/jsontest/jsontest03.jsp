<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 테스트 1</title>

<style type="text/css">
	div {margin: 20px;}
</style>

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$.ajax({
			url:"<%= ctxPath%>/jsontest01",	
			success:function(text){
				// text 에는 url 주소 /MyMVC/jsontest01 로 부터 받은 
				// 문자열 {"name":"이순신","age":27,"address":"서울시 강남구"} 이 들어온다.
				
				var obj = JSON.parse(text);
				// JSON.parse(text); 은 JSON 형식으로 되어진 문자열을 자바스크립트 객체로 변환해주는 것이다.
				// 조심할 것은 text 는 반드시 JSON 형식으로 되어진 문자열이어야 한다.
				
				// 그 반대는 JSON.stringify(자바스크립트객체); 메소드로서 자바스크립트객체를 JSON 문자열로 변환해주는 것이다. 
				
				var html = "<ul>"+
				           "<li>"+ obj.name +"</li>"+
				           "<li>"+ obj.age +"</li>"+
				           "<li>"+ obj.address +"</li>"+
				           "</ul>";
				           
				 $("#div1").html(html);          
			 },
			 error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			 }
		});
		
		
		$.ajax({
			url:"<%= ctxPath%>/jsontest01",	
			dataType:"json",
			success:function(json){
				// json 에는 url 주소 /MyMVC/jsontest01 로 부터 받은 
				// 문자열 {"name":"이순신","age":27,"address":"서울시 강남구"} 이
				// 자바스크립트 객체로 변화된 것이 들어온다.
				
				var html = "<ol>"+
				           "<li>"+ json.name +"</li>"+
				           "<li>"+ json.age +"</li>"+
				           "<li>"+ json.address +"</li>"+
				           "</ol>";
				           
				 $("#div2").html(html);          
			 },
			 error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			 }
		});
	
	});
</script>

</head>
<body>
	<div id="div1"></div>
    <div id="div2"></div>
</body>
</html>





