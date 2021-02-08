package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S_and
 */
public class Registro extends HttpServlet {

            Usuario user = new Usuario();
            UsuarioDAO userDAO = new UsuarioDAO();
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession sesion = request.getSession();
        
        String nombrer = request.getParameter("nombrer");
        String apellidor = request.getParameter("apellidor");
        String nombreuser = request.getParameter("nombreuser");
        String correor = request.getParameter("correor");
        String claver = request.getParameter("claver");
        
        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");

        out.println("<html>");
        out.println("<body>");

        user.setNombre(nombrer);
        user.setApellido(apellidor);
        user.setUser(nombreuser);
        user.setEmail(correor);
        user.setClave(claver);

        //Validaciones
        //Poner el metodo de usuario repetido, analizarlo
        boolean usuarioRepetido = userDAO.usuarioRepetido(user);

        //Poner el metodo de Correo repetido, analizarlo
        boolean correoRepetido = userDAO.correoRepetido(user);

        if (usuarioRepetido == true) { //El usuario ya esta registrado
            
        response.sendRedirect("Res.jsp?mens='El usuario Ingresado ya fue registrado por otra persona'");

        } else if (correoRepetido == true) {//El correo ya esta registrado
 
            response.sendRedirect("Res.jsp?mens='El Correo electronico Ingresado ya fue registrado por otra persona'");

        } else {
            
            userDAO.RegistrarUsuario(user);
            if (user.getUser() != null) {
                request.getSession().setAttribute("registro", user);
                sesion.setAttribute("NUser", nombreuser);
                response.sendRedirect("inicio.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        }

        out.println("</body>");
        out.println("</html>");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
