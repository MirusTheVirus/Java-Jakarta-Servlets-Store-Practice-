<%-- 
    Document   : editKategorije
    Created on : Feb 5, 2022, 11:12:52 AM
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
        <h1>Kategorije</h1>
        <a href="HomeServlet">Nazad</a>
        <c:if test="${not empty success}">
            <div style="background-color: lightcyan"><c:out value="${success}"/></div><br>
        </c:if>
        <div>
            <form action="AddKategorijaServlet" method="POST">
                <input name="naziv" placeholder="Unesite Naziv"><br><br>
                <button type="submit">Dodaj</button><br><br>
            </form>
        </div>
        <div>
            <table>
                <thead>
                    <th>Naziv</th>
                    <th>BrojProizvoda<th>
                    <th>Opcije</th>
                </thead>
                <tbody>
                    <c:forEach items="${kategorije}" var="kategorija">
                        <tr>
                            <td><c:out value="${kategorija.naziv}"/></td>
                            <c:set var="brproizvoda" value="${0}"/>
                            <c:forEach items="${proizvodi}" var="proizvod">
                                <c:if test="${proizvod.idKategorije==kategorija.id}">
                                    <c:set var="brproizvoda" value="${brproizvoda+1}"/>
                                </c:if>
                            </c:forEach>
                            <td><c:out value="${brproizvoda}"/></td>
                            <td>
                            <a href="IzmeniKategorijuServlet?id=${kategorija.id}">izmeni</a>
                            <c:if test="${brproizvoda>0}"><div style="color: graytext">Can't Remove</div></c:if>
                            <c:if test="${brproizvoda==0}"><a href="RemoveKategorijaServlet?id=${kategorija.id}">Remove</a></c:if>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </div>
        
    </body>
</html>
