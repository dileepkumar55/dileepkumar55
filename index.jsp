<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Filmopedia</title>
   </head>
   <body>
      <form action="FilmDataMainServlet" method=get>
         <p style="color:black" id="menu">Popular Genres you may like:
         <table width=80% style=height:10% cellpadding=10 border=1>
            <thread>
               <tr>
                  <th>
                     <a href="FilmDataMainServlet?type=Action" class="articleLink unstyled" >
                        <div>Action </div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Animation" class="articleLink unstyled">
                        <div>Animation</div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Children" class="articleLink unstyled">
                        <div>Children</div>
                     </a>
                  </th>
               </tr>
               <tr>
                  <th>
                     <a href="FilmDataMainServlet?type=Classics" class="articleLink unstyled" >
                        <div>Classics</div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Comedy" class="articleLink unstyled">
                        <div>Comedy</div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Documentary" class="articleLink unstyled">
                        <div>Documentary</div>
                     </a>
                  </th>
               <tr>
                  <th>
                     <a href="FilmDataMainServlet?type=Drama" class="articleLink unstyled">
                        <div>Drama </div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Horror" class="articleLink unstyled">
                        <div>Horror</div>
                     </a>
                  </th>
                  <th>
                     <a href="FilmDataMainServlet?type=Sci-fi" class="articleLink unstyled">
                        <div>Sci-fi</div>
                     </a>
                  </th>
               </tr>
            </thread>
         </table>
         <br><br>
         <hr>
         </form>
         <div class="form-center">
      <form action="SearchFilmServlet" method=get>
         <p style="color:black">Search by movie: <br>
            <input type="text" name="Keyword" style="width: 360px; height: 40px; font-size:20px;">
            <input type="submit" Value="Go" name="action" style="height: 40px; font-size:20px;">
      </form>
   </body>
</html>