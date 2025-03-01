package com.entity;

public class TvShows {
	public int id;
	public String title;
	public String language;
	public String rating;
	public String imagePath;
	
	
	public TvShows() {}


	public TvShows(String title, String language, String rating, String imagePath) {
		this.title = title;
		this.language = language;
		this.rating = rating;
		this.imagePath = imagePath;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	

}
