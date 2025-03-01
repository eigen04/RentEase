package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.Transaction;

public class TransactionDao {
    
    private Connection conn;
    
    public TransactionDao(Connection conn) {
        this.conn = conn;
    }

    // 1️⃣ Add a new transaction
    public boolean addTransaction(Transaction transaction) {
        boolean success = false;
        String sql = "INSERT INTO transactions (user_id, item_name, item_type, transaction_type) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, transaction.getUserId());
            ps.setString(2, transaction.getItemName());
            ps.setString(3, transaction.getItemType());
            ps.setString(4, transaction.getTransactionType());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // 2️⃣ Get all transactions
    public List<Transaction> getAllTransactions() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions ORDER BY transaction_date DESC";
        
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Transaction t = new Transaction(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("item_name"),
                    rs.getString("item_type"),
                    rs.getString("transaction_type"),
                    rs.getTimestamp("transaction_date")
                );
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3️⃣ Get transactions for a specific user
    public List<Transaction> getTransactionsByUserId(int userId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE user_id = ? ORDER BY transaction_date DESC";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Transaction t = new Transaction(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("item_name"),
                    rs.getString("item_type"),
                    rs.getString("transaction_type"),
                    rs.getTimestamp("transaction_date")
                );
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
