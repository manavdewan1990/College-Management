<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Recent" %>
<%@page  import="com.model.Assignments" %>
<%@page  import="com.model.Student" %>
<%@page  import="com.model.Messages" %>
<%@page  import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Make IE8 behave like IE7, necessary for charts -->
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

		<title>Admin Control Panel</title>

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

		<!-- JavaScript -->
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="js/jquery.rounded.js"></script>
		<script type="text/javascript" src="js/excanvas.js"></script>
		<script type="text/javascript" src="js/jquery.visualize.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</head>
<%

    Student pr= (Student)session.getAttribute("student");


    //Messages
    Assignments assignment=pr.getAssignment();
    String r_subject[]=assignment.getSubject();
    String r_body[]=assignment.getBody();
    Date r_date[]=assignment.getDate();
   String r_sender[]= assignment.getSender();
   String r_file[]=assignment.getFile();
    int r_size=r_subject.length;

    //Messages
    Messages messages=pr.getMessages();
    String m_subject[]=messages.getSubject();
    String m_body[]=messages.getBody();
    Date m_date[]=messages.getDate();
   String m_sender[]= messages.getSender();
    int m_size=m_subject.length;

    %>
	<body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">Admin Control Panel </h1>

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
								<div class="author"><a href="messages.jsp"><%= m_sender[i]%></a></div>
								<div class="content"><%= m_subject[i]%></div>
								<div class="datetime"><%= m_date[i]%></div>
							</div>
                                                    <%
                                                    }
                                                    %>

          </div>

						<div class="modalfoot">
                                                    <a href="send_message.jsp"><img src="images/icons/newmessage.png" alt="New message" /> New message
                          </a>
					  </div>
					</div>
				</div>

				<!-- Modal box 2 -->
				<div id="modal2">
	  <div class="modalbox">
						<div class="modalhead">
							<img src="images/modaltop.png" alt="Modal arrow" />
							Mailbox 2
						</div>

						<div class="modalcontent">
							<div class="message">
								<div class="author"><a href="#">Pieter</a></div>
								<div class="content">It can also be styled very easily.</div>
								<div class="datetime">11-05 - 16:27</div>
							</div>

							<div class="message">
								<div class="author"><a href="#">Jane Doe</a></div>
								<div class="content">This template uses a lot of nice CSS3 effects.</div>
								<div class="datetime">10-05 - 18:42</div>
							</div>
						</div>

						<div class="modalfoot">
							<img src="images/icons/newmessage.png" alt="New message" /> New message
						</div>
					</div>
				</div>

				<!-- Navigation -->
				<ul id="main-nav">
					<li>
<a href="scindex.jsp" ">
							Dashboard
						</a>
					</li>

<li>
						<a href="scview_profile.jsp"><!-- use href="#" to indicate there's a submenu -->My Info</a>

<ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

<li><a href="#">Bus Timing </a></li>
<li><a href="#">Result</a></li>
						</ul>
					</li>

					<li>
						<a href="resourses.jsp">Resources
            </a>

						<ul>
							<li><a href="#">Edit CSS</a></li>
							<li><a href="#">Manage Themes</a></li>
						</ul>
					</li>

<li>
						<a href="assignments.jsp" class="current">
		  Assignment</a>


				  </li>

<li>
<a href="books.jsp">
							Books</a>

<ul>
							<li><a href="#">Account settings</a></li>
							<li><a href="#">Domain settings</a></li>
		  </ul>
				  </li>
				</ul><!-- end #nav -->
		  </div><!-- end #header -->

			<div id="content">

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />View Assignments</h2>

				<div class="notification information">
					This is an informative notification. Click me to hide me.
				</div>
			  <div class="clear"></div>

  <div >
					<div class="content-box-header">
						<h3>Assignment</h3>
					</div><!-- end .content-box-header -->

					<div class="content-box-content">
						<table width="109%" height="200" border="1" class="pagination" rel="10"><!-- add the class .pagination to dynamically create a working pagination! The rel-attribute will tell how many items there are per page -->
							<thead>
								<tr>
									<th width="6%" height="64">Sender</th>
								  <th width="10%">Subject</th>
									<th width="57%">Message</th>
									<th width="11%">Date</th>
                                    <th width="14%">Attachment</th>

								</tr>
							</thead>

							<tfoot>
								<tr>
									<td height="31" colspan="4">&nbsp;</td>
								</tr>
							</tfoot>

							<tbody>

								<tr>
									 <% for (int i=0;i<r_size;i++)
                                                                {
                                                            %>
								<tr>

									<td><%=r_sender[i] %></td>
									<td><%=r_subject[i]%></td>
                                                                        <td><%=r_body[i]%></td>
									<td><%=r_date[i]%></td>
                                                                        <td width="14%"><a href="data/<%= r_file[i]%>"><img src="images/download.png" width="80" height="40" alt="download"> </a></td>
                                                                        <td width="2%">&nbsp;</td>
								</tr>
                                                                <%
                                                                }
    %>

								</tr>



							</tbody>
						</table>

  </div><!-- end .content-box-content -->

			  </div><!-- end .content-box -->


	      <div class="clear"></div>

			  <div class="content-box">
			    <div class="content-box-content"></div>
				</div>
			</div><!-- end #content -->

		</div></div><!-- end #bokeh and #container -->

		<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>