<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Dodaj nowy post - Comment & Rate</title>
    <%@ include file="WEB-INF/segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/add-discovery-form.css">
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf"%>

    <form action="${pageContext.request.contextPath}/add" method="post" class="discovery-form">
        <h2 class="discovery-form-title">Dodaj nowy wpis</h2>
        <input name="title" placeholder="Tytul" required>
        <input name="url" placeholder="URL" type="url" required>
        <select name="categoryId">
            <c:forEach var="category" items="${requestScope.categories}">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
        <textarea name="description" placeholder="Opis"></textarea>
        <button class="discovery-form-button">Dodaj</button>
    </form>

    <%@include file="WEB-INF/segments/footer.jspf"%>
</div>
</body>
</html>