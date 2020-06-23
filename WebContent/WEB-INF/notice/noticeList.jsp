<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	// ctxPath = /StarbucksWeb
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp" />

<title>notice_list.sb</title>
<style type="text/css">
	
 	div#container_notice_list {
		width: 60%;
		margin: 0 auto;
	} 

	div#sub_header {
		height: 98px;
		padding-top: 30px;
	}
	
	h2>img {
		vertical-align: top;
		display: inline;
	}
	
	div#search_header {
		
	}
	
	div#search_bar {
		width: 100%;
		height: 76px;
		background-color: #f4f4f2;
		border-radius: 3px;
    	margin-bottom: 40px;
	}
	
	div#search_bar_right {
		float: right;
		margin-right: 5%;
	}

	
	input#search_input {
		margin-top: 20px;
		display: inline;
		width: 321px;
	    height: 36px;
	    line-height: 36px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
	    text-indent: 10px;
	    color: #666;
	}
	
	/* 버튼 타입이라 밑에 그림자 지는게 맘에 안듬 */
	input#search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	    background: #777;
	    border-radius: 3px;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    text-align: center;
	    padding: 0;
	    cursor: pointer;
	}
	
	p.search_button {
		display: inline;
	    width: 54px;
	    height: 38px;
	    line-height: 38px;
	}
		
	
	/* ---------------------------- 헤더 끝 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	 th {
		font-size: 14px;
	    font-weight: bold;
	    color: #222222;
	    text-align: center;
	    padding: 17px 3px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	td {
		font-size: 14px;
	    color: #666666;
	    text-align: center;
	    padding: 17px 0;
	    border-bottom: 1px solid #dddddd;
	    line-height: 1.8;
	
	}
	
	div#notice_button_wrap{
		display: inline-block;
		width: 100%;	
	}
	
	p#notice_button {
		display: inline-block;
		border-radius: 3px;
	    height: 45px;
	    width: 84px;
	    background: #666666;
		color: white;
		float: right;
		margin: 30px 20px 50px 0px;
	}
	
	a.notice_list {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
		cursor: pointer;
	}

</style>

<script type="text/javascript">
	
	$(document).ready(function(){ 
		
		
		 //func_newsTitleList();	

		// 기사 줄 클릭 시 해당 기사를 보여준다.
		$(document).on("click", ".mynews", function(){
			var seqno = $(this).find(".seqno").text();
			// alert(seqno); 클릭하면 해당 기사의 번호를 출력한다.
			func_newsContents(seqno);
			
		}); 
		
		
		// 기사 작성 버튼 클릭 --------------------------------------------------
		$("#btnSubmit").click(function(){ 
			$.ajax({ 
				url: "<%= ctxPath%>/ajaxstudy/jsontestNewsWrite.up",
				type: "post", 
				data: {"title": $("#title").val(), 
					   "newscontents": $("#newscontents").val() },
				success: function(){
					func_newsTitleList();
					$("#title").val("");
					$("#newscontents").val("");
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			 
			});
		});
		
		
		var bIsClickEmailCheck = false; // email 중복검사를 클릭 했는지 알아보기위한 것.

		
		
		
		
		
		
	}); // end of $(document).ready(function()----------------------------
	
	
	function func_newsTitleList() {
		
		$.ajax({ 
			url:"<%= ctxPath%>/ajaxstudy/jsontestNewsTitle.up",
			dataType:"json",
			// async:true,		// 비동기처리 하겠다. (기본셋팅)
			success: function(json) { // 콜백함수
				
				var html = "<table id='newstbl'>";
					html += "<tr>";
					html += 	"<th>기사연번</th>";
					html += 	"<th>기사제목</th>";
					html += 	"<th>입력일자</th>";
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
		
	} // end of func_newsTitleList()-----------------------------------
		
	function func_newsContents(seqno) {
		
		$.ajax({
			url:"<%= ctxPath%>/ajaxstudy/jsontestNewsContents.up",
			type: "get", 	// 생략하면 get
			data: {"seqno":seqno},	// "seqno" getParameter 해오는 값이다.
			dataType: "json",
			success: function(json){
				var html = json.newscontents;
				$("#newsContent").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}			
		});
		
	} // end of function func_newsContents(seqno)----------------------
	
	
	
</script>


	<div id="container_notice_list">
		<header>
			<div id="sub_header">
				<h2>
					<img src="/StarbucksWeb/images/nari/notice_title.jpg" alt="공지사항" />
				</h2>
			</div>
			<div id="search_header">
				<div id="search_bar">
					<div id="search_bar_right">

						<input id="search_input" type="text" placeholder="검색어를 입력해 주세요."/>
						<!-- <a href="http://localhost:9090/JavaScriptStudy/00_semi/index.html" id="search_atag">검색</a> -->
						<input id="search_button" onclick="alert('검색')" type="button" value="검색" /> 
						<!-- <p id="notice_button search_button">
							<a class="search" onclick="alert('검색')">검색</a>
						</p> -->
					</div>
				</div>
			</div>
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->
		
		<section>
			<table>
				<thead>
					 <tr>
					 	<th>NO</th>
					 	<th>제목</th>
					 	<th>날짜</th>
					 	<th>조회수</th>
					 </tr>
				</thead>
				
				<tbody>
					<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td>${notice.notice_seq}</td>
						<td>${notice.title}</td>
						<td>${notice.write_day}</td>
						<td>${notice.hit}</td>
					</tr>
					</c:forEach>
				</tbody>
			
			</table>
			
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a class="write notice_list" href="noticeWrite.sb" >글쓰기</a>
				</p>
			</div>
		
		
		</section>
		
		
		
	</div>


<jsp:include page="../footer.jsp" />