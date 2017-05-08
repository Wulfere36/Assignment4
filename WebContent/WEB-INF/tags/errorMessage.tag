<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr><td colspan=2>

<c:choose>
	<c:when test="${param.msg!=null}">Error tag (param.msg): <span style="color:red">${ param.msg }</span></c:when>
	<c:when test="${msg!=null}">Error tag (msg): <span style="color:red">${msg}</span></c:when>
</c:choose>

</td></tr>
<tr><td>&nbsp;</td></tr>
