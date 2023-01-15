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
        
        <c:if test="${not empty sessionEmail}">
            <div>
                <span class="label label-success">Signed in as ${sessionEmail}</span>
            </div>
        </c:if>
        
        <ul class="nav nav-tabs">
            <li role="presentation"><a href="<c:url value="/listAllCryptocurrencies.do"/>">Home</a></li>
            <c:if test="${not empty sessionEmail}">
                <li role="presentation" class="active"><a href="<c:url value="/profile.do"/>">Profile</a></li>
                <li role="presentation"><a href="<c:url value="/logOut.do?from=/listAllCryptocurrencies.do"/>">Log out</a></li>
            </c:if>
        </ul>
        <div class="container">
            <div class="span3 well">
                <center>
                    <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" name="aboutme" width="140" height="140" class="img-circle"></a>
                    <h3>${customer.name}</h3>
                    <em>Phone: ${customer.phone}</em> <br>
                    <em>Email: ${customer.email}</em>
		</center>
            </div>
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
        </div>
    </body>
</html>
