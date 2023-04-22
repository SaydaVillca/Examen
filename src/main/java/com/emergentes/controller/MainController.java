package com.emergentes.controller;
import com.emergentes.modelo.Calificacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        if(ses.getAttribute("listacal") == null){
            ArrayList<Calificacion> listaux = new ArrayList<Calificacion>();
            ses.setAttribute("listacal", listaux);
        }
        
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        String op = request.getParameter("op");
        String opcion = (op != null) ? request.getParameter("op"): "view";
        
        Calificacion cal1 = new Calificacion();
        int id,pos;
        switch(opcion){
            case "nuevo":
                request.setAttribute("miCalificacion", cal1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarIndice(request, id);
                cal1 = lista.get(pos);
                request.setAttribute("miCalificacion", cal1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                pos = buscarIndice(request, Integer.parseInt(request.getParameter("id")));
                lista.remove(pos);
                ses.setAttribute("miCalificacion", lista);
                response.sendRedirect("index.jsp");
                break;
            case "view":
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        Calificacion cal1 = new Calificacion();
        
        cal1.setId(Integer.parseInt(request.getParameter("id")));
        cal1.setNombre(request.getParameter("nombres"));
        cal1.setP1(Integer.parseInt(request.getParameter("p1")));
        cal1.setP2(Integer.parseInt(request.getParameter("p2")));
        cal1.setP3(Integer.parseInt(request.getParameter("p3")));
        
        int idt = cal1.getId();
        if(idt == 0){
            int ultID;
            ultID = ultimoId(request);
            cal1.setId(ultID);
            lista.add(cal1);
        }else{
            lista.set(buscarIndice(request,idt), cal1);
        }
        ses.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp");
    }

    private int ultimoId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        int idaux = 0;
        for(Calificacion item: lista){
            idaux = item.getId();
        }
        return idaux+1;
    }
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        int i = 0;
        if(lista.size()>0){
            while(i < lista.size()){
                if(lista.get(i).getId() == id){
                    break;
                }else{
                    i++;
                }
            }
        }
        return i;
    }
}
