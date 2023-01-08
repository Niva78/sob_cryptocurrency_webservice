<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login SOB Cryptocurrency</title>
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
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please sign in</h3>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value="/login.do"/>" role="form" method="post">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="E-mail" name="email" type="text">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="password" type="password">
                                    </div>
                                    <div>
                                        <input name="from" type="hidden" value="${param.from}">
                                    </div>
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                                </fieldset>
                            </form>
                            <c:if test="${not empty message}">
                                <div>
                                    <span class="label label-danger">${message}</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>