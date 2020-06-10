<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%-- trimDirectiveWhitespaces="true" 을 해줌으로써 웹브라우저에서 소스보기시 공백줄을 제거해주는 것이다. --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<newsTitleList>
	<c:if test="${not empty newsTitleList}">
		<c:forEach var="vo" items="${newsTitleList}">
			<newsTitle>
				<seqtitleno>${vo.seqtitleno}</seqtitleno>
				<jemok>${vo.title}</jemok>>
				<registerday>${vo.registerday}</registerday>
			</newsTitle>
		</c:forEach>
	</c:if>
</newsTitleList>     
