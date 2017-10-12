<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="DB_user_ins_del.Profile"%>
<%@page import="Bean.UserBean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMART CITY APP</title>
</head>
<body>
<%
	UserBean ub5=new UserBean();
	ub5.setUsername(request.getParameter("uname"));
	ub5.setPass(request.getParameter("pass"));
	Profile p5=new Profile();
	String wait=p5.ReDirect(ub5);
	if(wait.equals("User"))
	{
		response.sendRedirect("index.html");
	}
	else if(wait.equals("Admin"))
	{
		response.sendRedirect("index_admin.html");
	}
	else if(wait.equals("Business Partner"))
	{
		response.sendRedirect("Hotel_BusinessPartner.html");
	}
	else
	{
		out.print("<h1>INVALID DETAILS PROVIDED");	
	}
	
	
%>
</body>
</html>