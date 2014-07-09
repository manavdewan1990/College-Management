<%-- 
    Document   : notice
    Created on : Oct 27, 2010, 3:42:03 PM
    Author     : tinku
--%>
<%@page  import="com.model.Profile" %>
<%@page  import="com.model.Notice" %>
<%@page  import="com.model.WebModel" %>
<%@page  import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <%

  int number=  Integer.parseInt(request.getParameter("number"));
     String designation= (String) session.getAttribute("profile");
    Profile pr= (Profile)session.getAttribute(designation);


    //notices
    Notice notice=pr.getNotice();
  
 
    %>

						<div class="modalhead">
							<img src="images/modaltop.png" alt="Modal arrow" />
                                                        <h3>Notice </h3>
						</div>

						<div class="modalcontent">
                                                    <div class="message" id="dynamicURL">


                                                        <div class="author"> <h5 style="color: black"> Subject:</h5> <%=notice.getSubject()[number]%> <hr></div>
    <div class="content"><h4> Body:</h4>           <%=notice.getBody()[number]%><hr></div>
    <div class="datetime"> <h6> Date:</h6> <%=notice.getDate()[number]%>  </div>
   
<div class="modalfoot">
                                                    <a href="data/<%= notice.getFile()[number] %>" > <img src="images/small_download.jpg" alt="New message" />    Download Attachment
                                                        </a>
						</div>

	</div>


						</div>


				