<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${customer.name} - My Profile</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    </head>
    <body>
        ${customer.name}
        ${customer.phone}
        ${customer.email}
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Purchase ID</th>
                    <th scope="col">Date</th>
                    <th scope="col">Coin</th>
                    <th scope="col">Coin amount</th>
                    <th scope="col">Coin price (at purchase time)</th>
                    <th scope="col">Amount (€)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="purchase" items="${purchaseList}">
                    <tr>
                        <td>${purchase.id}</td>
                        <td>${purchase.date}</td>
                        <td>${purchase.cryptocurrency.name}</td>
                        <td>${purchase.purchasedAmount}</td>
                        <td>${purchase.cryptocurrency.price}</td>
                        <td>${purchase.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
