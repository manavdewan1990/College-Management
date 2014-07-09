<%--
    Document   : ajaxstudent_message
    Created on : Oct 31, 2010, 10:17:54 PM
    Author     : tinku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Teacher" %>


<%
Teacher pr = (Teacher)session.getAttribute("teacher");
String class_name=request.getParameter("class_name");
String section=request.getParameter("section");
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
									<th width="11%">Lecture Attended</th>

								</tr>
							</thead>

							<tfoot>
								<tr>
									<td height="31" colspan="4">&nbsp;</td>
								</tr>
							</tfoot>

							<tbody>

								<tr>
                                                                    
								<%
for (int i=0;i<reciever.length;i++)

    {
    int counter=0;

        %>
        <tr>
        <td> <%= ++counter %> </td>
        <td><%=  reciever[i][1] %> </td>
        <td><%=  reciever[i][0] %> </td>
        <td>
            <input type="text" name="<%=reciever[i][0]%>" maxlength="3">
                                                        
         </tr>
        <%
        }
 %>

								



							</tbody>

						</table>
    

  </div><!-- end .content-box-content -->

			  </div><!-- end .content-box -->


