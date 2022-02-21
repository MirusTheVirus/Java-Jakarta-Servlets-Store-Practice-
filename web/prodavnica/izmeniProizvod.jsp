<%-- 
    Document   : izmeniProizvod
    Created on : Feb 5, 2022, 1:41:24 PM
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
        <h1>Izmeni <c:out value="${proizvod.naziv}"/></h1>
        <div>
            <form action="IzmeniProizvodServlet" method="POST">
                <input name="id" hidden value="${proizvod.id}">
                <table>
                    <tr>
                        <td>Naziv:</td>
                        <td><input name="naziv" value="${proizvod.naziv}"></td>
                    </tr>
                    <tr>
                        <td>Opis:</td>
                        <td><input name="opis" value="${proizvod.opis}"></td>
                    </tr>
                    <tr>
                        <td>Kategorija:</td>
                        <td>
                            <select name="idKategorije">
                                <c:forEach items="${kategorije}" var="kategorija">
                                    <option value="${kategorija.id}"><c:out value="${kategorija.naziv}"/></option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Cena:</td>
                        <td><input name="cena" value="${proizvod.cena}"></td>
                    </tr>
                </table>
                <button type="submit">Dodaj</button><br><br>
            </form>
        </div>
    </body>
</html>
