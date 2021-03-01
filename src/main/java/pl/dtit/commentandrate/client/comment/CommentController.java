package pl.dtit.commentandrate.client.comment;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.DiscoveryBasicInfo;
import pl.dtit.commentandrate.domain.api.DiscoveryComment;
import pl.dtit.commentandrate.domain.api.DiscoveryCommentService;
import pl.dtit.commentandrate.domain.api.DiscoveryService;
import pl.dtit.commentandrate.domain.discovery.Discovery;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/comment")
@ServletSecurity(
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = "USER"),
                @HttpMethodConstraint(value = "POST", rolesAllowed = "USER")
        }
)
public class CommentController extends HttpServlet {
    DiscoveryCommentService commentService = new DiscoveryCommentService();
    DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DiscoveryBasicInfo> discoveries = discoveryService.findById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("discoveries", discoveries);
        request.getRequestDispatcher("comment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiscoveryComment comment = createComment(request);
        commentService.addComment(comment);
        response.sendRedirect(request.getContextPath());
    }

    private DiscoveryComment createComment(HttpServletRequest request) {
        String loggedInUsername = request.getUserPrincipal().getName();
        String message = request.getParameter("message");
        Integer discoveryId = Integer.valueOf(request.getParameter("discoveryId"));
        return new DiscoveryComment(loggedInUsername, discoveryId, message, LocalDateTime.now());
    }
}
