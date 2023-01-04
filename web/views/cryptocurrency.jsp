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
        
        <c:if test="${empty sessionEmail}">
            <div>
                <a href="<c:url value="/views/login.jsp"/>">
                    <span class="label label-warning">Log in</span>
                </a>
            </div>
        </c:if>
        
        
        <div class="row">
          <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
              <img src="<c:url value="/resources/img/${purchase.cryptocurrency.id}.png"/>" alt="...">
              <div class="caption">
                <h3>${purchase.cryptocurrency.name}</h3>
                <p>${purchase.cryptocurrency.description}</p>
                <p>${purchase.cryptocurrency.price}</p>
                <p>${purchase.cryptocurrency.priceTimestamp}</p>
                <p><a href="#" class="btn btn-primary" role="button">Buy Coin</a></p>
              </div>
            </div>
          </div>
        </div>
        
    </body>
</html>
