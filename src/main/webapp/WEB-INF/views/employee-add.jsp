<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/_include.jsp" %>

<c:url value="/employee-add/save" var="employeeAddURL"/>
<c:url value="/employee-add/cancel" var="cancelAddURL"/>

<html>
<head>
    <title>Dodaj/edytuj pracownika</title>
</head>
<body>
<div class="py-5">
    <div class="container">
        <c:if test="${employee.id == null}">
            <h1 class="text-center">Dodaj pracownika</h1>
        </c:if>

        <c:if test="${employee.id != null}">
            <h1 class="text-center">Edytuj pracownika</h1>
        </c:if>

        <div class="row">
            <div class="col-md-8 mx-auto">
                <form:form modelAttribute="employee" action="${employeeAddURL}" method="post" role="form">

                <form:hidden path="id"/>

                <div class="form-group"><label>Imię:</label>
                    <form:input path="name" type="text" id="name" class="form-control"
                                placeholder="Podaj imię"/>
                    <form:errors path="name" cssStyle="color: red"/>
                </div>

                <div class="form-group"><label>Nazwisko:</label>
                    <form:input path="subname" type="text" id="subname" class="form-control"
                                placeholder="Podaj nazwisko"/>
                    <form:errors path="subname" cssStyle="color: red"/>
                </div>

                <div class="form-group"><label>Data urodzenia:</label>
                    <form:input path="date_of_birth" type="date" id="date_of_birth" class="form-control"/>
                    <form:errors path="date_of_birth" cssStyle="color: red"/>
                </div>

                <div class="form-group"><label>Adres:</label>
                    <form:input path="street" type="text" id="street" class="form-control"
                                placeholder="Podaj adres"/>
                    <form:errors path="street" cssStyle="color: red"/>
                </div>

                <div class="form-group"><label>City:</label>
                    <form:input path="city" type="text" id="city" class="form-control"
                                placeholder="Podaj miasto"/>
                    <form:errors path="city" cssStyle="color: red"/>
                </div>

                <div class="form-group"><label>Status:</label>
                    <br>
                    <form:select path="status">
                        <c:forEach items="${employeeStatusList}" var="value">
                            <form:option value="${value}">${value}</form:option>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="text-center">
                    <div class="btn-group text-center">
                        <button type="submit" class="btn btn-primary">Zapisz</button>
                        <a href="${cancelAddURL}" class="btn btn-danger">Anuluj</a>
                    </div>
                </div>
            </div>
            </form:form>
        </div>
    </div>
</div>
</div>
</body>
</html>
