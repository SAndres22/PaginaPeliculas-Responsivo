package Controlador;

import Modelo.Pelicula;
import Modelo.PeliculaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author S_and
 */
public class Peliculas extends HttpServlet {
    
    Pelicula p = new Pelicula();
    PeliculaDAO pDAO =  new PeliculaDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
 
        if(accion.equals("verPelicula")){
            int idP = Integer.parseInt(request.getParameter("idPelicula"));
            //llamar metodo listar por id
            p = pDAO.listarID(idP);
            request.setAttribute("pelicula", p);
            request.getRequestDispatcher("verPelicula.jsp").forward(request, response);
           
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
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
