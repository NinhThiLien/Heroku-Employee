<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
	<link rel="stylesheet" href="<c:url value="/resources/css/employees.css"></c:url>">
	<link rel="stylesheet" href="<c:url value="/resources/css/tooltipster.css"></c:url>">
	<script src="<c:url value="/resources/js/tooltipster.js" />"></script>
	<script src="<c:url value="/resources/js/classic.js" />"></script>
	<script src="<c:url value="/resources/js/employees.js" />"></script>	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<br/>
	<div style="display:inline">
		<tiles:insertAttribute name="body" />
	</div>
	<br/><br/>
	<tiles:insertAttribute name="footer" />
</body>
</html>