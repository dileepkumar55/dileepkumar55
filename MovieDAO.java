package DAO;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Movie;
import Model.MovieDetail;

public class MovieDAO {
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String USER = "root";
	static final String PASSWD = "Dileep@12345";

	private Connection conn = null;
	private Statement stmt = null;

	public MovieDAO() {
		makeConnection("sakila");

	}

	void makeConnection(String dbName) {

		final String dbURL = "jdbc:mysql://localhost/" + dbName + "?autoReconnect=true&useSSL=false";

		try {

			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(dbURL, USER, PASSWD);
			stmt = conn.createStatement();
			System.out.println("Database connected.....");

		} catch (SQLException se) {
			se.printStackTrace();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (stmt != null) {
				stmt.close();
			}

			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Movie> getMovieList(String genre) {
		System.out.println("genre is..............////" + genre);
		String sql = "select f.film_id, f.title,c.name,L.name,f.length,f.rating from category c \r\n"
				+ "inner join film_category fc  on fc.category_id=c.category_id inner join \r\n"
				+ "film f on f.film_id=fc.film_id INNER JOIN Language L on f.language_id=L.language_id  \r\n"
				+ "where c.name='" + genre + "' and f.rating='G' order by fc.film_id limit 10;";
		List<Movie> movieList = runSQL2(sql);
		return (ArrayList<Movie>) movieList;
	}

	public MovieDetail getMovieDetail(String id) {

		String sql = "select f.title,c.name as Genre ,f.release_year,f.special_features,f.description, concat(a.first_name,\" \",a.last_name) as \"actors\",f.length\r\n"
				+", f.rating "+ "from category c inner join film_category fc \r\n"
				+ "on fc.category_id=c.category_id inner join film f on f.film_id=fc.film_id inner join \r\n"
				+ "film_actor fa on fa.film_id=f.film_id inner join actor a on fa.actor_id=a.actor_id where f.film_id='"
				+ id + "' and \r\n" + "f.rating='G'  limit 5;";

		MovieDetail movieDetail = (MovieDetail) runSQL3(sql);

		return movieDetail;
	}

	public List<Movie> runSQL2(String sql) {

		if (stmt == null) {
			return null;
		}

		List<Movie> movieList = new ArrayList<Movie>();

		try {
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Movie movie = new Movie();
				movie.setId(rs.getString(1));
				movie.setTitle(rs.getString(2));
				movie.setCategory(rs.getString(3));
				movie.setDuration(rs.getString(4));
				movie.setLanguage(rs.getString(5));
				movie.setRating(rs.getString(6));
				movieList.add(movie);
			}
			rs.close();

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return movieList;

	}

	public MovieDetail runSQL3(String sql) {

		if (stmt == null) {
			return null;
		}

		MovieDetail movieDetail = new MovieDetail();

		try {

			ResultSet rs = stmt.executeQuery(sql);
			String actors = "";
			while (rs.next()) {

				movieDetail.setTitle(rs.getString(1));
				movieDetail.setGenre(rs.getString(2));
				movieDetail.setReleaseYear(rs.getString(3));
				movieDetail.setSpecialFeatures(rs.getString(4));
				movieDetail.setDescription(rs.getString(5));
				actors = actors + rs.getString(6) + ", ";
				movieDetail.setDuration(rs.getString(7));
				movieDetail.setRating(rs.getString(8));

			}
			movieDetail.setActors(actors);

			
			rs.close();

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return movieDetail;

	}

	public MovieDetail searchMovieString(String id) {

		String sql = "select f.title,c.name as Genre ,f.release_year,f.special_features,f.description, concat(a.first_name,\" \",a.last_name) as \"actors\",f.length\r\n"
				+",f.rating " +"from category c inner join film_category fc \r\n"
				+ "on fc.category_id=c.category_id inner join film f on f.film_id=fc.film_id inner join \r\n"
				+ "film_actor fa on fa.film_id=f.film_id inner join actor a on fa.actor_id=a.actor_id where f.title='"
				+ id + "' \r\n" + "  limit 5;";
		
		System.out.println(sql);

		MovieDetail movieDetail = (MovieDetail) runSQL3(sql);

		return movieDetail;
	}

}
