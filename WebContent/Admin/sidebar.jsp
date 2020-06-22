
<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	#page-wrapper{
	transition: margin 0.5s ;
	}
	
	.left{
	width: 250px;
	height: 100%;
	background: #337ab7;
    white-space: nowrap; 
    transition: width 0.5s ;
    position: absolute;
    z-index: 9999; 
}
	.left ul{
		padding: 0;
		list-style-type: none;
		text-align: left;
	}
	.left li {
		width: auto;
		height: 60px;
		line-height: 50px;  
		padding-left: 18px;
	}
	.left li:hover {
		background: black; 
	}
	
	#leaveul li:hover{
		background-color: #337ab7;
	}
	#leaveul{
		background-color: rgba(105, 195, 230, 0.88);
   		color: white;
	}
	  .left:hover {
        width: 250px; 
    }  

		.left .item-menu {
	        height:100%;
	        overflow:hidden;
	        color:#fff;
	    }  
	.left a{
		color: white;
	    text-decoration: none;
	    font-weight: bold;
	} 
	span.menu{
		padding-left: 17px;
	}
	.t_search {
	    color: black;
	    height: 35px;
	    margin-left: 15px;
	    width: 190px
	}
</style>

<script>
    function showonlyone(clr,act) {
    	
if(clr == "" || clr == "null"){
	
	document.getElementById('home').style.backgroundColor = "red";
	document.getElementById('home1').style.color = "#fff";
	
} else if(clr=="dashboard_id" || clr=="dashboard_id" || clr=="category" ||clr=="package"){
	document.getElementById(clr).style.backgroundColor = "#43caff";
document.getElementById(act).style.color = "#fff";

}
else if(clr=="roles"||clr=="assignRoles"||clr=="siteInfo"||clr=="countries"||clr=="cities"||clr=="taxes"||clr=="cancelReason"||clr=="rating"||clr=="pushNotification"){
	
	document.getElementById(clr).style.backgroundColor = "#43caff";
	document.getElementById(act).style.color = "#fff";
	
	document.getElementById('general_setting1').style.backgroundColor = "#00a0df";
	document.getElementById('general_setting1').style.color = "#fff";
	
	var element = document.getElementById("general_setting");
	   element.classList.add("active");
	   
	}else if(clr=="languagesList1"||clr=="appLanguages"||clr=="backendLanguages"){
		
		document.getElementById(clr).style.backgroundColor = "#43caff";
		document.getElementById(act).style.color = "#fff";
		   
		}else if(clr=="appLanguages"){
			document.getElementById(clr).style.backgroundColor = "#43caff";
			document.getElementById(act).style.color = "#fff";
			
		}else if(clr=="appLanguages2"){
			document.getElementById(clr).style.backgroundColor = "#43caff";
			document.getElementById(act).style.color = "#fff";
			
		}else if(clr=="appAttendance"||clr=="appAttendance"||clr=="backendLanguages"){
				
				document.getElementById(clr).style.backgroundColor = "#43caff";
				document.getElementById(act).style.color = "#fff";
				
				
				var element = document.getElementById("languages");
				   element.classList.add("active");
				}else if(clr=="imageList"||clr=="activeRides"||clr=="completedRides"||clr=="pendingRides"||clr=="cancelledRides"){
			
			document.getElementById(clr).style.backgroundColor = "#43caff";
			document.getElementById(act).style.color = "#fff";
			
			document.getElementById('imageManagement1').style.backgroundColor = "#00a0df";
			document.getElementById('imageManagement1').style.color = "#fff";
			var element = document.getElementById("imageManagement");
			   element.classList.add("active");
			   
			}else if(clr=="companiesList"){
				
				document.getElementById(clr).style.backgroundColor = "#43caff";
				document.getElementById(act).style.color = "#fff";
				
				document.getElementById('companies1').style.backgroundColor = "#00a0df";
				document.getElementById('companies1').style.color = "#fff";
				
				var element = document.getElementById("companies");
				   element.classList.add("active");
				   
				}else if(clr=="vehiclecolor"||clr=="bodyStyle"||clr=="vehicleclass"||clr=="commissionsetup"||clr=="vehicleManagement"||clr=="vehicleDocument"){
					
					document.getElementById(clr).style.backgroundColor = "#43caff";
					document.getElementById(act).style.color = "#fff";
					
					document.getElementById('vehicle1').style.backgroundColor = "#00a0df";
					document.getElementById('vehicle1').style.color = "#fff";
					
					var element = document.getElementById("vehicle");
					   element.classList.add("active");
					   
					}else if(clr=="empleavebyteamid"||clr=="empleavebyteamid"||clr=="empleavebyteamid"){
						
						document.getElementById(clr).style.backgroundColor = "#43caff";
						document.getElementById(act).style.color = "#fff";
						
						document.getElementById('leaveManagement1').style.backgroundColor = "#00a0df";
						document.getElementById('leaveManagement1').style.color = "#fff";
						
						
						   
						}else if(clr=="appSkill"||clr=="appSkill"||clr=="skillliid"){
							
							document.getElementById(clr).style.backgroundColor = "#43caff";
							document.getElementById(act).style.color = "#fff";
							
							document.getElementById('skillliid').style.backgroundColor = "#00a0df";
							document.getElementById('skillliid').style.color = "#fff";
							
							
							   
							}else if(clr=="teamheadid"||clr=="teamheadid"||clr=="teamheadid"){
							
							document.getElementById(clr).style.backgroundColor = "#43caff";
							document.getElementById(act).style.color = "#fff";
							
							document.getElementById('leaveManagement1').style.backgroundColor = "#00a0df";
							document.getElementById('leaveManagement1').style.color = "#fff";
							 
							}else if(clr=="driverList"||clr=="addDriver"){
						
						document.getElementById(clr).style.backgroundColor = "#43caff";
						document.getElementById(act).style.color = "#fff";
						
						document.getElementById('drivers1').style.backgroundColor = "#00a0df";
						document.getElementById('drivers1').style.color = "#fff";
						
						var element = document.getElementById("drivers");
						   element.classList.add("active");
						   
						} else if(clr=="customerList"||clr=="addCustomer"){
							
							document.getElementById(clr).style.backgroundColor = "#43caff";
							document.getElementById(act).style.color = "#fff";
							
							document.getElementById('users1').style.backgroundColor = "#00a0df";
							document.getElementById('users1').style.color = "#fff";
							
							var element = document.getElementById("users");
							   element.classList.add("active");
							   
							}else if(clr=="promoCode"||clr=="referalCode"){
								
								document.getElementById(clr).style.backgroundColor = "#43caff";
								document.getElementById(act).style.color = "#fff";
								
								document.getElementById('discount1').style.backgroundColor = "#00a0df";
								document.getElementById('discount1').style.color = "#fff";
								
								var element = document.getElementById("discount");
								   element.classList.add("active");
								   
								}else if(clr=="paymentList"){
									
									document.getElementById(clr).style.backgroundColor = "#43caff";
									document.getElementById(act).style.color = "#fff";
									
									document.getElementById('payment1').style.backgroundColor = "#00a0df";
									document.getElementById('payment1').style.color = "#fff";
									
									var element = document.getElementById("payment");
									   element.classList.add("active");
									   
									}
}
    </script> 
    
    

