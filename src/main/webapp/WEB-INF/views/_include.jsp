<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2017-11-18
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
</head>

<body>
<sec:authentication var="user" property="principal"/>

<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse bg-faded">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="/">EmployeeSystemOnline</a>

    <div class="collapse navbar-collapse">
        <div class="nav navbar-nav mr-auto">
            <a class="nav-item nav-link" href="/admin/employees">Pracownicy</a>
            <a class="nav-item nav-link" href="/admin/todos">Zadania</a>
        </div>
        <sec:authorize access="isAuthenticated()">
            <div class="nav navbar-nav ml-auto">
                <a class="nav-item nav-link" href="/logout">Wyloguj się ${user.username}</a>
            </div>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <div class="navbar-nav ml-auto">
                <a class="nav-item nav-link" href="/login">Zaloguj się!</a>
            </div>
        </sec:authorize>
    </div>
    </div>
</nav>
</body>