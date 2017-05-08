<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myjsp" %>

<h2>Update Item</h2>
<form method=post>
	<table class=center width="70%">
		<myjsp:errorMessage></myjsp:errorMessage>
		<tr>
			<td>Item name:</td>
			<td align=left><input type=text value="${ itemName }" id=itemname name=itemname></td>
		</tr>
		<tr>
			<td>Quantity:</td>
			<td align=left><input type=text value="${ quantity }" name=quantity></td>
		</tr>
		<tr>
			<td colspan=2 style='text-align: center'><input type=submit name='button' value=Update> <input type=submit name='button' value=Cancel></td>
		</tr>
	</table>
	<input type=hidden name=userid value="${ uid }">
	<input type=hidden name=iid value="${ itemId }">
</form>

