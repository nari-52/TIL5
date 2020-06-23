<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp" />
    
<style type="text/css">
	
	div.notice_write {
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

	/* ---------------------------- 헤더 끝 -------------------------- */
	
	table {
		width: 100%;
		border-collapse: collapse;
	}
	
	thead > tr > th {
		font-size: 20px;
	    font-weight: bold;
	    color: #222222;
	    text-align: left;
	    padding: 17px 20px 34px 20px;
	    border-top: 1px solid #333333;
	    border-bottom: 1px solid #333333;
	}
	
	input.input_title {
		height: 30px;
	}
	
	label.notice_write_title {
		padding-top: 15px;
	}
	
	
	tbody > tr >td {
		font-size: 20px;
	    font-weight: bold;
	    color: #222222;
	    text-align: left;
	    padding: 17px 14px;
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
	
	a.notice_write {
		display: inline-block;
	    font-size: 14px;
	    color: #fff;
	    font-weight: bold;
	    text-align: center;
	    height: 45px;
	    line-height: 45px;
	    width: 100%;
	    text-decoration: none;
	}
	
	a.delete {
		cursor: pointer;
	}

	.next_post {
		font-size: 14px;
	    color: #666666;
	    font-weight: normal;
		border-top: 1px solid #333333;
		border-bottom: 1px solid #dddddd;
	}
	
	.pre_post {
		font-size: 14px;
	    color: #666666;
	    font-weight: normal;
		border-bottom: 1px solid #333333;
	}
	
	.th {
		background: #f4f4f2;
		font-size: 16px;
	    font-weight: bold;
	    color: #222222;
	}

</style>

	<div class="notice_write">
		<header>
			<div id="sub_header">
				<h2>
					<img src="/StarbucksWeb/images/nari/notice_title.jpg" alt="공지사항" />
				</h2>
			</div>
		</header>
		
		<!-- -------------------------------- 헤더 끝 ---------------------------------- -->
		
		<section>

			<table>
				<thead>
					 <tr>
					 	<th>
						 	<label class="notice_write_title" >제목</label>
							<input type="text" size="98" class="input_title"/>
						</th>
					 </tr>
				</thead>
				
				<tbody>
					<tr>
						<td>
							&nbsp;<label style="vertical-align: top;">내용</label>
							<textarea rows="20" cols="100"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
	
			
			<div id="notice_button_wrap">
				<p id="notice_button">
					<a onclick="alert('작성')" class="notice_write">작성</a>
				</p>
				<p id="notice_button">
					<a type="reset" class="delete notice_write" onclick="alert('취소')">취소</a>
				</p>
			</div>
			
			<div>
				<table>
					<tr>
						<th class="next_post th" >윗글</th>
						<td class="next_post">BC카드 ISP/페이북 시스템 점검 안내</td>
					</tr>
					<tr>
						<th class="pre_post th">아랫글</th>
						<td class="pre_post">스타벅스 앱 내 e-Coupon / Gift Shop의 e-Gift Item 수량 표기 미노출 안내</td>
					</tr>
				</table>
			</div>
			<br/><br/><br/>
		</section>

	</div>
	
<jsp:include page="../footer.jsp" />