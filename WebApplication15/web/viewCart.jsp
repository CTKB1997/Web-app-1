<%-- 
    Document   : viewCart
    Created on : May 29, 2017, 9:28:04 AM
    Author     : Thanh
--%>

<%@page import="java.util.Map"%>
<%@page import="sample.cartobj.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>Your Cart includes</h1>
        
        <% 
            CartObj cart = (CartObj) session.getAttribute("CART");
            if (cart != null) {//Neu ko co thi ko hien 
                Map<String, Integer> items = cart.getItems();
                if (items != null) {
                    %> 
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <form action="removeItem">
                            <% 
                                int count = 0;
                                for (Map.Entry<String, Integer> item : items.entrySet()) {
                                    %> 
                                    <tr>
                                        <td>
                                            <%= ++count %>
                                        </td>
                                        <td>
                                            <%= item.getKey() %>
                                        </td>
                                        <td>
                                            <%= item.getValue() %>
                                        </td>
                                        <td>
                                            <input type="checkbox" name="chkItem" value="<%= item.getKey() %>" />
                                        </td>
                                            
                                    </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td colspan="3">
                                    <a href="shopping.html">Add more Items To Your Cart</a>
                                </td>
                                <td>
                                    <input type="submit" value="Remove Selected Items" name="btAction" />
                                </td>
                            </tr>
                        </form>
                        </tbody>
                    </table>

                    
        
        <%
                    return;
                }
            } //end cart
        %>
        <h2>No cart existed or Mr. Nhan has already stolen.</h2>
    </body>
</html>
