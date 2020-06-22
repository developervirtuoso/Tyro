<%@page import="org.json.JSONObject"%>
<%@page import="com.dao.Smpp_DaoImpl"%>
<%@page import="com.beans.PaymentBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="paymentStyle.css">
<link href="dist/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  	.pagination {
    background: #ffffff !important ;
}
  </style>
</head>
<body>
<%!static int count=0;
String fromdate="";
String todate="";
int order2=0;
int page1=0;
int pre=0;
int next=0;
int total_rows=0;
int page_count=0;
int pading_count=0;

String searchValue=null;

Logger logger = Logger.getLogger("showPaymentBySms.jsp");


%>

	<% 

if(request.getParameter("searchValue") != null && !request.getParameter("searchValue").isEmpty()){
	searchValue=request.getParameter("searchValue");
logger.info("searchValue=>>"+searchValue);
searchValue =  searchValue.replaceAll("'", "''");
logger.info("searchValue=>>"+searchValue);
}else{
	searchValue="0";
	logger.info("searchValue=>>"+searchValue);
}
	String name="";
	if(request.getParameter("name") != null && !request.getParameter("name").isEmpty()){
		name=request.getParameter("name");
	}else{
		name="0";
		
	}
	String redirect_url="showPaymentBySms?clr=appLanguages&act=appLanguages1&name="+name+"";	
		
%>

<div class="container">
<div style="overflow-x:auto;">
<div class="col-sm-6"></div>
<%@ include file="orderByCode.jsp"%>
<div class="balance">
<span style="display: none;" >Balance:INR944058.000000</span>
</div>
<table id="myTable" class="table table-striped table-bordered"
					width="100%" cellspacing="0">
					<tr>
				      <th>Transfer Date</th>
				      <th>Credit Transfer</th>
				      <th>Transffered By</th>
				      <th>Payment-Ref</th>
				      <th>Credits Before(INR)</th>
				      <th>Credits After (INR)</th>
				    </tr>

					<%
					Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
    try
    {
                    ArrayList<PaymentBeans> paymentBeans=new ArrayList<PaymentBeans>();
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="select  * from payment where name ='"+name+"' order by id desc limit "+page1+","+order2+"";
                    	paymentBeans=daoImpl.getPaymentHistory(sql);
                    }else{
                    	String sql="select  * from payment where name ='"+name+"' and transfer_date  LIKE '"+searchValue+"%' order by id desc limit "+page1+","+order2+"";
                    	paymentBeans=daoImpl.getPaymentHistory(sql);
                    }
                    
   %>


					 <%for(int i=0;i<paymentBeans.size();i++){
			    	PaymentBeans paymentBean=paymentBeans.get(i);
			    	%>
			    		<tr>
					      <td><%=paymentBean.getTransfer_date() %></td>
					      <td><%=paymentBean.getCredit_transfer() %></td>
					      <td><%=paymentBean.getTransffered_by() %></td>
					      <td><%=paymentBean.getPayment_ref() %></td>
					      <td><%=paymentBean.getCredit_before() %></td>
					      <td><%=paymentBean.getCredit_after() %></td>
					    </tr>
			    	<%
			    } %>
					<%
		   
                    
               }
               catch(Exception e)
               {
                    e.printStackTrace();
               }
	   %>
				</table>
				<%
 try
    {
                    JSONObject jsonObject =new JSONObject();
                    String sqlcount="";
                    if(searchValue.equalsIgnoreCase("0")){
                    	logger.info("searchValue.equalsIgnoreCas");
                    	sqlcount="select count(*) FROM payment where name ='"+name+"'";
                    	daoImpl.fetchAllDataCount(sqlcount, jsonObject);
                    }else{
                    	logger.info("searchValue.equalsIgnoreCas+++else");
                    	sqlcount="select count(*) FROM payment  where name ='"+name+"' and transfer_date  LIKE '"+searchValue+"%'";
                    	daoImpl.fetchAllDataCount(sqlcount, jsonObject);
                    }
                   
                    	double count1=jsonObject.getInt("count");
                    	total_rows=jsonObject.getInt("count");
                    	logger.info("count1=>>"+count1);
                    	logger.info("total_rows=>>"+total_rows);
                    	count1=count1/order2;
                    	logger.info("count1=>>"+count1);
                    	count1=Math.ceil(count1);
                    	logger.info("count1=>>"+count1);
                    	page_count=(int)count1;
                    	logger.info("page_count=>>"+page_count);
                    
                    
                    
                    
    }catch(Exception e){
    	e.printStackTrace();
    }finally
      	     {}%>
 
  <div class="pagination">
   <%@ include file="paginationCode.jsp"%>
 
</div>

</div>
</div>
</body>
</html>