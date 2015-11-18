<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSP page Directive --%>
<%@ page import="java.util.*, lwt.lab.utils.*, lwt.lab.utils.CookieUtilities"%>
<%-- JSP Declaration --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex1</title>
</head>
<body>
	<%!private String randomID() {
	int num = (int) (Math.random() * 10000000.0);
	return ("id" + num);
    }

    private final String NO_VALUE = "<I>No Value</I>";%>
	<%-- JSP Scriptlet --%>
	<%
	    String oldID = CookieUtilities.getCookieValue(request, "userID", NO_VALUE);
	    if (oldID.equals(NO_VALUE)) {
			String newID = randomID();
			Cookie cookie = new LongLivedCookie("userID", newID);
			response.addCookie(cookie);
	    }
	%>
	<%-- JSP Expressions --%>
	Pagina a fost accesata la
	<%=new Date()%>
	cu un cookie
	<%=oldID%>.
</body>
</html>