<%-- 
    Document   : search
    Created on : May 22, 2017, 9:45:41 AM
    Author     : Thanh
--%>

<%@page import="sample.listofusername.listOfUsernameDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--tglb --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>

    <%--
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            int k = cookies.length - 1;
            while (k >= 0 && cookies[k].getName().equals("JSESSIONID")) {
                k--;
            }
            if (k != -1) {
    %> 
    <font color="red">
    Welcome, <%= cookies[k].getName()%>
    </font>
    
    <%
            }
        }
    %>
    --%>
    <font color="red">
    Welcome, ${sessionScope.USER}
    </font><br />

    <h1>Search Page</h1>
    <form action="search">
        Search value <input type="text" name="txtSearchValue" value="" />
        <input type="submit" value="Search" name="btAction" />
    </form>
    <br />
    <c:set var="searchValue" value="${param.txtSearchValue}"/>
    <c:if test="${not empty searchValue}"> 
        <c:set var="result" value="${requestScope.SEARCHRESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="updateRecord">
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.username}
                                     <input type="hidden" name="txtUsername" value="${dto.username}" />
                                </td>
                                <td>
                                    <%--${dto.password}--%>
                                    <input type="text" name="txtPassword" value="${dto.password}" />
                                </td>
                                <td>
                                    ${dto.lastname}
                                </td>
                                <td>
                                    <%--${dto.role}--%>
                                    <input type="checkbox" name="chkAdmin" value="ADMIN" 
                                           <c:if test="${dto.role}" >
                                               checked="checked"
                                           </c:if>  
                                            />
                                    
                                </td>
                                <td>
                                    <c:url var="urlRewriting" value="deleteRecord">
                                        <c:param name="btAction" value="delete" />
                                        <c:param name="pk" value="${dto.username}" />
                                        <c:param name="lastSearchValue" value="${param.txtSearchValue}" />
                                    </c:url>
                                    <a href="${urlRewriting}">Delete</a>
                                </td>
                                <td>
                                    <input type="submit" name="btAction" value="Update" />
                                    <input type="hidden" name="lastSearchValue" value="${param.txtSearchValue}" />
                                </td>
                            </tr>
                            
                        </form>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
            <c:if test="${empty result}">
                <h2>No record is matched!!!!</h2>
            </c:if>
    </c:if>
    <%--
    <%
        String searchValue = request.getParameter("txtSearchValue");

            if (searchValue != null) {
                List<listOfUsernameDTO> result
                        = (List<listOfUsernameDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Last name</th>
                    <th>Role</th>    
                    <th>Delete</th>    
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (listOfUsernameDTO dto : result) {
                        String urlRewritting = "DieuphoiServlet"
                                + "?btAction=delete"
                                + "&pk="
                                + dto.getUsername()
                                + "&lastSearchValue="
                                + request.getParameter("txtSearchValue");

                %>
            <form action="DieuphoiServlet">
                <tr>
                    <td>
                        <%= ++count%>.     
                    </td>
                    <td>
                        <%= dto.getUsername()%>
                        <input type="hidden" name="txtUsername" 
                               value="<%=dto.getUsername()%>"/>
                    </td>
                    <td>
                        <input type="text" name="txtPassword" 
                               value="<%=dto.getPassword()%>" />
                    </td>
                    <td>
                        <%= dto.getLastname()%>
                    </td>
                    <td>
                        <input type="checkbox" name="chkAdmin" value="ADMIN" 
                               <%
                                   if (dto.isRole()) {
                               %> 
                               checked="checked"
                               <%
                                   }
                               %>
                               />
                    </td>      
                    <td> 
                        <a href="<%= urlRewritting%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" name="btAction" value="Update" />
                        <input type="hidden" name="lastSearchValue" 
                               value="<%= request.getParameter("txtSearchValue")%>" />
                    </td>
                </tr>

            </form>
            <%
                }
            %>
        </tbody>
    </table>

    <%
    } else {
    %>
    <h2>No record is matched!!!</h2>
    <%
            }
        } // end if null
%>
    --%>

</html>
