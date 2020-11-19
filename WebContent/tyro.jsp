<%@page import="com.beans.ShowTyroBean"%>
<%@page import="java.util.List"%>
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
<%!
String email=null;
String adminType=null;
String auth_key="";
String name="";
int id=0;
%>
<body class="bg1">

<header style="background-color: #47b6e0;
    
    padding-top: 20px;">
    <h1 class="sms24">SMS 24 HOURS</h1>
    </header>
<%
if (session.getAttribute("user_name") != null) { 
	 
	name = session.getAttribute("user_name").toString();
	id=(Integer)session.getAttribute("user_id");
int count=0;
long total=0;
Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
List<ShowTyroBean> list=daoImpl.getShowTyroBeans();


	%>
	<table class="table-1">
	<tr>
		<th>Sr.No.</th>
		<th>Account</th>
		<th>Sms Credits</th>
		<th>View</th>
		<th>Transfer</th>
	</tr>
	<%
		for(ShowTyroBean showTyroBean:list){
			total=total+showTyroBean.getCredit();
			%>
				<tr>
				<td><%=++count%></td>
				<td><%=showTyroBean.getShowName() %> </td>
				<td><a href="#" data-toggle="tooltip" title="<%=showTyroBean.getCiwValue()%>"><%=showTyroBean.getCredit() %></a></td>
				<td><a href="showPaymentBySms?clr=appLanguages&act=appLanguages1&name=<%=showTyroBean.getName() %>" class="btn btn-success"> view</a></td>
				<td> <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal<%=count%>">Transfer</button></td>
			</tr>
			 <!-- Modal -->
			  <div class="modal fade" id="myModal<%=count%>" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Sms Credits : <%=showTyroBean.getCredit() %></h4>
			        </div>
			        <form action="TransferAmount" id="trnsFrom<%=count%>" method="post" >
				        <div class="modal-body">
				         <input name="removeUsername" type="hidden" value="<%=showTyroBean.getName()%>">
				         <div class="form-group">
						    <label for="pwd">Transfer Sms Credits</label>
						    <input type="hidden" name="oldAmount" id="oldAmount<%=count%>" value="<%=showTyroBean.getCredit()%>">
				        	<input type="number" name="amount" id="newAmount<%=count%>" class="form-control" max="<%=showTyroBean.getTotalCiwValue() %>" min="10" required="required"  onkeyup="checkAmount(<%=count%>);">
						 	<span id="tranSpan<%=count%>" style="color: red; display: none;">Sufficient Credits unavailable</span>
						  </div>
						  <div class="form-group">
						    <label for="pwd">Choose User</label>
						    <select name="addUsername" required="required"  class="form-control">
						    	<option value="">Choose User</option>
						    	<%
						    	for(ShowTyroBean showTyroSelect:list){
						    		if(!showTyroBean.getName().equals(showTyroSelect.getName())){
						    			%><option value="<%=showTyroSelect.getName()%>"><%=showTyroSelect.getShowName() %></option><%
						    		}
						    	}
						    	%>
						    </select>
						  </div>
				        </div>
				        <div class="modal-footer">
				        <input type="submit" value="Transfer" id="transfer<%=count%>"  disabled="disabled" class="btn btn-primary">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
			        </form>
			      </div>
			      
			    </div>
			  </div>
			<%
		}
	%>
		
		<% 
	try{
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
<script type="text/javascript">
	function checkAmount(count) {
		var oldAmount=document.getElementById("oldAmount"+count).value;
		var newAmount=document.getElementById("newAmount"+count).value;
		var o = parseInt(oldAmount)
		var n = parseInt(newAmount)
		
		if(n>o){
			document.getElementById("tranSpan"+count).style.display="block";
			document.getElementById("transfer"+count).disabled = true;
		}else{
			document.getElementById("tranSpan"+count).style.display="none";
			document.getElementById("transfer"+count).disabled = false;
		}
		
	}
	
	
</script>

 <%}else { 
                 response.sendRedirect("login");
                 }
                 %> 
     
</html>