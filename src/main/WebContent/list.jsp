<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.ProductDAO, model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="products" class="model.ProductDAO" scope="page" />
<c:set var="productList" value="<%= ProductDAO.getAllProducts() %>" />

<html>
<head>
    <title>Product List</title>
</head>
<body>
<h2>Product List</h2>
<a href="form.jsp">Add New Product</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>
                <a href="form.jsp?id=${product.id}">Edit</a> |
                <a href="delete.jsp?id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
