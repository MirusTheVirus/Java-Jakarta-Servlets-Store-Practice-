<%-- 
    Document   : index
    Created on : Feb 5, 2022, 10:51:28 AM
    Author     : vladi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="JavaScript">
            let listaProizvoda=[];
            let Prikaz=document.querySelector("#prikazProizvoda");
            class Proizvod{
                constructor(naziv,opis,kategorija,cena){
                    this.naziv=naziv;
                    this.opis=opis;
                    this.kategorija=kategorija;
                    this.cena=cena;
                }
                toText(){
                    var string="<td>"+this.naziv+"</td>";
                    string+="<td>"+this.opis+"</td><td>"+this.kategorija+"</td><td>"+this.cena+"</td>";
                    return string;
                }
            }
            function Prikazi(lista){
                var string=`
                <table>
                    <thead>
                        <th>Naziv</th>
                        <th>Opis</th>
                        <th>Kategorija</th>
                        <th>Cena</th>
                    </thead>
                <tbody>`;
                for(const pom of lista){
                    string+="<tr>";
                    string+=pom.toText();
                    string+="</tr>";
                }
                string+=`
                    </tbody>
                </table>
                `;
                document.getElementById("prikazProizvoda").innerHTML=string;
            }
            function Filtriranje(unos){
                Prikazi((listaProizvoda.filter(p=>p.naziv.toLowerCase().includes(unos.toLowerCase()) || p.opis.toLowerCase().includes(unos.toLowerCase()))));
            }
            function Sortiraj(unos){
                let sortOrder=1;
            if(unos.substr(0,1)=='-'){
                sortOrder=-1;
                unos=unos.substr(1);
            }
            if(unos.includes('()')){
                unos="cena";
                listaProizvoda.sort((a,b)=>{
                    let result=parseFloat(a[unos])<parseFloat(b[unos])?-1:parseFloat(a[unos])>parseFloat(b[unos])?1:0;
                    return result*sortOrder;
                });
            }else{
                listaProizvoda.sort((a,b)=>{
                    let result=a[unos]<b[unos]?-1:a[unos]>b[unos]?1:0;
                    return result*sortOrder;
                });
            }
            document.getElementById("pretraga").value="";
            Prikazi(listaProizvoda);
            }
            <c:forEach items="${proizvodi}" var="current" varStatus="status">
                <c:forEach items="${kategorije}" var="currkat" varStatus="status">
                    <c:if test="${currkat.id==current.idKategorije}">
                        listaProizvoda.push(new Proizvod('<c:out value='${current.naziv}'/>','<c:out value='${current.opis}'/>','<c:out value='${currkat.naziv}'/>','<c:out value='${current.cena}'/>'));
                    </c:if>
                </c:forEach>
            </c:forEach>
            
        </script>
    </head>
    <body>
        
        <h1>Prodavnica</h1><br><br>
        <a href="AddKategorijaServlet">Upravljanje Kategorijama</a><br><br>
        <a href="AddProizvodServlet">Upravljanje Proizvodima</a><br><br>
        <select onchange="Sortiraj(this.value)">
            <option value="naziv">Rastuce po nazivu</option>
            <option value="-naziv">Opadajuce po nazivu</option>
            <option value="cena()">Najmanja cena prvo</option>
            <option value="-cena()">Najveca cena prvo</option>
        </select>
        <input id="pretraga" placeholder="Filter" name="pretraga" onkeyup="Filtriranje(this.value)"><br>
        <div id="prikazProizvoda" name="prikazProizvoda">
            <table>
                <thead>
                    <th>Naziv</th>
                    <th>Opis</th>
                    <th>Kategorija</th>
                    <th>Cena</th>
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
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </div>
    </body>
</html>
