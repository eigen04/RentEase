<%@page import="com.entity.Sport"%>
<%@page import="com.dao.SportDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sports</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .sport-card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }
        .sport-card:hover {
            transform: scale(1.05);
        }
        .sport-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .sport-title {
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 5px;
        }
        .sport-details {
            font-size: 0.9rem;
            color: gray;
        }
    </style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center mb-4">Latest Sports</h2>
    <div class="row">
        <%
            SportDao sportDao = new SportDao();
            List<Sport> sportList = sportDao.getAllSports();

            if (sportList.isEmpty()) {
        %>
            <p class="text-center">No sports events available at the moment.</p>
        <%
            } else {
                for (Sport sport : sportList) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="sport-card shadow p-2">
                <a href="rentOrPurchase.jsp?type=sport&name=<%= sport.getTitle() %>">
                    <img src="uploads/<%= sport.getImagePath() %>" alt="<%= sport.getTitle() %>">
                    <div class="sport-title"><%= sport.getTitle() %></div>
                    <div class="sport-details"><%= sport.getLanguage() %> | Rating: <%= sport.getRating() %></div>
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
