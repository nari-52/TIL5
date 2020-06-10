<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
    //     /MyMVC 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery Ajax 예제(JSON)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

	div#mycontainer {
		/* border: solid 1px red; */
		width: 90%;
		margin: 0 auto;
	}

	div#imgList {
		width: 40%;
		margin: 0 auto;
		padding: 30px 0 0 0;
	}
	
	div#newsTitleList {
		/* border: solid 1px red;  */
		width: 50%;
		height: 300px;
		overflow: auto;
		margin: 30px 30px 0 0;
		float: left;
	}
	
	div#newsContent {
		border: solid 1px blue; 
		width: 40%;
		height: 250px;
		overflow: auto;
		margin: 30px 0 0 0;
		float: left;
	}

	table {
		width: 90%;
	}

	th {
		background-color: #eee;
	}

	th, td {
		border: solid 1px gray;
		padding: 5px;
	} 
	
	td:hover {
		cursor: pointer;
	}
	
	div#newsWrite {
		/* border: solid 1px red; */
		clear: both;
		padding: 40px 0;
	}
	
	li {
		margin-bottom: 10px;
	}
	
	button {
		margin-left: 20px;
	}
	
	div#employeeList {
		/* border: solid 1px red; */
		width: 50%;
		height: 300px;
		overflow: auto;
		margin: 30px 30px 0 0;
		float: left;
	}
	
	div#employeeDetail {
		border: solid 1px red; 
		width: 40%;
		height: 250px;
		overflow: auto;
		margin: 30px 0 0 0;
		float: left;
	}
	
	div#employeeWrite {
		/* border: solid 1px red;  */
		clear: both;
		padding: 40px 0;
	}
	
	table#employeeTbl {
		width: 40%;
	}
	
	table#employeeTbl th {
		text-align: center;
		font-size: 14pt;
	}
	
	table#employeeTbl th, table#employeeTbl td {
		border: none;
	}
	
	table#employeeTbl td {
		padding: 10px;
	}
	
	table#employeeTbl td:first-child {
		font-size: 12pt;
		font-weight: bolder;
	}
	
	table#employeeTbl td>input {
		width: 200px;
	}
	
	table#employeeTbl td>select {
		width: 100px;
		height: 30px;
	}

	.empcss {
		color: navy;
		background-color: #ffe6f0;
	}

	span.empspan {
		display: inline-block;
		width: 70px;
		background-color: #ffffcc;
		font-weight: bold;
		margin-right: 20px;
	}
	
	span#emailDuplicateCheck {
		display: inline-block;
		margin: 0 0 0 5px;
		padding: 2px 0;
		width: 120px;
		border-radius: 5px;
		cursor: pointer;
		color: #fff;
		background-color: #ff0066;
		text-align: center;
	}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		func_imgList();
		func_newsTitleList();
		
		$(document).on("click",".mynews",function(){
			var seqno = $(this).find(".seqno").text();
		//	alert(seqno);
			func_newsContents(seqno);
		});
	
		
		$("#btnSubmit").click(function(){
			$.ajax({
				url:"<%= ctxPath%>/ajaxstudy/jsontestNewsWrite.up",
				type:"post",
				data:{"title":$("#title").val(),
					  "newscontents":$("#newscontents").val()},
				success:function(){
					func_newsTitleList();
					$("#title").val("");
					$("#newscontents").val("");
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
		});
	
		
		
		$("#btnEmpSubmit").click(function(){
			
			// 유효성 검사 생략. 입력대상값이 모두 입력되었다는 전제하에 진행하겠음.
			
			var employee = {"ename":$("#ename").val()
					       ,"jik":$("#jik").val()
					       ,"tel":$("#tel").val()
					       ,"email":$("#email").val()
					       ,"birthday":$("#birthday").val()};
			
			var strEmployee = JSON.stringify(employee);
			// JSON.stringify(자바스크립트객체); 메소드는 자바스크립트객체를 JSON 문자열로 변환해주는 것이다.
			
			// 그 반대는  JSON.parse(text); 로서 JSON 형식으로 되어진 문자열을 자바스크립트 객체로 변환해주는 것이다.
			// 조심할 것은 text 는 반드시 JSON 형식으로 되어진 문자열이어야 한다.
			
			console.log("확인용 strEmployee => " + strEmployee);
		    // 확인용 strEmployee => {"ename":"이순신","jik":"사장","tel":"01056783456","email":"leess@gmail.com","birthday":"19941019"}
			
			
			$.ajax({
				url:"<%= ctxPath%>/ajaxstudy/gsontestEmpWrite.up",
				type:"post",
				data:{"employee":strEmployee},
				success:function(){
					func_empList(); // 모든 사원정보 출력해주기
					document.empFrm.reset();  // 초기화 시키기임.
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			
		});
		
		
		func_empList(); // 모든 사원정보 출력해주기
		
		$(document).on("mouseover",".myemp",function(){
			$(this).addClass("empcss");
		});
		
		$(document).on("mouseout",".myemp",function(){
			$(this).removeClass("empcss");
		});
		
		
		// 특정 사원에 대한 정보를 조회하고자 한다.
		$(document).on("click",".myemp",function(){
			var email = $(this).find(".email").text();
		//	alert(email);
			func_empDetail(email);
		});
		
	});// end of $(document).ready()----------------------
	
	
	function func_imgList() {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/jsontestImage.up",
			dataType:"json",
		//	async:false,   // 동기처리
		    success: function(json) { // 콜백함수 
		    	
		    	var html = "<div id='myCarousel' class='carousel slide' data-ride='carousel'>";
		    	
		    	<%-- Indicators --%>
		    	    html += "<ol class='carousel-indicators'>";
		    	    
		    	    for(var i=0; i<json.length; i++) {
		    	    	if(i==0) {
		    	    		html += "<li data-target='#myCarousel' data-slide-to='"+i+"' class='active'></li>"; 
		    	    	}
		    	    	else {
		    	    		html += "<li data-target='#myCarousel' data-slide-to='"+i+"'></li>";
		    	    	}
		    	    }// end of for---------------------------
		    	
		    	    html += "</ol>";
		    	
		    	    <%-- Wrapper for slides --%>
		    	    html += "<div class='carousel-inner'>";
		    	    
		    	    $.each(json, function(index, item){  // 반복문
		    	    	if(index == 0) {
		    	    		html += "<div class='item active'>";
		    	    		html +=    "<img src='/MyMVC/images/"+item.IMGFILENAME+"' style='width:100%;'>"; 
		    	    		html += "</div>";
		    	    	}
		    	    	else {
		    	    		html += "<div class='item'>";
		    	    		html +=    "<img src='/MyMVC/images/"+item.IMGFILENAME+"' style='width:100%;'>"; 
		    	    		html += "</div>";
		    	    	}
		    	    });
		    	    
		    	    html += "</div>";
		    	    
		    	    <%-- Left and right controls --%>
		    	    html += "<a class='left carousel-control' href='#myCarousel' data-slide='prev'>";
		    	    html +=    "<span class='glyphicon glyphicon-chevron-left'></span>";
		    	    html +=    "<span class='sr-only'>Previous</span>";
		    	    html += "</a>";
		    	    html += "<a class='right carousel-control' href='#myCarousel' data-slide='next'>";
		    	    html +=    "<span class='glyphicon glyphicon-chevron-right'></span>";
		    	    html +=    "<span class='sr-only'>Next</span>";
		    	    html += "</a>";
		    	    
		    	    html += "</div>";
		    	
		    	$("#imgList").html(html);
		    },
		    error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_imgList()---------------------
	
	
	function func_newsTitleList() {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/jsontestNewsTitle.up",
			dataType:"json",
			success:function(json){ // 콜백함수 
				
			    var html = "<table id='newstbl'>";
			    	html += "<tr>";
			    	html +=    "<th>기사연번</th>";
			    	html +=    "<th>기사제목</th>";
			    	html +=    "<th>입력일자</th>";
			    	html += "</tr>";
			    	
			    	$.each(json, function(index,item){ // 반복문
			    		if(index == 0) {
			    			func_newsContents(item.seqtitleno);
			    		}
			    		html += "<tr class='mynews'>";
			    		html +=    "<td class='seqno'>"+ item.seqtitleno +"</td>";
			    		html +=    "<td>"+ item.title +"</td>";
			    		html +=    "<td>"+ item.registerday +"</td>";
			    		html += "</tr>";
			    	});
			    
			        html += "</table>";
			    
			    $("#newsTitleList").html(html);
			
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_newsTitleList()---------------------

	
	function func_newsContents(seqno) {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/jsontestNewsContents.up",
			type:"get", // 생략하면 get 임. type:"post",
			data:{"seqno":seqno},
			dataType:"json",
			success:function(json){
				var html = json.newscontents;
				$("#newsContent").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_newsContents(seqno)------------------
	
	
	function func_empList() {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/gsontestEmpList.up",
			dataType:"json",
			success:function(json) { // 콜백함수 
				
				var html = "<table id='emptbl'>";
			    	html += "<tr>";
			    	html +=    "<th>사원명</th>";
			    	html +=    "<th>직위</th>";
			    	html +=    "<th>연락처</th>";
			    	html +=    "<th>email</th>";
			    	html += "</tr>";
			    	
			    	$.each(json, function(index, item){ // 반복문 
			    		
			    		if(index == 0) {
			    			func_empDetail(item.email);
			    		}
			    		
			    		html += "<tr class='myemp'>";
			    		html +=     "<td>"+ item.ename +"</td>";
			    		html +=     "<td>"+ item.jik +"</td>";
			    		html +=     "<td>"+ item.tel +"</td>";
			    		html +=     "<td class='email'>"+ item.email +"</td>";
			    		html += "</tr>";
			    	});
			    	
			    	html += "</table>";
			    	
			    $("#employeeList").html(html);	
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_empList()-----------------------------
	
	
	function func_empDetail(email) {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/gsontestEmpDetail.up",
		//	type:"get",
			data:{"email":email},
			dataType:"json",
			success:function(json){
				var html = "<ol>"+
				             "<li><span class='empspan'>사원명</span>"+json.ename+"</li>"+
				             "<li><span class='empspan'>직급</span>"+json.jik+"</li>"+
				             "<li><span class='empspan'>연락처</span>"+json.tel+"</li>"+
				             "<li><span class='empspan'>email</span>"+json.email+"</li>"+
				             "<li><span class='empspan'>생년월일</span>"+json.birthday+"</li>"+
				             "<li><span class='empspan'>현재나이</span>"+json.age+"세</li>"+
				           "</ol>";
				           
				 $("#employeeDetail").html(html);          
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
		
	}// end of function func_empDetail(email)---------------------
	
</script>

</head>

<body>
	<div id="mycontainer">
		<h3>여기는 URL이 /MyMVC/ajaxstudy/jsontestMain.up 인 페이지 입니다.</h3>
		<div id="imgList"></div>
	    <div id="newsTitleList"></div>
	    <div id="newsContent"></div>
	    <div id="newsWrite">
	    	<form>
	    		<ul>
	    			<li>
	    				<label>기사제목</label>
	    				<input type="text" id="title" size="30" />
	    			</li>
	    			<li>
	    				<label>기사내용</label>
	    				<textarea rows="5" cols="40" id="newscontents"></textarea>
	    			</li>
	    		</ul>
	    		<button type="button" id="btnSubmit">전송</button>
	    		<button type="reset">취소</button>
	    	</form>
	    </div>
	    
	    <div id="employeeList"></div>
	    <div id="employeeDetail"></div>
	    <div id="employeeWrite">
	    	<form name="empFrm">
	    		<table id="employeeTbl">
	    			<tr>
	    				<th colspan="2">신규사원 정보입력</th>
	    			</tr>
	    			<tr>
	    				<td>사원명</td>
	    				<td><input type="text" id="ename"/></td>
	    			</tr>
	    			<tr>
	    				<td>직위</td>
	    				<td>
	    					<select id="jik">
	    						<option>사원</option>
	    						<option>대리</option>
	    						<option>과장</option>
	    						<option>부장</option>
	    						<option>이사</option>
	    						<option>사장</option>
	    					</select>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>연락처</td>
	    				<td><input type="text" id="tel" placeholder="예: 01023456789"/></td>
	    			</tr>
	    			<tr>
	    				<td>email</td>
	    				<td style="width:80%;">
	    					<input type="email" id="email"/>
	    					<span id="emailDuplicateCheck">email중복검사</span>
	    					<br/><span id="emailResult"></span>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>생년월일</td>
	    				<td><input type="text" id="birthday" placeholder="예: 19941019" /></td>
	    			</tr>
	    			<tr>
	    				<td colspan="2">
	    					<button type="button" id="btnEmpSubmit">입력</button>
	    					<button type="reset">취소</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	    </div>
    </div>
</body>
</html>



