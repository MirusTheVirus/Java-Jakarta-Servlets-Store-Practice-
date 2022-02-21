/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package prodavnica.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lists.modelLister;
import model.Proizvod;

/**
 *
 * @author vladi
 */
public class AddProizvodServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("proizvodi",modelLister.listaProizvoda);
        request.setAttribute("kategorije",modelLister.listaKategorija);
        request.getRequestDispatcher("editProizvodi.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            if(!(request.getParameter("naziv").trim()=="" || request.getParameter("cena").trim()=="")){
                Proizvod p=new Proizvod();
                int id=1;
                if(!modelLister.listaProizvoda.isEmpty()){
                    id=modelLister.listaProizvoda.get(modelLister.listaProizvoda.size()-1).getId()+1;
                }
                p.setId(id);
                p.setNaziv(request.getParameter("naziv"));
                p.setOpis(request.getParameter("opis"));
                p.setIdKategorije(Integer.parseInt(request.getParameter("idKategorije")));
                p.setCena(Double.parseDouble(request.getParameter("cena")));
                modelLister.listaProizvoda.add(p);
                request.setAttribute("success","Uspesno Dodat Proizvod");
            }
            else{
                request.setAttribute("success","Nisu ispravno uneseni podaci");
            }
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.getRequestDispatcher("editProizvodi.jsp").forward(request, response);
        }
        catch(ServletException | IOException | NumberFormatException e){
            request.setAttribute("success","Nisu ispravno uneseni podaci");
            request.getRequestDispatcher("editProizvodi.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
