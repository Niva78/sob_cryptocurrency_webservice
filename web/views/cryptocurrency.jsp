<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${purchase.cryptocurrency.name} - SOB Cryptocurrency Explorer</title>
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
            <li role="presentation" class="active"><a href="<c:url value="/listAllCryptocurrency.do"/>">Home</a></li>
            <c:if test="${not empty sessionEmail}">
                <li role="presentation"><a href="<c:url value="/profile.do"/>">Profile</a></li>
            </c:if>

            <c:if test="${empty sessionEmail}">
                <li role="presentation"><a href="<c:url value="/views/login.jsp"/>">Log in</a></li>
            </c:if>
        </ul>
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="<c:url value="/resources/img/${purchase.cryptocurrency.id}.png"/>" alt="...">
                    <div class="caption">
                        <h3>${purchase.cryptocurrency.name}</h3>
                        <p>Description: ${purchase.cryptocurrency.description}</p>
                        <p>Price: ${purchase.cryptocurrency.price}</p>
                        <p>PriceTimestamp: ${purchase.cryptocurrency.priceTimestamp}</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <c:if test="${not empty sessionEmail}">
                                            <form action="<c:url value="purchase.do?id=${purchase.cryptocurrency.id}"/>" role="form" method="post">
                                                <fieldset>
                                                    <span class="input-group-btn">
                                                        <input type="text" class="form-control" placeholder="Purchase amount..." name="purchasedAmount">
                                                        <input class="btn btn-primary" type="submit" value="Buy">
                                                    </span>
                                                </fieldset>
                                            </form>
                                        </c:if>
                                        <c:if test="${empty sessionEmail}">
                                            <span class="input-group-btn" style="pointer-events: none; cursor: not-allowed; opacity: 0.65">
                                                <input type="text" class="form-control" placeholder="Sign in to purchase...">
                                                <button class="btn btn-primary" type="button">Buy</button>
                                            </span>
                                        </c:if>
                                </div><!-- /input-group -->
                                <c:if test="${not empty currentPurchase}">
                                    <div class="alert alert-success" role="alert">
                                        Purchase ID: ${currentPurchase.id} <br>
                                        Amount: ${currentPurchase.purchasedAmount} <br>
                                        Date: ${currentPurchase.date}
                                    </div>
                                </c:if>
                            </div><!-- /.col-lg-6 -->
                        </div><!-- /.row -->
                    </div>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Time</th>
                    <th scope="col">Amount (${purchase.cryptocurrency.name})</th>
                    <th scope="col">Amount (€)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${purchase.date}</td>
                    <td>${purchase.purchasedAmount}</td>
                    <td>${purchase.price}</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
