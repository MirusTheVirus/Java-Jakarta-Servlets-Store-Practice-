/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lists;

import java.util.ArrayList;
import model.Kategorija;
import model.Proizvod;

/**
 *
 * @author vladi
 */
public class modelLister {
    public static ArrayList<Kategorija> listaKategorija=new ArrayList<>();
    public static ArrayList<Proizvod> listaProizvoda=new ArrayList<>();
    public int brojProizvoda(int idKategorije){
        int suma=0;
        for(Proizvod p:listaProizvoda){
            if(p.getId()==idKategorije){
                suma+=1;
            }
        }
        return suma;
    }
}
