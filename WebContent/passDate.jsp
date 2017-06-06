<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%>

<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8"/>

  </head>
  <body>
  <form name="calendarFrm" id="calendarFrm" action="map.jsp" method="post">
<input type="date" name="start">
<input type="date" name="end">
<input type="submit">
   </form>
  </body>
</html>