package pl.dtit.commentandrate.client.discovery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.dtit.commentandrate.domain.api.CategoryName;
import pl.dtit.commentandrate.domain.api.CategoryService;
import pl.dtit.commentandrate.domain.api.DiscoverySaveRequest;
import pl.dtit.commentandrate.domain.api.DiscoveryService;

import java.io.IOException;
import java.util.List;

@WebServlet("/add")
@ServletSecurity(
        httpMethodConstraints ={
                @HttpMethodConstraint(value = "GET",rolesAllowed = "USER"),
                @HttpMethodConstraint(value = "POST", rolesAllowed = "USER")
        }
)
public class AddDiscoveryController extends HttpServlet {
    CategoryService categoryService = new CategoryService();
    DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryName> categories = categoryService.findAllCategoryNames();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("add-discovery.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiscoverySaveRequest saveRequest = createSaveRequest(request);
        discoveryService.add(saveRequest);
        response.sendRedirect(request.getContextPath());
    }

    private DiscoverySaveRequest createSaveRequest(HttpServletRequest request) {
        String loggedInUsername = request.getUserPrincipal().getName();
        return new DiscoverySaveRequest(request.getParameter("title"), request.getParameter("url"),
                request.getParameter("description"), Integer.valueOf(request.getParameter("categoryId")),
                loggedInUsername);
    }
}
