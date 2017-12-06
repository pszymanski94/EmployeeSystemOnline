<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/_include.jsp" %>

<c:url value="/employee/edit" var="editEmployeeURL"/>
<c:url value="/employee/delete" var="deleteEmployeeURL"/>

<html>
<head>
    <title>Pracownicy</title>
</head>
<body>
<div class="container">

    <h1>Pracownicy:</h1>
    <br>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Imię</th>
                    <th class="text-center">Nazwisko</th>
                    <th class="text-center">Data urodzenia</th>
                    <th class="text-center">Adres</th>
                    <th class="text-center">Miejscowość</th>
                    <th class="text-center">Status</th>
                    <th class="text-center"></th>
                    <th class="text-center"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${employeeList}" var="employee">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.subname}</td>
                        <td>${employee.date_of_birth}</td>
                        <td>${employee.street}</td>
                        <td>${employee.city}</td>
                        <c:choose>
                            <c:when test="${employee.status=='PRACUJE'}">
                                <td>
                                    <div class="bg-success text-white text-center">${employee.status}</div>
                                </td>
                            </c:when>
                            <c:when test="${employee.status=='ZWOLNIONY'}">
                                <td>
                                    <div class="bg-danger text-white text-center">${employee.status}</div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <div class="bg-primary text-white text-center">${employee.status}</div>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <form action="${editEmployeeURL}/${employee.id}">
                                <button class="btn btn-primary btn-xs">Edytuj</button>
                            </form>
                        </td>
                        <td>
                            <form action="${deleteEmployeeURL}/${employee.id}" method="post">
                                <button class="btn btn-danger delete-btn btn-xs">Usuń</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
