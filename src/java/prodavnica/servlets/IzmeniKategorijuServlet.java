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
import model.Kategorija;

/**
 *
 * @author vladi
 */
public class IzmeniKategorijuServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        for(Kategorija k:modelLister.listaKategorija){
            if(k.getId()==id){
                request.setAttribute("kategorija",k);
                request.getRequestDispatcher("izmeniKategoriju.jsp").forward(request, response);
                break;
            }
        }        
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
                int id=Integer.parseInt(request.getParameter("id"));
                for(Kategorija k:modelLister.listaKategorija){
                    if(k.getId()==id){
                        k.setNaziv(request.getParameter("naziv"));
                        request.setAttribute("success","Kategorija izmenjena");
                    }
                }    
            }
            else{
                request.setAttribute("success","Kategorija nije izmenjena");
            }
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.getRequestDispatcher("editKategorije.jsp").forward(request, response);
        }
        catch(ServletException | IOException e){
            request.setAttribute("proizvodi",modelLister.listaProizvoda);
            request.setAttribute("kategorije",modelLister.listaKategorija);
            request.setAttribute("success","Kategorija nije izmenjena");
            request.getRequestDispatcher("editKategorije.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
