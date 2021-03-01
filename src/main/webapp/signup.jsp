<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Zarejestruj się - Comment & Rate</title>
    <%@include file="WEB-INF/segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/forms.css">
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf" %>

    <form action="${pageContext.request.contextPath}/signup" method="post" class="user-form">
        <h2 class="user-form-title">Zarejestruj się! <br>Comment & Rate</h2>
        <input name="username" placeholder="Nazwa użytkownika" required>
        <input name="email" placeholder="Email" type="email" required>
        <input name="password" placeholder="Hasło" type="password" required>
        <button class="user-form-button">Zarejestruj się</button>
    </form>

    <%@include file="WEB-INF/segments/footer.jspf" %>
</div>
</body>
</html>