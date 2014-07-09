<%--
    Document   : ajaxstudent_message
    Created on : Oct 31, 2010, 10:17:54 PM
    Author     : tinku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Teacher" %>
<%@page  import="com.model.WebModel" %>
<%@page  import="java.sql.Connection" %>
<%
String class_name=request.getParameter("class_name");

String section[]=WebModel.getsections(class_name,(Connection) this.getServletContext().getAttribute("connection"));

%>

<select name="section">
<%
for (int i=0;i<section.length;i++)

    {

        %>
        <option onclick=openURL("ajaxstudent_principal.jsp?class_name=<%= class_name%>&section=<%=section[i]%>","info") value="<%= section[i]%>" > <%=   section[i] %></option>
        <%
        }
 %>
</select>
  <small>Select section</small>