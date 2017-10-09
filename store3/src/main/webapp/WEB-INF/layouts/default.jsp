<%-- 
    Document   : default.jsp
    Created on : Oct 8, 2017, 4:35:32 PM
    Author     : NoName <NoName at example.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:message code="application_title" var="applicationTitle" />

<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8">
	<spring:theme code="styleSheet" var="app_css" />
	<spring:url value="/${app_css}" var="app_css_url" />
	<link rel="stylesheet" href="${app_css_url}">
	<spring:url value="/resources/scripts/script.js" var="script_url"/>
	<spring:url value="/" var="applicationUrl"/>
	<script src="${script_url}"><jsp:text/></script>
	<c:set var="userLocale">
            <c:set var="plocale">${pageContext.response.locale}</c:set>
            <c:out value="${fn:replace(plocale, '_', '-')}" default="en" />
	</c:set>
	<title>${applicationTitle}</title>
    </head>
    <body>
	<div id="main">
            <tiles:insertAttribute name="body"/>
	</div>
    </body>
</html>