</head>
<body onload="showonlyone('<%=request.getParameter("clr")%>','<%=request.getParameter("act")%>');">

<%
String clr = request.getParameter("clr");
String act = request.getParameter("act");

System.out.println("clr=>>"+clr);
	System.out.println("act=>>"+act);
%>

<div class="left " role="navigation">
<input type="hidden" value="full" id="hideshow">
        <ul>
  			 <li class="item-menu" id="dashboard_id" style="display: none;">
                 <a href="adminLoginPage?clr=dashboard_id&act=dashboard_id" >
                    <span class="glyphicon glyphicon-home"></span> 
                    <span class="menu">Dashboard</span>
                    
                	</a> 
        
                </li>
            	<li class="item-menu" id="languagesList1">
            		<a href="paymentHistory?clr=languagesList1&act=languagesList1" >	
                   		<span class="fa fa-users"></span> 
                    	<span class="menu">Payment</span>
                    </a>
                </li>
                           
                <li class="item-menu" data-toggle="collapse" data-target="#leaveul" id="leave_li" style="display: none;">  
                <a  href="#">
                    <span class="glyphicon glyphicon-credit-card"></span> 
                    <span class="menu dropdown-toggle" >Leave <span class="caret" style="margin: 20px;"></span> </span>
                    
                </a>
                    <ul id="leaveul" class="collapse">
                    	<li class="item-menu" id="empleavebyteamid">
                    		<a href="employeeLeaveByAdmin?clr=empleavebyteamid&act=empleavebyteamid" > 
                             	<span class="fa fa-user"></span> 
		                   		<span class="menu">Employee</span>
                             </a>
                  
							
						</li>
                    	<li id="teamheadid">
                    		<a href="teamheadLeaveByAdmin?clr=teamheadid&act=teamheadid"  > 
                             	<span class="fa fa-users"></span> 
		                   		<span class="menu">Team Head</span>
                             </a>
                  
							
						</li>
                    </ul>
                </li>
            
            
        </ul>
    </div>
    <script type="text/javascript">
function showHideFnc() {
	var hideshow=document.getElementById("hideshow").value;
	
	if(hideshow=="half"){
		$(".left").width("250px");
		document.getElementById("hideshow").value="full";
		document.getElementById("page-wrapper").style.marginLeft  = "250px";
		document.getElementById("nava").style.display = "block";
		document.getElementById("span-left").style.display = "block";
		document.getElementById("span-right").style.display = "none";
	}else if(hideshow=="full"){
		$(".left").width("50px");
		document.getElementById("hideshow").value="half";
		document.getElementById("page-wrapper").style.marginLeft  = "50px";
		document.getElementById("nava").style.display = "none";
		document.getElementById("span-left").style.display = "none";
		document.getElementById("span-right").style.display = "block";
	}
	
}

</script>


<script type="text/javascript"> 
            $(document).ready(function() { 
                  
                 
                $(".left").mouseenter(function(){ 
                	var hideshow=document.getElementById("hideshow").value;
                	if(hideshow=="half"){
                		
	                    $(this).animate({ 
	                        width: "250px" 
	                    }); 
	                }
                }).mouseleave(function(){ 
                	var hideshow=document.getElementById("hideshow").value;
                	if(hideshow=="half"){
                		
	                    $(this).animate({ 
	                        width: "50px" 
	                    }); 
	                }
                }); 
            }); 
        </script> 
</body>
</html>
