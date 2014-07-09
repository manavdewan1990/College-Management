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
String school=request.getParameter("class_name");

String section[]=WebModel.getsections(school,(Connection) this.getServletContext().getAttribute("connection"));

%>

<select name="section">
<%
for (int i=0;i<section.length;i++)

    {

        %>
        <option value="<%= section[i]%>"> <%=   section[i] %></option>
        <%
        }
 %>
</select>
  <small>Select section</small>