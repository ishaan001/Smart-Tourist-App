<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="DB_Hotel_ins_del.A_hotel_DB" %>
<%@page import="HotelBean.AddHotel" %>
<%@page import="Bean.UserBean" %>
<%@page import="DB_user_ins_del.Profile" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	AddHotel ah1=new AddHotel();
	UserBean ub1=new UserBean();
	ah1.setHotelid(request.getParameter("uname"));
	ub1.setPass(request.getParameter("pass"));
	String s=A_hotel_DB.Del_hotelDB(ah1);
	if(s.equals("success"))
	{
		out.println("<h1> HOTEL DELETED SUCCESSFULLY</h1>");
	}
	else
	{
		out.println("<h1>error somewhere</h1>");
	}

%>

</body>
</html>