<%@page import="Model.MovieDetail"%>
<%@page import="DAO.MovieDAO"%>
<%@page import="com.mysql.cj.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>CS460/CS520 Demo</title>
      <font size = "20" face="arial" color="red" >
      </font>
   </head>
   <body>
   
  
     <%String identity = request.getParameter("Keyword"); 
     
     if(StringUtils.isStrictlyNumeric(identity)) 
     {
    	MovieDAO movie = new MovieDAO();
        MovieDetail movieDetail = movie.getMovieDetail(identity);
       
        out.println("<centre>");
        out.println("<table align = center width=30% style=height:60% cellpadding=12 border=2>");
        out.println("<h1/>");
        out.println("<td align=center width = 50% >" + movieDetail.getTitle() + "</td>");
        out.println("<h1/>");
        out.println("</table>");
        out.println("<pre>");
        out.println("<font size =2.5 face=arial color=black >");
        out.println("<br/>");
        out.println("<br/>");
        out.println("<h4 align=centre");
     	out.println("<br/>");
     	out.println("<br/>");
     	out.println("																		Title: 		      			" +movieDetail.getTitle());
     	out.println("<br/>");
     	out.println("<br/>");
     	out.println("																		Actors:					"  +movieDetail.getActors());
     	out.println("<br/>");
     	out.println("<br/>");
     	out.println("																		Description:	  			" +movieDetail.getDescription());
     	out.println("<br/>");
     	out.println("<br/>");
    	out.println("																		Genre:					" +movieDetail.getGenre());
    	out.println("<br/>");
    	out.println("<br/>");
    	out.println("																		Release Year:	  			" +movieDetail.getReleaseYear());
     	out.println("<br/>");
     	out.println("<br/>");
     	out.println("																		Duration: 		  		"+movieDetail.getDuration() );
     	out.println("<br/>");
    	out.println("<br/>");
    	out.println("																		Rating:					G" );
    	out.println("<br/>");
    	out.println("<br/>");
    	out.println("																		Special features:	    		"+movieDetail.getSpecialFeatures());
    	out.println("<h4/>");
    	
    	out.println("<left>");
    	out.println("</font>");
    	out.println("</pre>");
    	 
	 }
     
     else  {
    	 MovieDAO movie = new MovieDAO();
         MovieDetail movieDetail = movie.searchMovieString(identity.toUpperCase());
        if(movieDetail.getTitle() != null){
        	out.println("<centre>");
            out.println("<table align = center width=30% style=height:60% cellpadding=12 border=2>");
            out.println("<h1/>");
            out.println("<td align=center width = 50% >" + movieDetail.getTitle() + "</td>");
            out.println("<h1/>");
            out.println("</table>");
            out.println("<pre>");
            out.println("<font size =2.5 face=arial color=black >");
            out.println("<br/>");
            out.println("<br/>");
	        out.println("<h4 align=left");
	      	out.println("<br/>");
	      	out.println("<br/>");         
	      	out.println("																		Title: 					" +movieDetail.getTitle());
	      	out.println("<br/>");
	      	out.println("<br/>");
	      	out.println("																		Actors: 					" +movieDetail.getActors());
	      	out.println("<br/>");
	      	out.println("<br/>");
	      	out.println("																		Description : 		     		" +movieDetail.getDescription());
	      	out.println("<br/>");
	      	out.println("<br/>");
	     	out.println("																		Genre: 		  	 		" +movieDetail.getGenre());
	     	out.println("<br/>");
	     	out.println("<br/>");
	     	out.println("																		Release Year: 			" +movieDetail.getReleaseYear());
	     	out.println("<br/>");
	     	out.println("<br/>");
	     	out.println("																		Duration: 		  		"+movieDetail.getDuration() );
	     	out.println("<br/>");
	     	out.println("<br/>");     	
	     	out.println("																		Rating: 			  		" +movieDetail.getRating());
	     	out.println("<br/>");
	     	out.println("<br/>");
	     	out.println("																		Special fatures: 			"+movieDetail.getSpecialFeatures());
	     	out.println("<h4/>");
	     	
	     	out.println("<left>");
	     	out.println("</pre>");
        }
        
        else{
        	out.println("Sorry!....The movie you are looking for is not available in the store. Please look for an other movie");
        	out.println( "<form action=SearchFilmServlet method=get>");
        	out.println("<p style=color:black>");
        	out.println("<input type=text name=Keyword style=width: 360px; height: 40px; font-size:20px>");
        	out.println(" <input type=submit Value=Go name=action style=height: 40px; font-size:20px>");
        	out.println("</form>");
        }
     }
     %>
   </body>
</html>