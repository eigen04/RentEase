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

import com.dao.EventDao;
import com.entity.Event;

@WebServlet("/admin/addevent")
@MultipartConfig
public class AddEventServlet extends HttpServlet {
	
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
            Event event = new Event(title, language, rating, fileName);
            EventDao eventDao = new EventDao();
            if (eventDao.addEvent(event)) {
            	response.sendRedirect(request.getContextPath() + "/admin/add_events.jsp?success=Event added successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/add_events.jsp?error=Failed to add event");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/add_events.jsp?error=Internal Server Error");
        }
    }

}
