<%@page import="com.dao.SmsServiceDao"%>
<%@page import="com.dao.SmsService"%>
<%@page import="com.dao.Smpp_DaoImpl"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.mashape.unirest.http.Unirest"%>
<%@page import="com.mashape.unirest.http.JsonNode"%>
<%@page import="com.mashape.unirest.http.HttpResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body class="bg1">

<header style="background-color: #47b6e0;
    
    padding-top: 20px;">
    <h1 class="sms24">SMS 24 HOURS</h1>
    </header>
<%
int count=1;
long total=0;
Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
SmsService service=new SmsServiceDao();
long tyrodigital=service.getTyrodigital();
String CIW_tyrodigital=daoImpl.convertNumberToWords(tyrodigital);
String total_Str_tyrodigital=daoImpl.numToString(tyrodigital);
long tyro=service.getTyro_t();
String CIW_tyro=daoImpl.convertNumberToWords(tyro);
String total_Str_tyro=daoImpl.numToString(tyro);
long tyro2=service.getTyro_t2();
String CIW_tyro2=daoImpl.convertNumberToWords(tyro2);
String total_Str_tyro2=daoImpl.numToString(tyro2);
	%>
	<table class="table-1">
	<tr>
		<th>Sr.No.</th>
		<th>Account</th>
		<th>Sms Credits</th>
		<th>View</th>
	</tr>
	<tr>
		<td><%=count++%></td>
		<td>tyrodigital </td>
		<td><a href="#" data-toggle="tooltip" title="<%=CIW_tyrodigital%>"><%=total_Str_tyrodigital %></a></td>
		<td><a href="showPaymentBySms?clr=appLanguages&act=appLanguages1&name=tyrodigital" class="btn btn-success"> view</a></td>
	</tr>
	<tr>
		<td><%=count++%></td>
		<td>Tyro_t</td>
		<td><a href="#" data-toggle="tooltip" title="<%=CIW_tyro%>"><%=total_Str_tyro %></a></td>
		<td><a href="showPaymentBySms?clr=appLanguages&act=appLanguages1&name=tyro_t" class="btn btn-success"> view</a></td>
	</tr>
	<tr>
		<td><%=count++%></td>
		<td>Tyro_t2</td>
		<td><a href="#" data-toggle="tooltip" title="<%=CIW_tyro2%>"><%=total_Str_tyro2 %></a></td>
		<td><a href="showPaymentBySms?clr=appLanguages&act=appLanguages1&name=tyro_t2" class="btn btn-success"> view</a></td>
	</tr>
		
		<% 



	try{
		total=tyrodigital+tyro+tyro2;
		String CIW=daoImpl.convertNumberToWords(total);
		String total_Str=daoImpl.numToString(total);
		%>
		<tr>
				<td colspan="2">Total</td>
				<td><a href="#" data-toggle="tooltip" title="<%=CIW%>"><%=total_Str %></a></td>
				
				</tr>
				<%
	}catch(Exception e){
		e.printStackTrace();
	}
 %>
	</table>
	
	<style>
	
	tr th {
    border: 1px solid #ccc;
    padding: 10px 20px;
}
td {
    border: 1px solid #ccc;
    padding: 10px 20px;
}
.table-1 {
    margin: 60px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
}
.bg1 {
    background-color: #ececec;
}
.sms24 {
    text-align: center;
    padding-top: 0;
    color: #fff;
    padding-bottom: 40px;
}
	</style>
</body>
</html>