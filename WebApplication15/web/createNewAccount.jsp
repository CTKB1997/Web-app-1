<%-- 
    Document   : createNewAccount
    Created on : May 31, 2017, 9:14:36 AM
    Author     : Thanh
--%>

<%@page import="sample.listofusername.listOfUsernameCreateError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
    </head>
    <body>
        <h1>Create New Account</h1>
        <form action="createRecord" method="POST">
            <c:set var="errors" value="${requestScope.CREATEERROR}" />
            Username* <input type="text" name="txtUsername" value="" />(6-20 chars)<br />
            <c:if test="${not empty errors.usernameLengthErr}">
                <font color="red">
                ${errors.usernameLengthErr}<br/>
                </font>
            </c:if>
            Password* <input type="password" name="txtPassword" value="" />(6-30 chars)<br />
            <c:if test="${not empty errors.passwrdLengthErr}">
                <font color="red">
                ${errors.passwrdLengthErr}<br/>
                </font>
            </c:if>
            Confirm* <input type="password" name="txtConfirm" value="" /><br />
            <c:if test="${not empty errors.confirmNotMatch}">
                <font color="red">
                ${errors.confirmNotMatch}<br/>
                </font>
            </c:if>
            Full name <input type="text" name="txtFullname" value="" />(2-50 chars)<br />
            <c:if test="${not empty errors.fullNameLengthErr}">
                <font color="red">
                ${errors.fullNameLengthErr}<br />
                </font>
            </c:if>
            <input type="submit" value="Create New Account" name="btAction" />
            <input type="reset" value="Reset" />
        </form>      
    <c:if test="${not empty errors.usernameIsExists}">
        <font color="red">
        ${errors.usernameIsExists}
        </font>
    </c:if>
    <%--
    <h1>Create New Account</h1>
    <form action="DieuphoiServlet" method="POST">
        <% 
            listOfUsernameCreateError errors = (listOfUsernameCreateError) request.getAttribute("CREATEERROR");
            
        %>
        Username* <input type="text" name="txtUsername" value="<%= request.getParameter("txtUsername") %>" />(6-20 chars)<br />
        <% 
            if (errors != null) {
                if (errors.getUsernameLengthErr() != null) {
                    %>
                    <font color ="red">
                        <%= errors.getUsernameLengthErr() %>
                    </font><br />
                    <%
                }
                
            }
        
        %>
        Password* <input type="password" name="txtPassword" value="" />(6-30 chars)<br />
        <% 
            if (errors != null) {
                if (errors.getPasswrdLengthErr() != null) {
                    %>
                    <font color ="red">
                        <%= errors.getPasswrdLengthErr() %>
                    </font><br />
                    <%
                }
                
            }
        
        %>
        Confirm* <input type="password" name="txtConfirm" value="" /><br />
        <% 
            if (errors != null) {
                if (errors.getConfirmNotMatch() != null) {
                    %>
                    <font color ="red">
                        <%= errors.getConfirmNotMatch() %>
                    </font><br />
                    <%
                }
                
            }
        
        %>
        Full name <input type="text" name="txtFullname" value="<%= request.getParameter("txtFullname") %>" />(2-50 chars)<br />
        <% 
            if (errors != null) {
                if (errors.getFullNameLengthErr() != null) {
                    %>
                    <font color ="red">
                        <%= errors.getFullNameLengthErr() %>
                    </font><br />
                    <%
                }
                
            }
        
        %>
        <input type="submit" value="Create New Account" name="btAction" />
        <input type="reset" value="Reset" />
    </form><br />
        <% 
            if (errors != null) {
                if (errors.getUsernameIsExists() != null) {
                    %>
                    <font color ="red">
                        <%= errors.getUsernameIsExists() %>
                    </font><br />
                    <%
                }
                
            }
        
        %>
    --%>
</body>
</html>
