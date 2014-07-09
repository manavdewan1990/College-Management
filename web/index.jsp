<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.WebModel" %>
<%@page  import="java.sql.Connection" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Make IE8 behave like IE7, necessary for charts -->
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">

		<title>e-school Management</title>

		<!-- CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/reset.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/custom-theme/jquery-ui-1.8.1.custom.css">

		<!-- IE specific CSS stylesheet -->
		<!--[if IE]>
			<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css" />
		<![endif]-->

		<!-- This stylesheet contains advanced CSS3 features that do not validate yet -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/css3.css">

		<!-- JavaScript -->
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="js/excanvas.js"></script>
		<script type="text/javascript" src="js/jquery.visualize.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</head><body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">e-school Management</h1>
			<h2><img src="images/icons/user_32.png" alt="Login">Login</h2></div><!-- end #header -->

			<div id="content">



				<div id="login">

					<div class="content-box">
						<div class="content-box-header">
							<h3>Login</h3>
						</div>

						<div class="content-box-content">

							 <%if (request.getParameter("msg")!=null)
{                         out.println("<div class=\"notification error\">");
                          out.println(request.getParameter("msg"));
                          }
    else {
                      %>
<div class="notification information">
					Login here to proceed
                                        <% } %>
			  </div>

                          <form action="login" method="POST">
				<p>
									<label>Username</label>
<input id="username" name="id" type="text" style="color: rgb(150, 150, 150); ">
								</p>

				<p>
									<label>Password</label>
									<input id="password" name="password" type="password" style="color: rgb(150, 150, 150); ">
		        </p>

<p><label>school</label>
			    <div class="skinned-select"><div class="select-text"> </div><select name="school" id="school">
                                <%
                              String school_name[]=   WebModel.getschools((Connection)this.getServletContext().getAttribute("connection"));

                              for (String school:school_name)
                                  {
                                %>

                                <option><%= school %></option>
                                    <%
                                    }
                                    %>


			      </select></div>



<input type="submit" value="Login">
						  </form>
						</div>
					</div><!-- end .content-box -->
				</div><!-- end #login -->

			</div><!-- end #content -->

			<div id="push"></div><!-- push footer down -->

	<div id="push"></div></div></div><!-- end #container -->

		<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>