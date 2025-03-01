<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Transaction" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.dao.TransactionDao" %>
<%@ page import="com.db.DBConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Purchases</title>
    <%@include file="component/allcss.jsp" %>
    <style>
        .table-container {
            max-width: 800px;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
        }
        .no-data {
            text-align: center;
            font-size: 1.2rem;
            color: gray;
            padding: 20px;
        }
    </style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center mb-4">My Purchases & Rentals</h2>

    <div class="table-container">
        <%
            // Get the user session
            Object obj = session.getAttribute("userObj");
            if (obj == null) {
                response.sendRedirect("userlogin.jsp"); // Redirect if session is null
                return; // Stop execution
            }

            User currentUser = (User) obj; 
            int userId = currentUser.getId(); 

            // Fetch transactions using DAO
            TransactionDao transactionDao = new TransactionDao(DBConnect.getConn());
            List<Transaction> transactions = transactionDao.getTransactionsByUserId(userId);
        %>

        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Type</th>
                    <th>Transaction</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <% if (transactions.isEmpty()) { %>
                    <tr><td colspan="4" class="no-data">No purchases or rentals found.</td></tr>
                <% } else { %>
                    <% for (Transaction t : transactions) { %>
                        <tr>
                            <td><%= t.getItemName() %></td>
                            <td><%= t.getItemType() %></td>
                            <td><%= t.getTransactionType() %></td>
                            <td><%= t.getTransactionDate() %></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
