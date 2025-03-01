<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg" style="background-color: #001f3f;">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand text-white fw-bold" href="index.jsp">&#x1F3AC; RentEase</a>

        <!-- Navbar Toggle for Mobile View -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link text-white" href="add_movies.jsp">Add Movies</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="add_tvshows.jsp">Add TV Shows</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="add_sports.jsp">Add Sports</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="add_events.jsp">Add Events</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="all_purchases.jsp">All Purchases</a></li>
            </ul>

            <!-- Admin Dropdown -->
            <div class="d-flex align-items-center">
    <div class="btn btn-light me-2">👨‍💼 Admin</div>
    <div class="d-flex align-items-center">
    <a href="<%= request.getContextPath() %>/adminlogout" class="btn btn-danger">🚪 Logout</a>
</div>

</div>

        </div>
    </div>
</nav>

<!-- Bootstrap JS (Ensure it's properly linked) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
