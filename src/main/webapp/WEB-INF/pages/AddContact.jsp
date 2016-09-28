<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Contact</title>
</head>
<body>
		<center><h3>Welcome to Add Contact Page</h3></center><br><br>
		<div align="center">
		<form:form commandName="contact" action="AddContacts.view">
		<table>
			<tr><td>First Name</td><td><form:input path="firstName"/></td></tr>
			<tr><td>Last Name</td><td><form:input path="lastName" /></td></tr>
			<tr><td>Mobile Number</td><td><form:input path="mobileNumber"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="Add Contact"></td></tr>
		</table>
		</form:form><br><br>
			<c:if test="${status=='Contact has been added' }">Contact has been added</c:if>
			<c:if test="${status=='Contact has not been added' }">Contact has not been added</c:if>
		</div>
</body>
</html>