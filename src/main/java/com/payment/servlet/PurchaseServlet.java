package com.payment.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TransactionDao;
import com.db.DBConnect;
import com.entity.Transaction;

@WebServlet("/purchases")
public class PurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("userlogin.jsp"); // Redirect to login if user not logged in
            return;
        }
        
        String itemName = request.getParameter("item_name");
        String itemType = request.getParameter("item_type");
        String transactionType = request.getParameter("transaction_type");

        // Validate input
        if (itemName == null || itemType == null || transactionType == null) {
            session.setAttribute("errorMsg", "Invalid request parameters.");
            response.sendRedirect("purchase-error.jsp");
            return;
        }

        // Fix Unknown Type Issue
        if (itemType.equalsIgnoreCase("event")) {
            itemType = "Event";
        } else if (itemType.equalsIgnoreCase("sports") || itemType.equalsIgnoreCase("sport")) {
            itemType = "Sports";
        } else if (itemType.equalsIgnoreCase("tvshow") || itemType.equalsIgnoreCase("tvshows")) {
            itemType = "TV Show";
        } else if (itemType.equalsIgnoreCase("movie")) {
            itemType = "Movie";
        } else {
            itemType = "Unknown";  // Default value if nothing matches
        }

        // Save transaction
        TransactionDao transactionDao = new TransactionDao(DBConnect.getConn());
        Transaction transaction = new Transaction(0, userId, itemName, itemType, transactionType, null);
        
        boolean success = transactionDao.addTransaction(transaction);
        
        if (success) {
            session.setAttribute("successMsg", "✅ Purchase successful! You have " + transactionType + "ed " + itemType + ": " + itemName + ".");
            response.sendRedirect("purchase-success.jsp");
        } else {
            session.setAttribute("errorMsg", "❌ Purchase failed. Please try again.");
            response.sendRedirect("purchase-error.jsp");
        }
    }
}
