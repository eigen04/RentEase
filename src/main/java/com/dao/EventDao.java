package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Event;

public class EventDao {
	private Connection conn;

    public EventDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookitnow" ,"root","anant2004");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        try {
            String sql = "SELECT * FROM events";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                events.add(new Event(
                    rs.getString("title"),
                    rs.getString("language"),
                    rs.getString("rating"),
                    rs.getString("image_path")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return events;
    }

    public boolean addEvent(Event event) {
        try {
            String sql = "INSERT INTO events (title, language, rating, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, event.getTitle());
            ps.setString(2, event.getLanguage());
            ps.setString(3, event.getRating());
            ps.setString(4, event.getImagePath());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
