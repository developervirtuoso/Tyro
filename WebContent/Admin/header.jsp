<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%!
String email=null;
String adminType=null;
String auth_key="";
String name="";
int id=0;
%>


<%
                 if (session.getAttribute("email") != null) { 
                	 
                	email = session.getAttribute("email").toString();
                	auth_key=(String)session.getAttribute("auth_key");
                	id=(Integer)session.getAttribute("id");
                	
                	
                	%>

               
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header" id="nava">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adminLoginPage?clr=home&act=home1">Admin</a>
            </div>
            <div class="navbar-header" style=" background-color: #337ab7; color: white; width: 49px; height: 54px;  margin-left: 1px;">
            <span class="glyphicon glyphicon-chevron-left" onclick="showHideFnc('left');" id="span-left"  style="margin: 17px;"></span>
             <span class="glyphicon glyphicon-chevron-right" onclick="showHideFnc('right');" id="span-right" style="margin: 17px; display: none;"></span>
                </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->
                
                <!-- /.dropdown -->
                
                <!-- /.dropdown -->
                
                
                
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <label><%=email%> &nbsp;</label> <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" > Reset Password</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="AdminLogout"> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
			
        </nav>
         <script>
         function showHideFnc11(type) {
        		if(type=="left"){
        			document.getElementById("page-wrapper").style.marginLeft  = "0px";
        			
        			document.getElementById("span-left").style.display = "none";
        			document.getElementById("span-right").style.display = "block";
        			document.getElementById("nava").style.display = "none";
        			document.getElementById("sidebardiv").style.display = "none";
        			//$("#sidebardiv").fadeOut(3000);
        			$("#nava").width("0px");
        		}else if(type=="right"){
        			document.getElementById("page-wrapper").style.marginLeft  = "250px";
        			document.getElementById("nava").style.display = "block";
        			document.getElementById("span-left").style.display = "block";
        			document.getElementById("span-right").style.display = "none";
        			document.getElementById("sidebardiv").style.display = "block";
        			//$("#sidebardiv").fadeOut(3000);
        			$("#nava").width("250px");
        		}
        		
        	}
         </script>
        <%}else { 
                 response.sendRedirect("adminLogin.jsp");
                 }
                 %> 
