<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/_include.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/task-add/save" var="taskAddURL"/>
<c:url value="/admin/task-add/cancel" var="cancelAddURL"/>


<html>
<head>
    <title>Dodaj/edytuj zadanie</title>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                format:"yyyy-MM-dd",
                todayHighlight: true,
                orientation: "bottom auto",
                startDate: new Date()
            });
        } );
    </script>
</head>
<body>

<div class="py-5">
    <div class="container">
        <c:if test="${task.id == null}">
            <h1 class="text-center">Dodaj zadanie</h1>
        </c:if>

        <c:if test="${task.id != null}">
            <h1 class="text-center">Edytuj zadanie</h1>
        </c:if>

        <div class="row">
            <div class="col-md-8 mx-auto">
                <form:form modelAttribute="task" action="${taskAddURL}" method="post">
                    <form:hidden path="id"/>
                    <div class="form-group"><label>Zadanie:</label>
                        <form:input path="title" class="form-control" type="text" placeholder="zadanie"/>
                        <form:errors path="title" cssStyle="color: red"/>
                    </div>

                    <div class="form-group"><label>Data:</label>
                        <form:input id="datepicker" path="dueDate" class="form-control" type="date"/>
                        <form:errors path="dueDate" cssStyle="color: red"/>
                    </div>

                    <div class="form-group"><label>Priorytet:</label>

                            <c:forEach items="${taskPriorityList}" var="value">
                                <form:radiobutton value="${value}" path="priority"/>${value}
                            </c:forEach>

                    </div>

                    <div class="form-group"><label>Status:</label>
                        <form:radiobutton path="done" value="0"/> Do zrobienia
                        <form:radiobutton path="done" value="1"/> Wykonane
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-primary">Zapisz</button>
                            <a href="${cancelAddURL}" class="btn btn-danger">Anuluj</a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
