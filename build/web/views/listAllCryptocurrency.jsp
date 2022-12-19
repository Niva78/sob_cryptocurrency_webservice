<%-- 
    Document   : listAllUser
    Created on : 16 dic 2022, 14:05:28
    Author     : Jarvis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List cryptocurrency</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    </head>
    <body>
        <div class="container">            
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">/SOBASE/listAllCryptocurrency</li>
                </ol>
            </nav>
            <c:forEach var="cryptocurrency" items="${cryptocurrencyList}">
                <div>
                    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                        <img class="card-img-top" src="<c:url value="/resources/img/cat.png"/>" alt="Card image cap">
                        <h5>${cryptocurrency.name}</h5>
                    </a>
                </div>
                <div class="collapse" id="collapseExample">
                    <div class="card-group">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text">
                                    description: ${cryptocurrency.description} <br>
                                    price: ${cryptocurrency.price}
                                </p>
                                <p class="card-text"><small class="text-muted">priceTimestamp: ${cryptocurrency.priceTimestamp}</small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
