<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${purchase.cryptocurrency.name} - SOB Cryptocurrency Explorer</title>
    </head>
    <body>
        <c:if test="${not empty sessionEmail}">
            <div>
                Logged in as: ${sessionEmail}
            </div>
        </c:if>
        <c:if test="${empty sessionEmail}">
            <div>
                <input type="button" onclick="location.href='http://localhost:8080/SOBASE/login.do'" value="Log in">
            </div>
        </c:if>
        <img src="<c:url value="/resources/img/${purchase.cryptocurrency.id}.png"/>">
        ${purchase.cryptocurrency.name}<br>
        ${purchase.cryptocurrency.description}<br>
        ${purchase.cryptocurrency.price}<br>
        ${purchase.cryptocurrency.priceTimestamp}<br>
    </body>
</html>
