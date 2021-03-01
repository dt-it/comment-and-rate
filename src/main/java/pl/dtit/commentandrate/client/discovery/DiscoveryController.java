package pl.dtit.commentandrate.client.discovery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/discovery")
public class DiscoveryController extends HttpServlet {
    private final DiscoveryCommentService commentService = new DiscoveryCommentService();
    private final DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int discoveryId = Integer.parseInt(request.getParameter("id"));
        DiscoveryBasicInfo discovery = discoveryService.findDiscoveryById(discoveryId).orElseThrow();
        request.setAttribute("discovery", discovery);
        List<DiscoveryComment> comments = commentService.findCommentByDiscoveryId(discoveryId);
        request.setAttribute("comments", comments);
        request.getRequestDispatcher("discovery.jsp").forward(request, response);
    }
}
