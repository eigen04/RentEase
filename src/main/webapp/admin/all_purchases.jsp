<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Purchases</title>
    <%@include file="../component/allcss.jsp" %>
    <style>
        .table-container {
            max-width: 1000px;
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

<%@include file="navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center mb-4">All Purchases & Rentals</h2>

    <div class="table-container">
        <%
            // Ensure only admin can access this page
            User adminSession = (User) session.getAttribute("adminObj");
if (adminSession == null) {
    response.sendRedirect("../adminlogin.jsp");
    return;
}

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            boolean hasPurchases = false;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookitnow", "root", "anant2004");

                String query = "SELECT user_id, item_name, item_type, transaction_type, transaction_date FROM transactions ORDER BY transaction_date DESC";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
        %>

        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Item Name</th>
                    <th>Type</th>
                    <th>Transaction</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        hasPurchases = true;
                %>
                <tr>
                    <td><%= rs.getInt("user_id") %></td>
                    <td><%= rs.getString("item_name") %></td>
                    <td><%= rs.getString("item_type") %></td>
                    <td><%= rs.getString("transaction_type") %></td>
                    <td><%= rs.getTimestamp("transaction_date") %></td>
                </tr>
                <%
                    }

                    if (!hasPurchases) {
                %>
                <tr>
                    <td colspan="5" class="no-data">No purchases or rentals found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
    </div>
</div>

<%@include file="../component/footer.jsp"%>

</body>
</html>
