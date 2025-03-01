<%@page import="com.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, com.entity.Movie, com.dao.MovieDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movies</title>
    <%@include file="component/allcss.jsp"%>
    <style>
    
        .movie-card {
            border-radius: 10px;
            overflow: hidden;
            width:100%;
            transition: transform 0.3s ease-in-out;
        }
        .movie-card:hover {
            transform: scale(1.05);
        }
        .movie-card img {
            width: 100%;
            height: 500px;
            object-fit: cover;
        }
        .movie-title {
            font-weight: bold;
            font-size: 1rem;
            margin-top: 5px;
        }
        .movie-details {
            font-size: 0.9rem;
            color: gray;
        }
    </style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center mb-4">Latest Movies</h2>
    <div class="row">
        <%
            MovieDao movieDAO = new MovieDao();
            List<Movie> movieList = movieDAO.getAllMovies();

            for (Movie movie : movieList) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="movie-card shadow p-2">
                <a href="rentOrPurchase.jsp?type=movie&name=<%= movie.getTitle() %>">
                    <img src="uploads/<%= movie.getImagePath() %>" alt="<%= movie.getTitle() %>">
                    <div class="movie-title"><%= movie.getTitle() %></div>
                    <div class="movie-details"><%= movie.getLanguage() %> | <%= movie.getRating() %></div>
                </a>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
