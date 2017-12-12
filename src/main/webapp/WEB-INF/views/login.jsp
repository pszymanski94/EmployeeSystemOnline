<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include.jsp" %>

<html>
<head>
    <title>Zaloguj się!</title>
</head>
<body>

<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>

<div class="container">

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2>Zaloguj się</h2>
                </div>
                </div>

                <div class="panel-body" style="padding-top: 30px;">
                    <form:form action="/login" method="post">


                        <c:if test="${param.error != null}">
                            <div class="alert alert-danger">
                                <p class="text-center">Nieprawidłowa nazwa użytkownika lub hasło</p>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="login">
                        </div>

                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="hasło">
                        </div>

                        <div class="form-group" style="padding-top: 10px;">
                            <input class="btn btn-success" type="submit" value="Zaloguj się"/>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
