<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.Recent" %>
<%@page  import="com.model.Messages" %>
<%@page  import="com.model.Profile" %>
<%@page  import="com.model.Principal" %>
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



        <script type="text/javascript">
function openURL(str,id)
{
  //  window.alert(str);
    url=id;
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
         String class_name[]=null;
        String designation= (String) session.getAttribute("profile");
        Principal pr=null;
 if (designation.equals("principal"))
     {
       pr = (Principal)session.getAttribute(designation);
    class_name= pr.getClass_name();
for (String name:class_name)
    pr.getRecievers(name);
     }


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
						<a href="pindex.jsp" >Dashboard</a>
                                                <ul>
							<li><a href="#">Time Table</a></li>
							<li><a href="#">Holiday List</a></li>

<li><a href="#">Bus Timing </a></li>
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

				<h2><img src="images/icons/tools_32.png" alt="Manage Users" />Send Message</h2>

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
						<form action="submit_message" ENCTYPE=multipart/form-data METHOD=POST>
						  <fieldset>
							  <p>
						    <label>Real name</label>
									<input id="subject" type="text" class="medium" value="Subject"name="subject" /><!-- the value-attribute overwrites the <label>Username</label> --></p>
							  <p>
					      <label>Select an option</label>
									<select name="id_no">

                                                                            <% for(int i=0;i<class_name.length;i++){ %>

                                                                            <option onclick=openURL("ajaxstudent_message.jsp?class_name=<%= class_name[i]%>","reciever")><%= class_name[i]%> </option>
										<% }%>
									</select>
									<small>Select class from the list.</small>
							</p>
                                                        <p>
                                                            <small>ID, Name</small>
                            <div id="reciever"> </div>
                                                        <small>Select Student from the list.</small>

						  <p>
									<textarea class="wysiwyg" name="body"></textarea>
						    </p>
						  <INPUT TYPE=FILE NAME=file>
                          <small> Add attachment</small>
						  </fieldset>

						  <input type="submit" value="Submit" />
						</form>
					</div>
				</div>
			</div><!-- end #content -->

		</div></div><!-- end #bokeh and #container -->

		<div id="footer">
			e-school Management | Powered by <a href="http://www.matacrom.com/">MataCrom Technologies</a> 2010
		</div><!-- end #footer and #bokeh -->


<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div><div id="overlay"></div></body></html>