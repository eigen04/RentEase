<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Checkout</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>

    <h2>Movie Ticket Payment</h2>

    <button type="button" onclick="startPayment(50)">Rent for ₹50</button>
    <button type="button" onclick="startPayment(200)">Buy for ₹200</button>

    <script>
        function startPayment(amount) {
            fetch("createOrder", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "amount=" + amount
            })
            .then(response => response.json())
            .then(data => {
                let options = {
                    "key": "rzp_test_u4K29gv7bbUOOe",
                    "amount": data.amount,
                    "currency": "INR",
                    "name": "Movie Reservation",
                    "description": "Ticket Payment",
                    "order_id": data.id,
                    "handler": function (response) {
                        alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                        window.location.href = "payment-success.jsp";
                    },
                    "theme": { "color": "#3399cc" }
                };
                let rzp = new Razorpay(options);
                rzp.open();
            })
            .catch(error => alert("Payment error: " + error));
        }
    </script>

</body>
</html>
