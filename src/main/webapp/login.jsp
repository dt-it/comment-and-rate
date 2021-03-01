<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Zaloguj się - Comment & Rate</title>
    <%@include file="WEB-INF/segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/forms.css">
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf" %>

    <form action="j_security_check" method="post" class="user-form">
        <h2 class="user-form-title">Zaloguj się <br>Comment & Rate</h2>
        <input name="j_username" placeholder="Nazwa użytkownika" required>
        <input name="j_password" placeholder="Hasło" type="password" required>
        <button class="user-form-button">Zaloguj się</button>
        <p class="register">Nie masz konta? <a class="register-link" href="${pageContext.request.contextPath}/signup"><i>Zarejestruj się</i></a></p>
    </form>

    <%@include file="WEB-INF/segments/footer.jspf" %>
</div>
</body>
</html>