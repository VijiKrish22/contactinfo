<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Contacts</title>
</head>
<body>
		<center><h3>Welcome to View Contacts Page</h3></center><br><br>
	<c:if test="${contactList.size()==0}">No Contacts to Display</c:if> 
		<c:if test="${contactList.size()>0}"> 
			<table border="1">
				<tr><th>First Name</th><th>Last Name</th><th>Mobile Number</th></tr>
				<tr><c:forEach items="${contactList}" var="contact">
				<tr><td><c:out value="${contact.getFirstName()}"></c:out></td>
				 <td><c:out value="${contact.getLastName()}"></c:out></td>
				<td><c:out value="${contact.getMobileNumber()}"></c:out></td></c:forEach></tr>			
			</table>
		 </c:if> 
</body>
</html>