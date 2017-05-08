<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<h2>View Item</h2>
	<table class=center width="70%">
		<myjsp:errorMessage></myjsp:errorMessage>
		<tr>
			<td style="text-align:right;">Item name:</td>
			<td align=left>${itemName}</td>
		</tr>
		<tr>
			<td style="text-align:right;">Quantity:</td>
			<td align=left>${quantity}</td>
		</tr>
		<tr>
			<td colspan=2 style='text-align: center'><a href="home?msg=Done viewing the item">Done</a></td>
		</tr>
	</table>

