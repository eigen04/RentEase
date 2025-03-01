package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.entity.TvShows;

public class TvShowsDao {
	
	private Connection conn;
	
	public TvShowsDao() {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookitnow" ,"root","anant2004");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	public List<TvShows> getAllTvShows(){
		List<TvShows> tvShows= new ArrayList<>();
		try {
			String sql = "SELECT * from tvshows";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
                tvShows.add(new TvShows(
                    rs.getString("title"),
                    rs.getString("language"),
                    rs.getString("rating"),
                    rs.getString("image_path")
                ));
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tvShows;
	}
	public boolean addTvShows(TvShows tvShow) {
		try {
			String sql = "INSERT INTO tvshows (title, language, rating, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tvShow.getTitle());
            ps.setString(2, tvShow.getLanguage());
            ps.setString(3, tvShow.getRating());
            ps.setString(4, tvShow.getImagePath());
            return ps.executeUpdate() > 0;	
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
