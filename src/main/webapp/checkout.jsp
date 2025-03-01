<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <%@include file="component/allcss.jsp"%>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center">Checkout</h2>

    <%
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String action = request.getParameter("action");
    %>

<h4 class="text-center">
    <%= ("rent".equals(action)) ? "Rent" : "Purchase" %> <%= (type != null) ? type : "Unknown Type" %>: <%= (name != null) ? name : "Unknown Item" %>
</h4>

    <form action="payment-success.jsp" method="POST" class="p-4 border rounded bg-light">
        <div class="mb-3">
            <label class="form-label">Card Number</label>
            <input type="text" class="form-control" placeholder="1234 5678 9012 3456" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Expiration Date</label>
            <input type="text" class="form-control" placeholder="MM/YY" required>
        </div>
        <div class="mb-3">
            <label class="form-label">CVV</label>
            <input type="text" class="form-control" placeholder="123" required>
        </div>
        <input type="hidden" name="type" value="<%= type %>">
        <input type="hidden" name="name" value="<%= name %>">
        <input type="hidden" name="action" value="<%= action %>">

        <button type="submit" class="btn btn-success w-100">Pay Now</button>
    </form>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
