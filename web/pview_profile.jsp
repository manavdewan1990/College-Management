<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Principal" %>
<%@page  import="com.model.WebModel" %>
<%@page  import="com.model.Attendance" %>
<%@page  import="com.model.Messages" %>
<%@page  import="java.util.Date" %>
<%@page  import="java.sql.Connection" %>
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

   Principal st= (Principal)session.getAttribute("principal");

 // String id_no=  request.getParameter("tid_no");

  //Teacher st=new Teacher(id_no,(Connection)this.getServletContext().getAttribute("connection"));
 //String class_name[]=st.getClass_name();
// String subjects[]=st.getSubjects();


    //Messages
    Messages messages=st.getMessages();
    String m_subject[]=messages.getSubject();
    String m_body[]=messages.getBody();
    Date m_date[]=messages.getDate();
   String m_sender[]= messages.getSender();
    int m_size=m_subject.length;
    %>





	<body>
		<div id="bokeh"><div id="container">

			<div id="header">
				<h1 id="logo">College Management System </h1>

				<div id="header_buttons">
                                    <a href="#">Welcome! <%
                                    if (st.getSex().equals("m"))
                                out.println("Mr. ");
                                else out.println("Ms. ");%>
                                <%=st.getName() %></a>
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
								<div class="author"><a href="tmessages.jsp"><%= m_sender[i]%></a></div>
								<div class="content"><%= m_subject[i]%></div>
								<div class="datetime"><%= m_date[i]%></div>
							</div>
                                                    <%
                                                    }
                                                    %>

	          </div>

						<div class="modalfoot">
                                                    <a href="tcsend_message.jsp"><img src="images/icons/newmessage.png" alt="New message" /> New message
                          </a>
					  </div>
					</div>
				</div>


				<!-- Navigation -->
				<ul id="main-nav">
					<li>
						<a href="pindex.jsp" >Dashboard</a>
                                                <ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

<li><a href="#">Bus Timing </a></li>
						</ul>
					</li>

<li>
						<a href="pview_profile.jsp" class="current" ><!-- use href="#" to indicate there's a submenu -->
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

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />View Profile</h2>

				<div class="notification information">
					This is an informative notification. Click me to hide me.
				</div>
<div class="content-box column-left sidebar" style="width:13%"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
					<div class="content-box-header">
						<h3>Photo</h3>
					</div>

					<div class="content-box-content">
				    <img src="data/<%=st.getPhoto()%>" width="100" height="100" alt="No photo available"></div>
                                    <p>      <%=st.getName()%> </p>
			  </div>

                <div class="clear"></div>
			  <div class="content-box  "><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
					<div class="content-box-header">
						<h3>Profile Info</h3>
					</div>

					<div class="content-box-content" style="float:none; width:98%">

<table width="200" border="1">
  <tr>
    <td>Name</td>
    <td><%=st.getName() %></td>
  </tr>
  <tr>
    <td>ID</td>
    <td><%= st.getId_no() %></td>
  </tr>
  <tr>
    <td>Adress</td>
    <td><%= st.getAdress() %></td>
  </tr>
  <tr>
    <td>Gender</td>
    <td><%=st.getSex() %></td>
  </tr>
  <tr>
    <td>Landline</td>
    <td><%=st.getLandline() %></td>
  </tr>
  <tr>
    <td>Phno</td>
    <td><%= st.getPhno() %></td>
  </tr>
  <tr>
    <td>Dob</td>
    <td><%=st.getDob() %></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>



                </div>
			  </div>
				<div class="clear"></div><!-- end .content-box -->

			</div><!-- end #content -->

		</div></div><!-- end #bokeh and #container -->


		<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>