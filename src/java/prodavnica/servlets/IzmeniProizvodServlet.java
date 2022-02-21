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
public class IzmeniProizvodServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        for(Proizvod p:modelLister.listaProizvoda){
            if(id==p.getId()){
                request.setAttribute("proizvod",p);
            }
        }
        request.setAttribute("kategorije",modelLister.listaKategorija);
        request.getRequestDispatcher("izmeniProizvod.jsp").forward(request, response);
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
                int id=Integer.parseInt(request.getParameter("id"));
                for(Proizvod p:modelLister.listaProizvoda){
                    if(id==p.getId()){
                        p.setNaziv(request.getParameter("naziv"));
                        p.setOpis(request.getParameter("opis"));
                        p.setIdKategorije(Integer.parseInt(request.getParameter("idKategorije")));
                        p.setCena(Double.parseDouble(request.getParameter("cena")));
                        request.setAttribute("success","Izmena uspesna");
                    }
                }
            }
            else{
                request.setAttribute("success","Izmena nije uspesna");
            }
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.getRequestDispatcher("editProizvodi.jsp").forward(request, response);
        }
        catch(ServletException | IOException | NumberFormatException e){
            request.setAttribute("success","Izmena nije uspesna");
            request.getRequestDispatcher("editProizvodi.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
