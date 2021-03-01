package pl.dtit.commentandrate.client.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.*;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("")
public class HomeController extends HttpServlet {
    private DiscoveryService discoveryService = new DiscoveryService();
    private CategoryService categoryService = new CategoryService();
    private DiscoveryCommentService commentService = new DiscoveryCommentService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DiscoveryBasicInfo> discoveries = discoveryService.findAll();
        request.setAttribute("discoveries", discoveries);

        List<CategoryName> categories = categoryService.findAllCategoryNames();
        request.setAttribute("categories", categories);

        List<DiscoveryComment> comments = commentService.findAll();
        request.setAttribute("comments", comments);

        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

}
