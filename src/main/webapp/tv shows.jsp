<%@page import="com.entity.TvShows"%>
<%@page import="com.dao.TvShowsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TV Shows</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .tvshow-card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }
        .tvshow-card:hover {
            transform: scale(1.05);
        }
        .tvshow-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .tvshow-title {
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 5px;
        }
        .tvshow-details {
            font-size: 0.9rem;
            color: gray;
        }
    </style>

</head>
<body>

<%@include file="component/navbar.jsp"%>

<!-- TV Shows Section -->
<div class="container mt-4">
    <h2 class="text-center mb-4">Latest TV Shows</h2>
    <div class="row">
        <%
            TvShowsDao tvShowsDao = new TvShowsDao();
            List<TvShows> tvshowList = tvShowsDao.getAllTvShows();

            if (tvshowList.isEmpty()) {
        %>
            <p class="text-center">No TV Shows available at the moment.</p>
        <%
            } else {
                for (TvShows tvShow : tvshowList) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="tvshow-card shadow p-2">
                <a href="rentOrPurchase.jsp?type=tv%20show&name=<%= java.net.URLEncoder.encode(tvShow.getTitle(), "UTF-8") %>">
                    <img src="uploads/<%= tvShow.getImagePath() %>" alt="<%= tvShow.getTitle() %>">
                    <div class="tvshow-title"><%= tvShow.getTitle() %></div>
                    <div class="tvshow-details"><%= tvShow.getLanguage() %> | Rating: <%= tvShow.getRating() %></div>
                </a>
            </div>
        </div>
        <% 
                } 
            }
        %>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
