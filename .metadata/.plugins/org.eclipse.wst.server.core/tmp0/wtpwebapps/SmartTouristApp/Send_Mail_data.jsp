<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="DB_user_ins_del.Profile"%>
<%@page import="Bean.UserBean"%>
<%@page import="Mail.MailForgotPass"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMART CITY APP</title>
</head>
<body>
<%
UserBean ubPASS=new UserBean();
ubPASS.setUsername(request.getParameter("uname"));
Profile p1=new Profile();
String s_check=p1.searchUSER(ubPASS);
if(s_check=="success")	
{
%>
	<h1>
		CHECK YOUR EMAIL AND LOGIN AGAIN
		<a href="Front.html">BACK TO LOGIN PAGE</a>
	</h1>	
<%
}
else
{
	%>
	<h1>
		<a href ="Forget_pas_SmartAPP.html">INVALID EMAIL PROVIDED PLEASE TRY AGAIN</a>
	</h1>
	<%
}
%>


</body>
</html>