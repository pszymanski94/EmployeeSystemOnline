<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/_include.jsp" %>

<c:url value = "/admin/task/edit" var="editTaskURL"/>
<c:url value= "/admin/task/delete" var="deleteTaskURL"/>
<c:url value ="/admin/task-add" var="addTask"/>

<html>
<head>
    <title>Zadania</title>
</head>
<body>
<div class="container">

    <h1>Zadania</h1>
    <br>
    <a href="${addTask}" class="btn btn-success" style="margin-bottom:25px;">Dodaj nowe zadanie</a>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Zadanie</th>
                    <th class="text-center">Termin</th>
                    <th class="text-center">Priorytet</th>
                    <th class="text-center">Status</th>
                    <th class="text-center"></th>
                    <th class="text-center"></th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${tasksList}" var="task">
                    <tr>
                        <td>${task.id}</td>
                        <td>${task.title}</td>
                        <td>${task.dueDate}</td>
                        <td><c:choose>
                                <c:when test="${task.priority =='NISKI'}">
                        <div class="bg-success text-white text-center">${task.priority}</div>
                                </c:when>
                            <c:when test="${task.priority =='UMIARKOWANY'}">
                                <div class="bg-info text-white text-center">${task.priority}</div>
                            </c:when>
                            <c:when test="${task.priority =='WYSOKI'}">
                                <div class="bg-danger text-white text-center">${task.priority}</div>
                            </c:when>
                            <c:otherwise>
                            <div class="bg-dark text-white text-center">${task.priority}</div>
                            </c:otherwise>
                        </c:choose>
                        </td>
                        <td>
                            <c:if test="${task.done}"><div class="bg-success text-white text-center">Wykonane</div></c:if>
                            <c:if test="${!task.done}"><div class="bg-info text-white text-center">Do zrobienia</div></c:if>
                        </a>
                        </td>
                        <td><form action = "${editTaskURL}/${task.id}"><button class="btn btn-primary btn-xs">Edytuj</button></form></td>
                        <td><form action = "${deleteTaskURL}/${task.id}" method = "get"><button class="btn btn-danger delete-btn btn-xs">Usuń</button></form></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
