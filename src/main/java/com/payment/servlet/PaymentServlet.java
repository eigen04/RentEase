package com.payment.servlet;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;

@WebServlet("/createOrder")
public class PaymentServlet extends HttpServlet {

    private static final String RAZORPAY_KEY_ID = "rzp_test_u4K29gv7bbUOOe";
    private static final String RAZORPAY_KEY_SECRET = "VD4YmSru95X1YJZbmknVg2Xd";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get amount from request (in paise)
            int amount = Integer.parseInt(request.getParameter("amount")) * 100; // Convert to paise

            // Initialize Razorpay client
            RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET);

            // Create order request
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount);
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "txn_" + new BigInteger(130, new SecureRandom()).toString(32));
            orderRequest.put("payment_capture", 1);

            // Create order
            Order order = razorpay.orders.create(orderRequest);

            // Send order ID as response
            response.setContentType("application/json");
            response.getWriter().write(order.toString());

        } catch (RazorpayException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Payment processing error");
        }
    }
}

