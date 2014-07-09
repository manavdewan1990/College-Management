<%--
    Document   : ajaxstudent_message
    Created on : Oct 31, 2010, 10:17:54 PM
    Author     : tinku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Profile" %>


<%
String designation=(String)session.getAttribute("profile");
Profile pr=null;
if (designation.equals("principal"))
 pr = (Profile)session.getAttribute("principal");
    else if (designation.equals("admin"))
        {
        pr=(Profile)session.getAttribute("admin");
        }


String class_name=request.getParameter("class_name");
String section=request.getParameter("section");
//out.println(section);
//out.println(class_name);
out.println(class_name + section);
 String [][]reciever=pr.getRecievers(class_name,section);
 //out.print(reciever[0][0]);
%>




<div >
					<div class="content-box-header">
						<h3>Students</h3>
					</div><!-- end .content-box-header -->

					<div class="content-box-content">

						<table width="109%" height="200" border="1" class="pagination" rel="10"><!-- add the class .pagination to dynamically create a working pagination! The rel-attribute will tell how many items there are per page -->
							<thead>
								<tr>
									<th width="14%" height="64">Sr no</th>
								  <th width="30%">Name</th>
									<th width="37%">ID</th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<td height="31" colspan="3">&nbsp;</td>
								</tr>
							</tfoot>

							<tbody>
                                                            <%
for (int i=0;i<reciever.length;i++)

    {
    int counter=0;

        %>
							  <tr>
        <td> <%= ++counter %> </td>
        <td><a href="pview_student_profile.jsp?sid_no=<%=reciever[i][0]%>"><%=  reciever[i][1] %> </a></td>
        <td><%=  reciever[i][0] %> </td>
        </tr>
        <%
        }
 %>





							</tbody>

						</table>


</div><!-- end .content-box-content -->

			  </div><!-- end .content-box -->


