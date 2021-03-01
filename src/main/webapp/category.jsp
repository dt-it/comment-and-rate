<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<html>
<head>
    <meta charset="UTF-8">
    <title>${requestScope.category.name} - Comment & Rate</title>
    <%@include file="WEB-INF/segments/stylesheets.jspf"%>
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf"%>

    <main>
        <h1 class="category-title">${requestScope.category.name}</h1>
        <p class="category-description">${requestScope.category.description}</p>
        <%@include file="WEB-INF/segments/discovery-list.jspf"%>
    </main>
    <%@include file="WEB-INF/segments/footer.jspf"%>
</div>
</body>
</html>
