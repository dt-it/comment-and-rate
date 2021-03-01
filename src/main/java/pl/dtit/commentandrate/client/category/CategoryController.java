package pl.dtit.commentandrate.client.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.CategoryFullInfo;
import pl.dtit.commentandrate.domain.api.CategoryService;
import pl.dtit.commentandrate.domain.api.DiscoveryBasicInfo;
import pl.dtit.commentandrate.domain.api.DiscoveryService;

import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        CategoryFullInfo category = categoryService.findById(categoryId).orElseThrow();
        request.setAttribute("category", category);
        List<DiscoveryBasicInfo> discoveries = discoveryService.findByCategory(categoryId);
        request.setAttribute("discoveries", discoveries);
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }
}
