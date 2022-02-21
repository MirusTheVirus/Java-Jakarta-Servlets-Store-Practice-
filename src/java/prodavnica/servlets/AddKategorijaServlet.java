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
import java.util.ArrayList;
import lists.modelLister;
import model.Kategorija;

/**
 *
 * @author vladi
 */
public class AddKategorijaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("proizvodi",modelLister.listaProizvoda);
        request.setAttribute("kategorije",modelLister.listaKategorija);
        request.getRequestDispatcher("editKategorije.jsp").forward(request, response);
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
            if(request.getParameter("naziv").trim()!=""){
                Kategorija k=new Kategorija();
                int id=1;
                if(!modelLister.listaKategorija.isEmpty()){
                    id=modelLister.listaKategorija.get(modelLister.listaKategorija.size()-1).getId()+1;
                }
                k.setId(id);
                k.setNaziv(request.getParameter("naziv"));
                modelLister.listaKategorija.add(k);
                request.setAttribute("success","Uspesno Dodata Kategorija");
                }
            else{
                request.setAttribute("success","Nisu ispravno uneseni podaci");
            }
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.getRequestDispatcher("editKategorije.jsp").forward(request, response);
        }
        catch(ServletException | IOException e){
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.setAttribute("success","Nisu ispravno uneseni podaci");
            request.getRequestDispatcher("editKategorije.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
