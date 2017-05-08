<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myjsp" %>
    
<form method="post">
	<table class="center">
		<myjsp:errorMessage></myjsp:errorMessage>
		<tr><td colspan=2><h2>Login Form</h2></td></tr>
		<tr><td align=left>Name:</td><td><input type=text name=lname></td></tr>
		<tr><td align=left>Password:</td><td><input type=password name=password></td></tr>
		<tr><td colspan=2><input type=submit value="Login"></td></tr>
		<tr><td colspan=2><a href="register">Create Account</a></td></tr>
	</table>
</form>