<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Transaction, com.entity.User, com.dao.TransactionDao, com.db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .success-msg {
            text-align: center;
            margin-top: 50px;
        }
        .success-msg h2 {
            color: green;
        }
        .error-msg {
            text-align: center;
            color: red;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container">
    <div class="success-msg">
        <h2>✅ Payment Successful!</h2>

        <%
    // Validate user session
    Object userObj = session.getAttribute("userObj");
    if (userObj == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
    User user2 = (User) userObj;
    int userId = user2.getId();

    // Retrieve parameters
    String type = request.getParameter("type");
    String name = request.getParameter("name");
    String action = request.getParameter("action");

    // Debugging: Print received parameters
    System.out.println("Raw Type: " + type);
    System.out.println("Raw Name: " + name);
    System.out.println("Raw Action: " + action);

    // Validate parameters
    if (type == null || type.trim().isEmpty()) {
        type = "Unknown"; // Default fallback
    } else {
        switch (type.toLowerCase()) {
            case "event":
                type = "Event";
                break;
            case "sports":
            case "sport":
                type = "Sports";
                break;
            case "tvshow":
            case "tvshows":
            case "tv shows":
                type = "TV Show";
                break;
            case "movie":
                type = "Movie";
                break;
            default:
                type = "Unknown";
        }
    }

    // Debugging: Print normalized type
    System.out.println("Normalized Type: " + type);

    if (name == null || name.trim().isEmpty() || action == null || action.trim().isEmpty()) {
%>
        <p class="error-msg">❌ Error: Invalid transaction details.</p>
        <a href="index.jsp" class="btn btn-danger">Back to Home</a>
<%
        return;
    }

    // Save transaction using DAO
    TransactionDao transactionDao = new TransactionDao(DBConnect.getConn());
    Transaction transaction = new Transaction(0, userId, name, type, action, null);
    boolean success = transactionDao.addTransaction(transaction);

    if (success) {
%>
        <p>Thank you for your <b><%= action %></b> of <b><%= type %></b>: <b><%= name %></b>.</p>
<%
    } else {
%>
        <p class="error-msg">❌ Error: Transaction could not be recorded. Please contact support.</p>
<%
    }
%>


        <a href="index.jsp" class="btn btn-primary">Back to Home</a>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
