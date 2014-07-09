<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Student" %>
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

    Student st= (Student)session.getAttribute("student");

 // String id_no=  request.getParameter("sid_no");

  //Student st=new Student(id_no,(Connection)this.getServletContext().getAttribute("connection"));
 // st.getAttendance();
  Attendance attendance= st.getAttendance();


    //Messages
    Messages messages=st.getMessages();
    String m_subject[]=messages.getSubject();
    String m_body[]=messages.getBody();
    Date m_date[]=messages.getDate();
   String m_sender[]= messages.getSender();
    int m_size=m_subject.length;


         String []a_status=attendance.getStatus();
         String [] a_total_lectures=attendance.getTotal_lectures();
         String [] a_teacher_id=attendance.getTeacher_id();
         String [] a_subject=attendance.getSubject();
         int a_size=a_status.length;
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


				<!-- Navigation -->
				<ul id="main-nav">
					<li>
<a href="scindex.jsp" >
							Dashboard
						</a>
					</li>

<li>
						<a href="scview_profile.jsp" class="current"><!-- use href="#" to indicate there's a submenu -->My Info</a>


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
						<a href="assignments.jsp" >
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

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />View Profile</h2>

				<div class="notification information">View Messages by Clicking on the letter box on top-right corner</div>
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

					<div class="content-box-content" style="float:none; width:100%">

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

			  <div class="content-box  main" style="float:none; width:100%">
					<div class="content-box-header">
						<h3>Attendance</h3>

						<!-- You can create tabs with unordered lists -->
						<ul>
							<li>
								<a href="#bar">Bar chart</a>
							</li>

							<li>
								<a href="#area">Area chart</a>
							</li>
						</ul>
				  </div>

					<div class="content-box-content">
					  <div class="tab-content" id="bar">
					    <table class="bargraph">
					      <caption>
					        Statistics
				          </caption>
					      <thead>
					        <tr>
					          <td></td>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <th scope="col"><%= a_subject[i] + "   ("%> <%= a_teacher_id[i]  + ")"%></th>
					          <%
                                                                                }
                                                                                %>
					          <%
                                                                                if (a_size<=1)
                                                                                {
                                                                                    %>
					          <th scope="col">No Attendance uploaded </th>
					          <%
                                                                                }
         %>
				            </tr>
				          </thead>
					      <tbody>
					        <tr>
					          <th scope="row">Attendance</th>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <td><%= a_status[i] %></td>
					          <%
                                                                                }
         %>
					          <%
                  if (a_size<=1)
                                                                                {
                                                                                    %>
					          <td>1 </td>
					          <%
                                                                                }
         %>
				            </tr>
					        <tr>
					          <th scope="row">Total Lectures</th>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <td><%= a_total_lectures[i]%></td>
					          <%
                                                                                }
                                                                                %>
					          <%
                                                                                 if (a_size<=1)
                                                                                {
                                                                                    %>
					          <td>1 </td>
					          <%
                                                                                }
         %>
				            </tr>
				          </tbody>
				        </table>
				      </div>
					  <!-- end .tab-content -->
					  <div class="tab-content" id="area">
					    <table class="areagraph">
					      <caption>
					        Statistics
				          </caption>
					      <thead>
					        <tr>
					          <td></td>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <th scope="col"><%= a_subject[i] + "   ("%> <%= a_teacher_id[i]  + ")"%></th>
					          <th scope="col"><%= a_subject[i] + "   ("%> <%= a_teacher_id[i]  + ")"%></th>
					          <%
                                                                                }
                                                                                %>
					          <%
                                                                                if (a_size<=2)
                                                                                {
                                                                                    %>
					          <th scope="col">No Attendance uploaded </th>
					          <th scope="col">No Attendance uploaded</th>
					          <%
                                                                                }
         %>
				            </tr>
				          </thead>
					      <tbody>
					        <tr>
					          <th scope="row">Attendance</th>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <td><%= a_status[i] %></td>
					          <%
                                                                                }
                  %>
					          <%
                  if (a_size<=2)
                                                                                {
                                                                                    %>
					          <td>1 </td>
					          <td>1</td>
					          <%
                                                                                }
         %>
				            </tr>
					        <tr>
					          <th scope="row">Total Lectures</th>
					          <%
                                                                                for (int i=0;i<a_size;i++)
                                                                                    {

                                                                                %>
					          <td><%= a_total_lectures[i]%></td>
					          <%
                                                                                }
                                                                                %>
					          <%
                                                                             if (a_size<=2)
                                                                                {
                                                                                    %>
					          <td>1 </td>
					          <td>1</td>
					          <%
                                                                                }
         %>
				            </tr>
				          </tbody>
				        </table>
				      </div>
					  <!-- end .tab-content -->
			    </div><!-- end .content-box-content -->
				</div>

			  <div class="clear"></div><!-- end .content-box -->

			  <div class="clear"></div>
			</div><!-- end #content -->

		</div></div><!-- end #bokeh and #container -->
<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>