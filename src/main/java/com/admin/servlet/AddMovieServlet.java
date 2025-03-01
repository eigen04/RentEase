package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.dao.MovieDao;
import com.entity.Movie;

@WebServlet("/admin/addmovie")
@MultipartConfig
public class AddMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            String title = request.getParameter("title");
            String language = request.getParameter("language");
            String rating = request.getParameter("rating");

            // Handle file upload
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("/") + "uploads";
            File fileUploadDir = new File(uploadPath);
            if (!fileUploadDir.exists()) {
                fileUploadDir.mkdirs();
            }
            String filePath = uploadPath + File.separator + fileName;
            part.write(filePath);

            // Create Movie object and save to database
            Movie movie = new Movie(title, language, rating, fileName);
            MovieDao movieDAO = new MovieDao();
            if (movieDAO.addMovie(movie)) {
            	response.sendRedirect(request.getContextPath() + "/admin/add_movies.jsp?success=Movie added successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/add_movies.jsp?error=Failed to add movie");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/add_movies.jsp?error=Internal Server Error");
        }
    }
}
