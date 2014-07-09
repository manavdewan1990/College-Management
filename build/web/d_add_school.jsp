<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Messages" %>
<%@page  import="com.model.Recent" %>
<%@page  import="com.model.Books" %>
<%@page  import="com.model.Admin" %>
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

   Admin pr=(Admin)session.getAttribute("admin");

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
<a href="scindex.jsp" >
							Dashboard
						</a>
					</li>

<li>
						<a href="scview_profile.jsp"><!-- use href="#" to indicate there's a submenu -->My Info</a>

<ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

<li><a href="#">Bus Timing </a></li>
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
						<a href="#" >
							Result</a>


				  </li>

<li>
<a href="books.jsp" class="current">
							Books</a>

                       	  </li>
				</ul><!-- end #nav -->

			</div><!-- end #header -->

			<div id="content">

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />Add School</h2>

				<div class="notification information">Click on the book image to download it.</div>
			  <div class="clear"></div>

  <div >
					<div class="content-box-header">
						<h3>Form</h3>
					</div><!-- end .content-box-header -->

					<div class="content-box-content">
                      <form action="add_school">
					  <p>&nbsp;</p>
					  <p><input type="text" name="school">
				      <span class="notification information">School Name</span></p>
					  <p>
					    <input type="text" name="about">
                        <span class="notification information">About</span></p>
					  <p>
					    <input type="text"  name="principal">
                        <span class="notification information">Principal Name</span></p>
					  <p>
					    <input type="text"  name="adress">
                        <span class="notification information">Adress</span></p>
					  <p>&nbsp;</p>
                      <br>
                      <button type="submit" > Submit</button>
                        </form>
					</div>
					<!-- end .content-box-content -->

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