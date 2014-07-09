<%-- 
    Document   : ajaxstudent_message
    Created on : Oct 31, 2010, 10:17:54 PM
    Author     : tinku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Profile" %>


<%
String designation=(String)session.getAttribute("profile");
Profile pr = (Profile)session.getAttribute(designation);
String class_name=request.getParameter("class_name");

 String [][]reciever=pr.getRecievers(class_name);
 //out.print(reciever[0][0]);
%>

<select name="reciever">
<%
for (int i=0;i<reciever.length;i++)
    
    {
    
        %>
        <option value="<%= reciever[i][0]%>"> <%=  reciever[i][0] + ", " + reciever[i][1] %></option>
        <%
        }
 %>
</select>