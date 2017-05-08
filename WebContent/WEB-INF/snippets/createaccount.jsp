<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myjsp" %>

<form method=post>
	<h2>Create an Account</h2>
	<table class="center" width="70%">
		<myjsp:errorMessage></myjsp:errorMessage>
		<tr>
			<td style="text-align:right">Login name:</td>
			<td style="text-align:left"><input type=text value='${lname}' id=lname name=lname></td>
		</tr>
		<tr>
			<td style="text-align:right">Full name:</td>
			<td style="text-align:left"><input type=text value='${fullname}' name=fullname></td>
		</tr>
		<tr>
			<td style="text-align:right">Login password:</td>
			<td style="text-align:left"><input type=password name=lpass1></td>
		</tr>
		<tr>
			<td style="text-align:right">Repeat password:</td>
			<td style="text-align:left"><input type=password name=lpass2></td>
		</tr>
		<tr>
			<td colspan=2 style='text-align:center'><input type=submit name=button value=Create> <input type=submit name=button value=Cancel></td>
		</tr>
	</table>
</form>

