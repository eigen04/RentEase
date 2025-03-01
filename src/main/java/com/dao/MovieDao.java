package com.dao;

import com.entity.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDao {
    private Connection conn;

    public MovieDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookitnow" ,"root","anant2004");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        try {
            String sql = "SELECT * FROM movies";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                movies.add(new Movie(
                    rs.getString("title"),
                    rs.getString("language"),
                    rs.getString("rating"),
                    rs.getString("image_path")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public boolean addMovie(Movie movie) {
        try {
            String sql = "INSERT INTO movies (title, language, rating, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getLanguage());
            ps.setString(3, movie.getRating());
            ps.setString(4, movie.getImagePath());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
