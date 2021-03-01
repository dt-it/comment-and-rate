<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Skomentuj - Comment & Rate</title>
    <%@ include file="WEB-INF/segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/add-comment-form.css">
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf" %>
    <form action="${pageContext.request.contextPath}/comment" method="post" class="comment-form">
        <h2 class="comment-form-title">Dodaj nowy komentarz</h2>
        <label class="comment-form-discovery-title" for="discoveryId">Wpis, który komentujesz:<br>
            <select name="discoveryId" id="discoveryId">
                <c:forEach var="discovery" items="${requestScope.discoveries}">
                    <option value="${discovery.id}">${discovery.title}</option>
                </c:forEach>
            </select>
        </label>
        <textarea name="message" placeholder="Komentarz"></textarea>
        <button class="comment-form-button">Dodaj</button>
    </form>

    <%@include file="WEB-INF/segments/footer.jspf" %>
</div>
</body>
</html>
