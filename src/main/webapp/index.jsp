<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Comment & Rate</title>
    <%@include file="WEB-INF/segments/stylesheets.jspf"%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">--%>
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf"%>

    <aside class="categories">
        <ul>
            <c:forEach var="category" items="${requestScope.categories}">
                <li><a href="${pageContext.request.contextPath.concat('/category?id=').concat(category.id)}">${category.name}</a></li>
            </c:forEach>
        </ul>
    </aside>

    <main>
        <%@include file="WEB-INF/segments/discovery-list.jspf"%>
    </main>
    <%@include file="WEB-INF/segments/footer.jspf"%>
</div>
</body>
</html>