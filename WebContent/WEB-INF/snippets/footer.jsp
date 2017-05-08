<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${theDate!=null}">
	<div>Sheridan College of Tech - Completed by Maurice Soulliere - <fmt:formatDate pattern="MMM dd, yyyy" value="${theDate}" /></div>
</c:if>
