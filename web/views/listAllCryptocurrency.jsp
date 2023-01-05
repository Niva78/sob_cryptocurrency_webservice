<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOB Cryptocurrency Explorer</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    </head>
    <body>
        
        <c:if test="${not empty sessionEmail}">
            <div>
                <span class="label label-success">Signed in as ${sessionEmail}</span>
                <a href="<c:url value="/profile.do"/>">Profile</a>
            </div>
        </c:if>
        
        <c:if test="${empty sessionEmail}">
            <div>
                <a href="<c:url value="/views/login.jsp"/>">
                    <span class="label label-warning">Log in</span>
                </a>
            </div>
        </c:if>
        
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">/SOBASE/listAllCryptocurrency</li>
                </ol>
            </nav>
            
            <div class="dropdown" style="margin-bottom: 25px">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Sort by
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="<c:url value="/listAllCryptocurrency.do?order=asc"/>">Price: low to high</a></li>
                    <li><a href="<c:url value="/listAllCryptocurrency.do?order=desc"/>">Price: high to low</a></li>
                </ul>
            </div>
            
            <table id="dtOrderExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th class="th-sm">Name</th>
                        <th class="th-sm">Price</th>
                        <th class="th-sm">Price timestamp</th>                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cryptocurrency" items="${cryptocurrencyList}">
                        <tr>
                            <td style="vertical-align: middle;">
                                <a target="_blank" href="<c:url value="cryptocurrency.do?id=${cryptocurrency.id}"/>">
                                    <img src="<c:url value="/resources/img/${cryptocurrency.id}.png"/>" style="padding-left:5px; padding-right: 5px; width: 32px; height: 32px;">
                                    ${cryptocurrency.name}
                                </a>
                                    <br>${cryptocurrency.description}
                            </td>
                            <td style="vertical-align: middle;">${cryptocurrency.price}</td>
                            <td style="vertical-align: middle;">${cryptocurrency.priceTimestamp}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
