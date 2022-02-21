<%-- 
    Document   : izmeniKategoriju
    Created on : Feb 5, 2022, 1:41:35 PM
    Author     : vladi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Izmeni Kategoriju <c:out value="${kategorija.naziv}"/></h1>
        <div>
            <form action="IzmeniKategorijuServlet" method="POST">
                <input name="id" value="${kategorija.id}" hidden>
                <input name="naziv" value="${kategorija.naziv}"><br><br>
                <button type="submit">Dodaj</button><br><br>
            </form>
        </div>
    </body>
</html>
