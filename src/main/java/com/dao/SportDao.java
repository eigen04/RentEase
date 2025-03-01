package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Sport;

public class SportDao {
	private Connection conn;

    public SportDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookitnow" ,"root","anant2004");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Sport> getAllSports() {
        List<Sport> sports = new ArrayList<>();
        try {
            String sql = "SELECT * FROM sports";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
            	sports.add(new Sport(
                    rs.getString("title"),
                    rs.getString("language"),
                    rs.getString("rating"),
                    rs.getString("image_path")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sports;
    }

    public boolean addSport(Sport sport) {
        try {
            String sql = "INSERT INTO sports (title, language, rating, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sport.getTitle());
            ps.setString(2, sport.getLanguage());
            ps.setString(3, sport.getRating());
            ps.setString(4, sport.getImagePath());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
