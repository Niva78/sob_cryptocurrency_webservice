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
            <li role="presentation"><a href="<c:url value="/listAllCryptocurrencies.do"/>">Home</a></li>
            <c:if test="${not empty sessionEmail}">
                <li role="presentation"><a href="<c:url value="/profile.do"/>">Profile</a></li>
                <li role="presentation"><a href="<c:url value="/logOut.do?from=/cryptocurrency.do?id=${param.id}"/>">Log out</a></li>
            </c:if>

            <c:if test="${empty sessionEmail}">
                <li role="presentation"><a href="<c:url value="/views/login.jsp?from=cryptocurrency.do?id=${param.id}"/>">Log in</a></li>
                <li role="presentation"><a href="<c:url value="/views/signUp.jsp?from=cryptocurrency.do?id=${param.id}"/>">Sign Up</a></li>
            </c:if>
        </ul>
            
            
        <div class="container">
            <div class="span3 well">
                <center>
                    <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="<c:url value="/resources/img/${purchase.cryptocurrency.id}.png"/>" name="aboutme" width="64" height="64" class="img-circle"></a>
                    <h3>${purchase.cryptocurrency.name}</h3>
                    <em>Description: ${purchase.cryptocurrency.description}</em> <br>
                    <em>Price: ${purchase.cryptocurrency.price}</em> <br>
                    <em>PriceTimestamp: ${purchase.cryptocurrency.priceTimestamp}</em>
                    
                    <div class="col-12">
                        <div class="input-group input-group-lg w-25 mx-auto">
                            
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
                            <div class="alert alert-danger" role="alert">
                                Sign in to purchase...
                            </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <c:if test="${not empty currentPurchase}">
                    <div class="alert alert-success" role="alert">
                        Purchase ID: ${currentPurchase.id} <br>
                        Amount: ${currentPurchase.purchasedAmount} <br>
                        Date: ${currentPurchase.date}
                    </div>
                    </c:if>
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
		</center>
            </div>
        </div>
    </body>
</html>
