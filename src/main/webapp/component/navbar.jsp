<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.entity.User" %>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="allcss.jsp">

<!-- Get user session -->
<%
    User user = (User) session.getAttribute("userObj");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg" style="background-color: #001f3f;">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand text-white fw-bold" href="index.jsp">🎬 RentEase</a>

        <!-- Navbar Toggle for Mobile View -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <% if (user != null) { %>
                <!-- Show this menu only if the user is logged in -->
                <ul class="navbar-nav ms-3">
                    <li class="nav-item"><a class="nav-link text-white" href="movies.jsp">Movies</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="tv shows.jsp">TV Shows</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="sports.jsp">Sports</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="events.jsp">Events</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="puchases.jsp">My Purchases</a></li>
                </ul>
            <% } %>

            <!-- Push login links to the right -->
            <ul class="navbar-nav ms-auto">
                <% if (user == null) { %>
                    <li class="nav-item"><a class="nav-link text-white" href="userlogin.jsp">👤 User</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="adminlogin.jsp">🛠 Admin</a></li>
                <% } else { %>
                    <li class="nav-item"><a class="nav-link text-white" href="#">Welcome, <%= user.getFullName() %>!</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="userlogout">🚪 Logout</a></li>
                <% } %>
            </ul>

        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
