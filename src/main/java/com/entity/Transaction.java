package com.entity;

import java.sql.Timestamp;

public class Transaction {
    private int id;
    private int userId;
    private String itemName;
    private String itemType;
    private String transactionType;
    private Timestamp transactionDate;

    public Transaction(int id, int userId, String itemName, String itemType, String transactionType, Timestamp transactionDate) {
        this.id = id;
        this.userId = userId;
        this.itemName = itemName;
        this.itemType = itemType;
        this.transactionType = transactionType;
        this.transactionDate = transactionDate;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public String getItemType() { return itemType; }
    public void setItemType(String itemType) { this.itemType = itemType; }

    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }

    public Timestamp getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Timestamp transactionDate) { this.transactionDate = transactionDate; }
}
