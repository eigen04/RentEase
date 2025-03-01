package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.TvShowsDao;
import com.entity.TvShows;

@WebServlet("/admin/addtvshow")
@MultipartConfig
public class AddTvShowsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
            String language = req.getParameter("language");
            String rating = req.getParameter("rating");

            // Handle file upload
            Part part = req.getPart("image");
            String fileName = part.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("/") + "uploads";
            File fileUploadDir = new File(uploadPath);
            if (!fileUploadDir.exists()) {
                fileUploadDir.mkdirs();
            }
            String filePath = uploadPath + File.separator + fileName;
            part.write(filePath);

            // Create Movie object and save to database
            TvShows tvShow = new TvShows(title, language, rating, fileName);
            TvShowsDao tvShowsDao = new TvShowsDao();
            if (tvShowsDao.addTvShows(tvShow)) {
            	resp.sendRedirect(req.getContextPath() + "/admin/add_tvshows.jsp?success=TvShow added successfully");
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/add_tvshows.jsp?error=Failed to add TvShow");
            }
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/admin/add_tvshows.jsp?error=Internal Server Error");
		}
	}
	
	

}
