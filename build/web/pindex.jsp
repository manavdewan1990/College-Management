<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Recent" %>
<%@page  import="com.model.WebModel" %>
<%@page  import="com.model.Messages" %>
<%@page  import="com.model.Profile" %>
<%@page  import="java.util.Date" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Make IE8 behave like IE7, necessary for charts -->
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

		<title>e-school Management</title>

		<!-- CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/reset.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="css/custom-theme/jquery-ui-1.8.1.custom.css" />

		<!-- IE specific CSS stylesheet -->
		<!--[if IE]>
			<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css" />
		<![endif]-->

		<!-- This stylesheet contains advanced CSS3 features that do not validate yet -->
         <link rel="stylesheet" type="text/css" media="screen" href="css/css3.css" />
        <link href="themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="themes/alphacube.css" rel="stylesheet" type="text/css"/>





<!-- JavaScript -->



    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="js/jquery.rounded.js"></script>
		<script type="text/javascript" src="js/excanvas.js"></script>
		<script type="text/javascript" src="js/jquery.visualize.js"></script>
		<script type="text/javascript" src="js/script.js"></script>











<script type="text/javascript">
function openURL(str,i)
{
   // window.alert(str);
    url="dynamicURL"+i;
    //window.alert(url);
if (str=="")
  {
  document.getElementById(url).innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(url).innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET",str,true);
xmlhttp.send();
}
</script>


	</head>
<%
     String designation= (String) session.getAttribute("profile");
    Profile pr= (Profile)session.getAttribute(designation);

    //notices
    Notice notice=pr.getNotice();
    String subject[]=notice.getSubject();
    String body[]=notice.getBody();
    Date date[]=notice.getDate();
   String sender[]= notice.getSender();
    int size=subject.length;


    //Messages
    Messages messages=pr.getMessages();
    String m_subject[]=messages.getSubject();
    String m_body[]=messages.getBody();
    Date m_date[]=messages.getDate();
   String m_sender[]= messages.getSender();
    int m_size=m_subject.length;

    //Recent

    Recent recent=pr.getRecent();
    String r_subject[]=recent.getSubject();
   // String r_body[]=notice.getBody();

   String r_sender[]= recent.getSender();
    int r_size=r_subject.length;

    %>
	<body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">College Management System </h1>

				<div id="header_buttons">
                                    <a href="#">Welcome! <%
                                    if (pr.getSex().equals("m"))
                                out.println("Mr. ");
                                else out.println("Ms. ");%>
                                <%=pr.getName() %></a>
					<a href="#modal" rel="modal"><img src="images/icons/envelope.png" alt="3 Messages" />Msg</a><a href="logout">logout</a>
					<a href="#">view website</a>

		    </div><!-- end #header_buttons -->

				<!-- Modal box -->
				<div id="modal">
					<div class="modalbox">
						<div class="modalhead">
							<img src="images/modaltop.png" alt="Modal arrow" />
							Mailbox
						</div>

						<div class="modalcontent">
                                                    <% for(int i=0;i<m_size && i<3;i++)
                                                        {
                                                    %>
							<div class="message">
								<div class="author"><a href="pmessages.jsp"><%= m_sender[i]%></a></div>
								<div class="content"><%= m_subject[i]%></div>
								<div class="datetime"><%= m_date[i]%></div>
							</div>
                                                    <%
                                                    }
                                                    %>

	          </div>

						<div class="modalfoot">
                                                    <a href="psend_message.jsp"><img src="images/icons/newmessage.png" alt="New message" /> New message
                          </a>
					  </div>
					</div>
				</div>


				<!-- Navigation -->
				<ul id="main-nav">
						<li>
<a href="scindex.jsp" class="current">
							Dashboard

						</a>
                                            <ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

                                                        <li><a href="#">Bus Timing </a></li>
                                                         <li><a href="#">Result</a></li>
                                                             <li><a href="change_password.jsp">Change Password</a></li>
						</ul>
					</li>

<li>
						<a href="pview_profile.jsp" ><!-- use href="#" to indicate there's a submenu -->
						My Info</a>



<ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

<li><a href="#">Bus Timing </a></li>
						</ul>
					</li>

					<li>
						<a href="#">View Profiles</a>

					    <ul>
							<li><a href="pselect_student.jsp">Students</a></li>
							<li><a href="pselect_teacher.jsp">Teachers</a></li>
						</ul>
					</li>

<li>
						<a href="psendnotice.jsp">
						SendNotice</a>

                        <ul>
							<li><a href="#">Permissions</a></li>
							<li><a href="#" class="current">Manage Users</a></li>
							<li><a href="#">Manage Usergroups</a></li>
						</ul>
					</li>

<li>
						<a href="#">
							Books
						</a>


					</li>
				</ul><!-- end #nav -->


			</div><!-- end #header -->

			<div id="content">

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />Welcome</h2>


					 <%if (request.getParameter("msg")!=null)
{                         out.println("<div class=\"notification success\">");
                          out.println(request.getParameter("msg"));
                          }
    else {
                      %>
<div class="notification information">
					This is an informative notification. Click me to hide me.
                                        <% } %>
			  </div>

                <div id="dynamic-content">

                <div class="content-box  column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
					<div class="content-box-header">
						<h3>Welcome!</h3>
					</div>

					<div class="content-box-content">
						<img src="data/<%=pr.getPhoto() %>" alt="No photo available" height="175" width="175" >
                                                <p> <%= pr.getName() %></p>
					</div>
				</div>
                  <div class="clear"></div>

		  <div class="content-box column-left main">
					<div class="content-box-header">
						<h3>Notices</h3>
					</div><!-- end .content-box-header -->

					<div class="content-box-content">
						<table border="1" class="pagination" rel="5"><!-- add the class .pagination to dynamically create a working pagination! The rel-attribute will tell how many items there are per page -->
							<thead>
								<tr>
									<th width="10%">Srno</th>
									<th width="14%">Sender</th>
									<th width="56%">Subject</th>
									<th width="20%">Date</th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<td colspan="4">&nbsp;</td>
								</tr>
							</tfoot>

							<tbody>





                                                             <% for (int i=0;i<size;i++)
                                                                {
                                                           String url="#modaln" +i;
                                                            %>
								<tr>
                                                                    <td><%=i+1 %>        </td>
									<td><%=sender[i] %></td>

                                                                        <td <a href=<%=url%> rel="modal" onmousedown=openURL('notice.jsp?number=<%= i%>',<%= i%>)>
                                                                                <%=subject[i]   %>
                                                                            </a> </td>

									<td><%=date[i]%></td>
								</tr>
                                                                <%
                                                                }
                                                                %>







							</tbody>
						</table>





                                                                 <% for (int i=0;i<size;i++)
                                                                {
                                                            %>

                                    <div id="modaln<%= i%>">

                                    <div class="modalbox" id="dynamicURL<%= i%>">
					</div>
				</div>
                                                             <%
                                                                }
                                                                %>





			</div><!-- end .content-box-content -->

			  </div><!-- end .content-box -->

			  <div class="content-box column-right sidebar">
					<div class="content-box-header">
						<h3>Recent</h3>
				  </div>

					<div class="content-box-content">
						<table class="pagination" rel="5">
						  <!-- add the class .pagination to dynamically create a working pagination! The rel-attribute will tell how many items there are per page -->
						  <thead>
						    <tr>
						      <th>Sender</th>
						      <th>&nbsp;</th>
					        </tr>
					      </thead>
						  <tfoot>
						    <tr>
						      <td colspan="2">&nbsp;</td>
					        </tr>
					      </tfoot>
						  <tbody>
						    <% for (int i=0;i<r_size;i++)
                                                                {
                                                            %>
								<tr>

									<td><%=r_sender[i] %></td>
									<td><%=r_subject[i]%></td>

								</tr>
                                                                <%
                                                                }
                                                                %>
					      </tbody>
					  </table>


						<p>&nbsp;</p>
				  </div>
				</div>








			  <div class="clear"></div>
			</div><!-- end #content -->

		</div></div> </div><!-- end #bokeh and #container -->

		<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>