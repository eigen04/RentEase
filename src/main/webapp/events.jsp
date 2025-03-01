<%@page import="com.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, com.entity.Event, com.dao.EventDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .movie-card {
            border-radius: 10px;
            overflow: hidden;
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
    <h2 class="text-center mb-4">Latest Events</h2>
    <div class="row">
        <%
            EventDao eventDao = new EventDao();
            List<Event> eventList = eventDao.getAllEvents();

            for (Event event : eventList) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="movie-card shadow p-2">
                <a href="rentOrPurchase.jsp?type=event&name=<%= event.getTitle() %>">
                    <img src="uploads/<%= event.getImagePath() %>" alt="<%= event.getTitle() %>">
                    <div class="event-title"><%= event.getTitle() %></div>
                    <div class="event-details"><%= event.getLanguage() %> | <%= event.getRating() %></div>
                </a>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
