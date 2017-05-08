<%@ page import="Assign4.Item,java.util.ArrayList" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myjsp" %>

<table class=center width="70%">
	<myjsp:errorMessage></myjsp:errorMessage>
	<tr>
		<td colspan=2 align=center>
			<table id=itemList class="center" cellspacing="0">
				<thead>
					<tr>
						<th style="text-align:left;width:150px">Actions</th>
						<th style="text-align:left;width:200px;">Item Name</th>
						<th style="text-align:right;width:80px;">Quantity</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="row" items="${allItems}">
					<tr>
						<td>
							<a href="viewitem?id=${row.id}">View</a>
							<a href="edititem?id=${row.id}">Edit</a>
							<a href="deleteitem?id=${row.id}">Del</a>
						</td>
						<td>${row.name}</td>
						<td style="text-align:right;">${row.qty}</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
		
		</td>
	</tr>
	<tr><td colspan=2><a href=additem>Add New Item</a></td></tr>
</table>
