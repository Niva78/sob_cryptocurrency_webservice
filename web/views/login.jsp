<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - SOB Cryptocurrency Explorer</title>
    </head>
    <body>
        <div>
            <div>
                <h2>Log in</h2>
                <div>
                    <div>
                        <form action="<c:url value="/login.do"/>" class="form-horizontal" method="post">
                            <div>
                                <label>Email</label>
                                <div>
                                    <input type="text" name="email" value="${email}" />
                                </div>
                            </div>
                            <div>
                                <label>Password</label>
                                <div>
                                    <input type="text" name="password" value="${password}" />
                                </div>
                            </div>
                            <div>
                                <!-- Button -->
                                <div>
                                    <input type="submit" value="Log in" />
                                </div>
                            </div>
                        <form>
                        <c:if test="${not empty message}">
                            <div>
                                ${message}        
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
	</div>
    </body>
</html>
