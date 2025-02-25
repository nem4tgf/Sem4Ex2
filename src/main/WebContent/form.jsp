<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.ProductDAO, model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="paramProduct" class="model.Product" />
<c:if test="${not empty param.id}">
    <c:set var="product" value="<%= ProductDAO.getProductById(Integer.parseInt(request.getParameter("id"))) %>" />
    <c:set target="${paramProduct}" property="id" value="${product.id}" />
    <c:set target="${paramProduct}" property="name" value="${product.name}" />
    <c:set target="${paramProduct}" property="price" value="${product.price}" />
    <c:set target="${paramProduct}" property="description" value="${product.description}" />
</c:if>

<html>
<head>
    <title>Product Form</title>
</head>
<body>
<h2>${empty param.id ? "Add Product" : "Edit Product"}</h2>
<form action="save.jsp" method="post">
    <input type="hidden" name="id" value="${paramProduct.id}" />
    Name: <input type="text" name="name" value="${paramProduct.name}" required /><br/>
    Price: <input type="number" name="price" value="${paramProduct.price}" required /><br/>
    Description: <input type="text" name="description" value="${paramProduct.description}" required /><br/>
    <input type="submit" value="Save" />
</form>
</body>
</html>
