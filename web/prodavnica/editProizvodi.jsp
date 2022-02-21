<%-- 
    Document   : editProizvodi
    Created on : Feb 5, 2022, 11:13:00 AM
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
        <h1>Proizvodi</h1>
        <a href="HomeServlet">Nazad</a><br>
        <c:if test="${not empty success}">
            <div style="background-color: lightcyan"><c:out value="${success}"/></div>
        </c:if>
        <div>
            <form action="AddProizvodServlet" method="POST">
                <table>
                    <tr>
                        <td>Naziv:</td>
                        <td><input name="naziv" placeholder="${proizvod.naziv}"></td>
                    </tr>
                    <tr>
                        <td>Opis:</td>
                        <td><input name="opis" placeholder="${proizvod.opis}"></td>
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
                        <td><input name="cena" placeholder="${proizvod.cena}"></td>
                    </tr>
                </table>
                <button type="submit">Dodaj</button><br><br>
            </form>
        </div>
        <div>
            <table>
                <thead>
                    <th>Naziv</th>
                    <th>Opis</th>
                    <th>Kategorija</th>
                    <th>Cena</th>
                    <th>Opcije</th>
                </thead>
                <tbody>
                    <c:forEach items="${proizvodi}" var="proizvod">
                        <tr>
                            <td><c:out value="${proizvod.naziv}"/></td>
                            <td><c:out value="${proizvod.opis}"/></td>
                            <td>
                            <c:forEach items="${kategorije}" var="kategorija">
                                <c:if test="${proizvod.idKategorije==kategorija.id}">
                                    <c:out value="${kategorija.naziv}"/>
                                </c:if>
                            </c:forEach>
                            </td>
                            <td><c:out value="${proizvod.cena}"/></td>
                            <td><a href="IzmeniProizvodServlet?id=${proizvod.id}">izmeni</a> <a href="RemoveProizvodServlet?id=${proizvod.id}">Obrisi</a><td>
                            
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </div>
    </body>
</html>
