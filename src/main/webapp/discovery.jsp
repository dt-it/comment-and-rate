<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<html>
<head>
    <meta charset="UTF-8">
    <title>${requestScope.discovery.title} - Comment & Rate</title>
    <%@include file="WEB-INF/segments/stylesheets.jspf"%>
</head>
<body>
<div class="container">
    <%@include file="WEB-INF/segments/header.jspf"%>

    <main>
        <article class="discovery">
            <h2 class="discovery-header"><c:out value="${discovery.title}"/></h2>
            <p class="discovery-details">Dodane przez: ${discovery.author}, ${discovery.dateAdded.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))}</p>
            <a href="<c:out value="${discovery.url}"/>" target="_blank" class="discovery-link"><c:out value="${discovery.url}"/></a>
            <p class="discovery-description"><c:out value="${discovery.description}"/></p>
            <section class="discovery-bar">
                <a href="${pageContext.request.contextPath.concat('/vote?id=').concat(discovery.id).concat('&type=UP')}" class="discovery-link upvote">
                    <i class="fas fa-chevron-up discovery-upvote"></i>
                </a>
                <p class="discovery-votes">${discovery.voteCount}</p>
                <a href="${pageContext.request.contextPath.concat('/vote?id=').concat(discovery.id).concat('&type=DOWN')}" class="discovery-link downvote">
                    <i class="fas fa-chevron-down discovery-downvote"></i>
                </a>

                <a href="${pageContext.request.contextPath.concat('/like?id=').concat(discovery.id).concat('&type=LIKE')}" class="discovery-link discovery-like">&nbsp&nbsp
                    <i class="far fa-star"></i>
                    Dodaj do ulubionych
                </a>&nbsp&nbsp
                <a href="${pageContext.request.contextPath.concat('/comment?id=').concat(discovery.id)}" class="discovery-link discovery-comment">
                    <i class="far fa-comment-alt"></i>
                    Skomentuj!
                </a>
            </section>
            <div>
                <%@include file="WEB-INF/segments/comments-list.jspf"%>
            </div>
        </article>
    </main>
    <%@include file="WEB-INF/segments/footer.jspf"%>
</div>
</body>
</html>
