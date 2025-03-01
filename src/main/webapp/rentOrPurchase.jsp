<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rent or Purchase</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .option-card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            cursor: pointer;
        }
        .option-card:hover {
            transform: scale(1.05);
        }
        .option-card h3 {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .option-card p {
            font-size: 1rem;
            color: gray;
        }
    </style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center mb-4">Choose an Option</h2>

    <%
        // Retrieve request parameters
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String displayType = "Unknown";

        // Assign proper display type
        if ("movie".equalsIgnoreCase(type)) {
            displayType = "Movie";
        } else if ("sport".equalsIgnoreCase(type)) {
            displayType = "Sport";
        } else if ("tvshow".equalsIgnoreCase(type)) {
            displayType = "TV Show";
        } else if ("event".equalsIgnoreCase(type)) {
            displayType = "Event";
        }
    %>

    <h4 class="text-center"><%= displayType %>: <%= name != null ? name : "Unknown" %></h4>

    <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
            <div class="option-card shadow p-4 text-center bg-light" 
                 onclick="redirectToCheckout('<%= displayType %>', '<%= name %>', 'rent')">
                <img src="img/img23.jpeg" alt="Rent Image">
                <p>Watch this <%= displayType.toLowerCase() %> for a limited time.</p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="option-card shadow p-4 text-center bg-light" 
                 onclick="redirectToCheckout('<%= displayType %>', '<%= name %>', 'purchase')">
                <img src="img/img22.png" alt="Purchase Image">
                <p>Own this <%= displayType.toLowerCase() %> and watch anytime.</p>
            </div>
        </div>
    </div>
</div>

<script>
    function redirectToCheckout(type, name, action) {
        const encodedType = encodeURIComponent(type);
        const encodedName = encodeURIComponent(name);
        window.location.href = `checkout.jsp?type=${encodedType}&name=${encodedName}&action=${action}`;
    }
</script>

<%@include file="component/footer.jsp"%>

</body>
</html>
