<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <%@include file="component/allcss.jsp"%>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center text-success">Payment Successful! 🎉</h2>
    <p class="text-center">Your payment ID: <%= request.getParameter("payment_id") %></p>
    <div class="text-center">
        <a href="index.jsp" class="btn btn-primary">Go Home</a>
    </div>
</div>

<%@include file="component/footer.jsp"%>

</body>
</html>
