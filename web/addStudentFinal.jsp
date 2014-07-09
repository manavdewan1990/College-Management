<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
       String school= request.getParameter("school");
        String class_name=request.getParameter("class_name");
       String section= request.getParameter("section");
        %>

	<body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">Admin Control Panel </h1>

				<div id="header_buttons">

					<a href="#modal" rel="modal"><img src="images/icons/envelope.png" alt="3 Messages" />3</a><a href="#">logout</a>
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
						<a href="#"><!-- use href="#" to indicate there's a submenu -->
							Content
						</a>

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
			  <div class="clear"></div><!-- end .content-box -->

	      <div class="clear"></div>

				<div class="content-box">
					<div class="content-box-header">
						<h3>Form</h3>
					</div>

					<div class="content-box-content">
						<form action="add_student" name="f1" ENCTYPE=multipart/form-data METHOD=POST>
						  <fieldset>
								<p>
									<label>Name</label>
									<input id="name" type="text" class="small" name="name"/>
									<!-- add .align-right to align the input elements to the right -->
									<span class="notification information">  Name of the Student.</span>
								</p>

								<p>
									<label>Id</label>
									<input id="id_no" type="text" class="medium" name="id_no"/>
									<!-- the value-attribute overwrites the <label>Username</label> --><span class="notification information">Id of the student.</span></p>

								<p>
							    <label>Password</label>

                                <input id="password" type="password" class="medium"  name="password"/>
                                <!-- the value-attribute overwrites the <label>Username</label> -->
                                <span class="notification information">Password.</span>								</p>
							  <p>

                                  <label>Password</label>
                                  <input id="password2" type="password" class="medium"  name="password2"/>
                                  <!-- the value-attribute overwrites the <label>Username</label> -->
                                <span class="notification information">Retype Password.</span></p>
                                <p> <INPUT TYPE=FILE NAME=photo></p>
						  </fieldset>
                                                    <input name="school" type="hidden" value="<%=school%>">
                            <input name="class" type="hidden" value="<%=class_name%>">
                            <input name="section" type="hidden" value="<%=section%>">
                        <p>
                              <label>Phno.</label>
                          <input id="name2" type="text" class="small" name="phno"/>
                              <!-- add .align-right to align the input elements to the right -->
                              <span class="notification information"> Phno.</span> </p>
                        <p>
                          <label>Landline</label>
                          <input id="name3" type="text" class="small" name="landline"/>
                          <!-- add .align-right to align the input elements to the right -->
                          <span class="notification information">Landline.</span></p>
                        <p>
                          <input id="birthday" type="text" class="small datepicker"  name="dob" value="      click here"/>
                          <span class="notification information">Date Of Birth</span></p>
                        <p>


<input type="radio" name="sex" value="m" /> Male<br />
<input type="radio" name="sex" value="f" /> Female

                        </p>
<p>
                              <label>Adress</label>
                              <input  name="adress"  type="text" class="active" size="130" height="100"/>
              <!-- the value-attribute overwrites the <label>Username</label> -->
              <span class="notification information">Adress.</span></p>
<p>&nbsp;						  </p>
						  <p>&nbsp;</p>
							<p>
							  <input type="submit" value="Submit" onClick="if(document.f1.password.value != document.f1.password2.value) { alert('The passwords do not match.'); }else{this.form.submit();}" />
						  </p>
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