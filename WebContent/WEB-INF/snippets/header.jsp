<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>PROG32758 - MVC - Item Management Application</h2>
<h3>Assignment 4</h3>
<table class=center width="70%">
	<tr>
	<c:if test="${name!=null}">
		<td align=left><mtld:tldWelcome color="blue">Welcome TLD: ${ name }</mtld:tldWelcome></td>
		<td align=right><a href="editaccount">Edit Account</a> <a href="logout">LogOut</a></td>
	</c:if>
	</tr>
</table>

