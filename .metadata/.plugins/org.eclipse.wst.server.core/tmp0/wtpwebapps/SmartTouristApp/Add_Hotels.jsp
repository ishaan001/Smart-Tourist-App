<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="DB_Hotel_ins_del.A_hotel_DB" %>
<%@page import="HotelBean.AddHotel" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMART CITY APP</title>
</head>
<body>
	<%
		AddHotel ah=new AddHotel();
		ah.setHotelid(request.getParameter("hotelid"));
		ah.setHotelname(request.getParameter("hotelname"));
		ah.setRent(request.getParameter("rent"));
		ah.setAddress(request.getParameter("address"));
		ah.setCity(request.getParameter("city"));
		ah.setState(request.getParameter("state"));
		ah.setCountry(request.getParameter("country"));
		long pn=Long.parseLong(request.getParameter("pn"));
		ah.setPn(pn);
		ah.setEmail(request.getParameter("email"));
		int pin=Integer.parseInt(request.getParameter("pin"));
		ah.setPin(pin);
		
		//A_hotel_DB ahd=new A_hotel_DB();
		String s=A_hotel_DB.AddHotelInDB(ah);
		if(s.equals("success"))
		{
						out.println("<h1> HOTEL ADDED SUCCESSFULLY");
		}
		else
		{
						out.println("<h1>ERROR FOUND");
		}
	
	
	%>
	

</body>
</html>