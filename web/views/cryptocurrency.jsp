<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <img src="<c:url value="/resources/img/${purchase.cryptocurrency.id}.png"/>">
        ${purchase.cryptocurrency.name}<br>
        ${purchase.cryptocurrency.description}<br>
        ${purchase.cryptocurrency.price}<br>
        ${purchase.cryptocurrency.priceTimestamp}<br>
    </body>
</html>
