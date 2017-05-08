<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myjsp" %>

<form method=post>
	<h2>Edit Account</h2>
	<table class="center">
		<myjsp:errorMessage></myjsp:errorMessage>
		<tr>
			<td>Login name:</td>
			<td><input type=text value='${ lname }' id=lname name=lname></td>
		</tr>
		<tr>
			<td>Full name:</td>
			<td><input type=text value='${ fullname }' name=fullname></td>
		</tr>
		<tr>
			<td>Login password:</td>
			<td><input type=password name=lpass1></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type=password name=lpass2></td>
		</tr>
		<tr>
			<td colspan=2 style='text-align:center'><input type=submit name=button value=Update> <input type=submit name=button value=Cancel></td>
		</tr>
	</table>
</form>

