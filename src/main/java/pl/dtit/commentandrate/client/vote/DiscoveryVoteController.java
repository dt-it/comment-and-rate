package pl.dtit.commentandrate.client.vote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.DiscoveryVote;
import pl.dtit.commentandrate.domain.api.DiscoveryVoteService;

import java.io.IOException;

@WebServlet("/vote")
@ServletSecurity(
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = "USER")
        }
)
public class DiscoveryVoteController extends HttpServlet {
    private DiscoveryVoteService voteService = new DiscoveryVoteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiscoveryVote vote = createVote(request);
        voteService.addVote(vote);
        response.sendRedirect(request.getContextPath());
    }

    private DiscoveryVote createVote(HttpServletRequest request) {
        Integer discoveryId = Integer.valueOf(request.getParameter("id"));
        String voteType = request.getParameter("type");
        String username = request.getUserPrincipal().getName();
        return new DiscoveryVote(username, discoveryId, voteType);
    }
}
