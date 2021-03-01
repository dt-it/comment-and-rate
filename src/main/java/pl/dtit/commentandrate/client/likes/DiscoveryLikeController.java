package pl.dtit.commentandrate.client.likes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.DiscoveryLike;
import pl.dtit.commentandrate.domain.api.DiscoveryLikeService;

import java.io.IOException;

@WebServlet("/like")
@ServletSecurity(
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = "USER")
        }
)
public class DiscoveryLikeController extends HttpServlet {
    private DiscoveryLikeService likeService = new DiscoveryLikeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiscoveryLike discoveryLike = createDiscoveryLike(request);
        likeService.addLike(discoveryLike);
        response.sendRedirect(request.getContextPath());
    }

    private DiscoveryLike createDiscoveryLike(HttpServletRequest request) {
        Integer discoveryId = Integer.valueOf(request.getParameter("id"));
        String likeType = request.getParameter("type");
        String userName = request.getUserPrincipal().getName();
        return new DiscoveryLike(userName, discoveryId, likeType);
    }
}
