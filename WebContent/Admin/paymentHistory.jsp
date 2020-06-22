<%@page import="com.beans.PaymentBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.Smpp_DaoImpl"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="common.database.DbConnection"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../paymentStyle.css">
<script defer src="../js/fontawesome-all.js"></script>
<link href="../dist/css/style.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	  <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript"> 
      $(document).ready( function() {
        /* $('#deletesuccess').delay(1000).fadeOut(); */
       /*  $('#deletesuccess').delay(5000).hide(0); */ 
        $('#deletesuccess').delay(10000).hide(2000); 
      });
    </script>
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

Logger logger = Logger.getLogger("paymentHistory.jsp");

String redirect_url="paymentHistory?clr=appLanguages&act=appLanguages1";
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
%>

	<div id="wrapper">

		<%@ include file="header.jsp"%>
		<%@ include file="sidebar.jsp"%>
		<%-- <%@ include file="reciveCallPanel.jsp"%> --%>
		<!-- Navigation -->


		<div id="page-wrapper">
			<div class="pad-20"></div>
			<div class="row">

				<%
             Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
				 if(request.getParameter("message")==null){
				    	logger.info("message=>00000000000");
				    }else{
				    	String message = request.getParameter("message").toString();
				    	logger.info("message=>"+message);
				    	if(message.equals("1")){
				    		%>
				    			<div id="deletesuccess">
									<h6 style="color: green">Delete Payment Successfully</h6>
								</div>
				    		<%
				    	}else if(message.equals("0")){
				    		%>
							<div id="deletesuccess">
								<h6 style="color: red">Failed!</h6>
							</div>
						<%
							}else if(message.equals("2")){
								%>
								<div id="deletesuccess">
									<h6 style="color: green">Added Payment Successfully</h6>
								</div>
							<%
						}else if(message.equals("4")){
					    		%>
								<div id="deletesuccess">
									<h6 style="color: green">Updated Payment Successfully</h6>
								</div>
							<%
								}
				    } %>


				<section class="row sea"> <section class="col-md-12">
				<a href="#">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal">Add Payment</button>
				</a> 
				 
				</section> <!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add Payment</h4>

							</div>
							<div class="modal-body">
								<form class="form-horizontal" name="frm" method="post" action="PaymentByAdmin">
									<fieldset class="fieldset">
									<div class="form-group">
											<label class="col-md-12 col-sm-3 col-xs-12 ">Name</label>
											<div class="col-md-12 col-sm-9 col-xs-12">
													<select class="form-control" name="name" id="name">
														<option value="0">Please select name</option>
														<option value="tyrodigital">tyrodigital</option>
														<option value="tyro_t">tyro_t</option>
														<option value="tyro_t2">tyro_t2</option>
													</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-12 col-sm-3 col-xs-12 ">Transfer Date </label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<div class="input-group date form_datetime col-md-12" data-date="2020-05-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
								                    <input class="form-control" size="16" type="text" value="" readonly name="transfer_date">
								                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
													<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
								                </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-12 col-sm-3 col-xs-12 ">Credit Transfer </label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<input type="text" class="form-control" value="" id="credit_transfer"
													name="credit_transfer">
											</div>
										</div>

										<div class="form-group">
											<input type="hidden" id="productbyId" name="productbyId"
												value="10"> <label
												class="col-md-12 col-sm-3 col-xs-12 ">Transffered By</label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<input type="text" class="form-control" value="" id="transffered_by"
													name="transffered_by">
											</div>
										</div>
										<div class="form-group">
										 <label class="col-md-12 col-sm-3 col-xs-12 ">Payment-Ref</label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<input type="text" class="form-control" value="" id="payment_ref"
													name="payment_ref">
											</div>
										</div>
										<div class="form-group">
										 <label class="col-md-12 col-sm-3 col-xs-12 ">Credits Before(INR)</label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<input type="text" class="form-control" value="" id="credit_before"
													name="credit_before">
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-12 col-sm-3 col-xs-12 ">Credits After (INR)</label>
											<div class="col-md-12 col-sm-9 col-xs-12">
												<input type="text" class="form-control" value=""
													id="credit_after" name="credit_after">
											</div>
										</div>
										
										
									</fieldset>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<input type="submit" value="SAVE" class="btn btn-primary">

									</div>
								</form>
							</div>

						</div>

					</div>
				</div>

				</section>
			</div>
			<!-- /.row -->
			<div id="search" class="tab-pane fade in active">
				<div class="row sea">
					<section class="search-tab">
					<div class="col-sm-6">
						<div id="imaginary_container">
							<form>
							<input type="hidden" name="clr" value="appLanguages">
							<input type="hidden" name="act" value="appLanguages1">
								<div class="input-group stylish-input-group">
									<%
                	if (searchValue.equalsIgnoreCase("0")) {
                		logger.info("searchValue.equalsIgnoreCas");
                %>
									<input type="text" id="myInput" name="searchValue"
										class="form-control" onkeyup="myFunction()"
										placeholder="Search...">
									<%
	} else {
		logger.info("searchValue.equalsIgnoreCas+++else");
%>
									<input type="text" id="myInput" name="searchValue"
										class="form-control" onkeyup="myFunction()"
										value="<%=searchValue%>">
									<%                    } %>

									<span class="input-group-addon">
										<button class="input-group-addon"
											style="padding: 0px 12px; border: none;">
											<i class="fa fa-search" aria-hidden="true"></i>
										</button>

									</span>
								</div>
							</form>
						</div>
					</div>
					</section>
					<%@ include file="orderByCode.jsp"%>
				</div>
				<!--main content start-->
				<table id="myTable" class="table table-striped table-bordered"
					width="100%" cellspacing="0">
					<tr>
				      <th>Name</th>
				      <th>Transfer Date</th>
				      <th>Credit Transfer</th>
				      <th>Transffered By</th>
				      <th>Payment-Ref</th>
				      <th>Credits Before(INR)</th>
				      <th>Credits After (INR)</th>
				    </tr>

					<%
    try
    {
                    ArrayList<PaymentBeans> paymentBeans=new ArrayList<PaymentBeans>();
                    if(searchValue.equalsIgnoreCase("0")){
                    	String sql="select  * from payment order by id desc limit "+page1+","+order2+"";
                    	paymentBeans=daoImpl.getPaymentHistory(sql);
                    }else{
                    	String sql="select  * from payment where  name  LIKE '"+searchValue+"%' order by id desc limit "+page1+","+order2+"";
                    	paymentBeans=daoImpl.getPaymentHistory(sql);
                    }
                    
   %>


					 <%for(int i=0;i<paymentBeans.size();i++){
			    	PaymentBeans paymentBean=paymentBeans.get(i);
			    	%>
			    		<tr>
					      <td><%=paymentBean.getName() %></td>
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
                    	sqlcount="select count(*) FROM payment";
                    	daoImpl.fetchAllDataCount(sqlcount, jsonObject);
                    }else{
                    	logger.info("searchValue.equalsIgnoreCas+++else");
                    	sqlcount="select count(*) FROM payment  where  name  LIKE '"+searchValue+"%'";
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

				<%@ include file="paginationCode.jsp"%>



			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="../vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Morris Charts JavaScript -->
		<script src="../vendor/raphael/raphael.min.js"></script>
		<script src="../vendor/morrisjs/morris.min.js"></script>
		<script src="../data/morris-data.js"></script>



		<script src="../dist/js/sb-admin-2.js"></script>
		<script type="text/javascript">
			function setUserName() {
				var name=document.getElementById("name").value;
				name=name.replace(/\s/g,'');
				document.getElementById("username").value=name;
			}
			function setUserNameU(id) {
				var name=document.getElementById("Uname"+id).value;
				name=name.replace(/\s/g,'');
				document.getElementById("Uusername"+id).value=name;
			}
		</script>
		<script>
      $(function() {
        $(".knob").knob({
          'draw': function() {
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
        $("#owl-slider").owlCarousel({
          navigation: true,
          slideSpeed: 300,
          paginationSpeed: 400,
          singleItem: true

        });
      });

      //custom select box

      $(function() {
        $('select.styled').customSelect();
      });

					   </script>
		<script>
		$(".progress-bar").loading();
		$('input').on('click', function () {
			 $(".progress-bar").loading();
		});
	</script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="../js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
// show only date = minView: 2,
    $('.form_datetime').datetimepicker({
        //language:  'fr',
    	format: "yyyy-mm-d hh:ii:ss",
    	 weekStart: 1,
         todayBtn:  1,
 		autoclose: 1,
 		todayHighlight: 1,
 		startView: 2,
 		forceParse: 0,
         showMeridian: 1,
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
       
    }).datetimepicker('update', new Date());
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
	

		<!-- <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
	  td = tr[i].getElementsByTagName("td")[0];
	    td1 = tr[i].getElementsByTagName("td")[1];
	    td2 = tr[i].getElementsByTagName("td")[2];
	    td3 = tr[i].getElementsByTagName("td")[3];
	    td4 = tr[i].getElementsByTagName("td")[4];
	    td5 = tr[i].getElementsByTagName("td")[5];
	    td6 = tr[i].getElementsByTagName("td")[6];
	    
	    if (td) {
	      if ((td1.innerHTML.toUpperCase().indexOf(filter) > -1) || (td.innerHTML.toUpperCase().indexOf(filter) > -1) || (td2.innerHTML.toUpperCase().indexOf(filter) > -1) || (td3.innerHTML.toUpperCase().indexOf(filter) > -1) || (td4.innerHTML.toUpperCase().indexOf(filter) > -1) || (td5.innerHTML.toUpperCase().indexOf(filter) > -1) || (td6.innerHTML.toUpperCase().indexOf(filter) > -1)) {
	        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }    
  }
}
</script> -->
</body>
</html>