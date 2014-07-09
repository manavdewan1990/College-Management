<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Recent" %>
<%@page  import="com.model.Messages" %>
<%@page  import="com.model.Admin" %>
<%@page  import="com.model.Student" %>
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






                           <!-- new prototype javascript -->

	<script type="text/javascript" src="javascripts/effects.js"> </script>
	<script type="text/javascript" src="javascripts/window.js"> </script>
	<script type="text/javascript" src="javascripts/debug.js"> </script>
	</head>
        <%
         String reciever_name[]=null;
        String designation= (String) session.getAttribute("profile");
 if (designation.equals("admin"))
     {
      Admin pr = (Admin)session.getAttribute(designation);
    reciever_name= pr.getClass_name();
     }

        %>

	<body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">Admin Control Panel </h1>

				<div id="header_buttons">

					<a href="#modal" rel="modal"><img src="images/icons/envelope.png" alt="3 Messages" />3</a>
					<a href="#modal2" rel="modal">modal box test</a>
					<a href="#">logout</a>
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
							<div class="message">
								<div class="author"><a href="#">Teun</a></div>
								<div class="content">This skin can be easily styled!</div>
								<div class="datetime">16-05 - 08:16</div>
							</div>

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
						<a href="login.html">
							Dashboard
						</a>
					</li>

					<li>
						<a href="send_message.jsp" ><!-- use href="#" to indicate there's a submenu -->Message</a>

						<ul>
							<li><a href="#">Pages</a></li>
							<li><a href="#">Articles</a></li>
						</ul>
					</li>

					<li>
						<a href="#">
							Layout
						</a>

						<ul>
							<li><a href="#">Edit CSS</a></li>
							<li><a href="#">Manage Themes</a></li>
						</ul>
					</li>

					<li>
						<a href="#" class="current">
							Users
						</a>

						<ul>
							<li><a href="#">Permissions</a></li>
							<li><a href="#" class="current">Manage Users</a></li>
							<li><a href="#">Manage Usergroups</a></li>
						</ul>
					</li>

					<li>
						<a href="#">
							Settings
						</a>

						<ul>
							<li><a href="#">Account settings</a></li>
							<li><a href="#">Domain settings</a></li>
						</ul>
					</li>
				</ul><!-- end #nav -->

			</div><!-- end #header -->

			<div id="content">

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />Manage Users</h2>

				<div class="notification information">
					This is an informative notification. Click me to hide me.
				</div>

				<div class="content-box closed column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
					<div class="content-box-header">
						<h3>Closed Sidebar</h3>
					</div>

					<div class="content-box-content">
						<p>This content box uses 1/3rd of the total width.</p>
						<p>The total width can be easily adjusted in main.css.</p>
					</div>
				</div>
			  <div class="clear"></div><!-- end .content-box -->

	      <div class="clear"></div>

				<div class="content-box">
					<div class="content-box-header">
						<h3>Assignment</h3>
					</div>

					<div class="content-box-content">
						<form action="submit_book" ENCTYPE=multipart/form-data METHOD=POST>
						  <fieldset>
							  <p>
						    <label>Real name</label>
									<input id="subject" type="text" class="medium" value="Subject"name="subject" /><!-- the value-attribute overwrites the <label>Username</label> --></p>
							  <p>
					      <label>Select an option</label>
									<select name="reciever">
                                                                            <% for(int i=0;i<reciever_name.length;i++){ %>
                                                                            for ()
										<option><%= reciever_name[i]%> </option>
										<% }%>
									</select>
									<small>Select class from the list.</small>
							</p>

						  <p>
									<textarea class="wysiwyg" name="body"></textarea>
						    </p>
						  <INPUT TYPE=FILE NAME=file>
                          <small> Add Picture</small>
                          <br>
                          <INPUT TYPE=FILE NAME=file2>
                          <small> Add Book</small>
						  </fieldset>

						  <input type="submit" value="Submit" />
						</form>
					</div>
				</div>
			</div><!-- end #content -->

		</div></div><!-- end #bokeh and #container -->

		<div id="footer">
			Admin Control Panel | Designed by <a href="http://www.bramjetten.nl/">Bram Jetten Webdesign</a> 2010
		</div><!-- end #footer -->

</body>
</html>