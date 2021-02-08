package Controlador;

import Modelo.Pelicula;
import Modelo.PeliculaDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author S_and
 */

@WebServlet(name = "SubirPeliculaBD", urlPatterns = {"/PeliculasAdmin"})
@MultipartConfig(maxFileSize = 16177215)    // Subir archivos hasta un maximo de 16MB
public class PeliculasAdmin extends HttpServlet {

    Pelicula p = new Pelicula();
    PeliculaDAO pDAO = new PeliculaDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        
        //Guardar Datos peliculas en BD
        if (accion.equals("Guardar")) {
            String nombreP = request.getParameter("nombreP");
            String generoP = request.getParameter("generoP");
            String descripcionP =request.getParameter("text-desc"); 
            Part Archivo = request.getPart("FotoP");
            InputStream inputstream = Archivo.getInputStream();

            p.setNombreP(nombreP);
            p.setGeneroP(generoP);
            p.setDescripcion(descripcionP);
            p.setFotoP(inputstream);

            boolean resp = PeliculaDAO.InsertarPelis(p);
            
            response.sendRedirect("inicioAdmin.jsp");
        
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
