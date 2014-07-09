<%--
    Document   : ajaxstudent_message
    Created on : Oct 31, 2010, 10:17:54 PM
    Author     : tinku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="com.model.Admin" %>
<%@page  import="com.model.WebModel" %>
<%@page  import="java.sql.Connection" %>
<%
String designation=(String)session.getAttribute("profile");
String school=request.getParameter("school");
//out.println(designation);

if (designation.equals("admin"))
    {
    Admin ad=(Admin)session.getAttribute("admin");
    ad.setSchool(school);
    out.print(ad.getSchool());
    }


String class_name[]=WebModel.getClasses(school,(Connection) this.getServletContext().getAttribute("connection"));

%>

<select name="class_name">
<%
for (int i=0;i<class_name.length;i++)

    {

        %>
        <option onclick=openURL("pajax_section.jsp?class_name=<%= class_name[i]%>","section") value="<%= class_name[i]%>"> <%=   class_name[i] %></option>
        <%
        }
 %>
</select>
  <small>Select Class Name</small>