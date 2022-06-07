<%@page import="Model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="javax.swing.JButton"%>
<%@page import="DAO.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <body>
      <%
         String genre = request.getParameter("type");
         out.println("Top " + genre.toLowerCase() + " movies");
         %>
      <br>
      <br />
      <form action="FilmDataMainServlet" method=get>
      <table width=80% style="height: 10%" cellpadding=10 border=1>
         <thread>
            <th>Title</th>
            <th>Category</th>
            <th>language</th>
            <th>duration</th>
            <th>rating</th>
            <tr>
         </thread>
         <%
            String genre2 = request.getParameter("type");
            MovieDAO movie = new MovieDAO();

            ArrayList<Movie> movieList = movie.getMovieList(genre2);
            
            for (int i = 0; i < movieList.size(); i++) {
            
            	out.println("<tr>");
            	out.println("<td>");
            	out.println("<form action=SearchFilmServlet method=get id=nameform>");
            	out.println("<button type=submit form=nameform value="+movieList.get(i).getId()+ " name=Keyword>");
            	out.println(movieList.get(i).getTitle());
            	out.println("</button>");
            	out.println("</form>");
            
            	out.println("</td>");
            	out.println("<td>");
            	out.println(movieList.get(i).getCategory());
            	out.println("</td>");
            
            	out.println("<td>");
            	out.println(movieList.get(i).getDuration());
            	out.println("</td>");
            
            	out.println("<td>");
            	out.println(movieList.get(i).getLanguage());
            	out.println("</td>");
            
            	out.println("<td>");
            	out.println(movieList.get(i).getRating());
            	out.println("</td>");
            
            }
            %>
      </table>
      <br> <br>
      <hr>
   </body>
   <%
      %>
</html>