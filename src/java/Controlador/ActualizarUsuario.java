package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "UsuarioActualizado", urlPatterns = {"/Actualizar_Usuario"})
@MultipartConfig(maxFileSize = 16177215)    // Subir archivos hasta un maximo de 16MB
public class ActualizarUsuario extends HttpServlet {

    Usuario u = new Usuario();
    UsuarioDAO uDAO = new UsuarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");

        out.println("<html>");
        out.println("<body>");

        String accion = request.getParameter("accion");

        if (accion.equals("ActuPerfil")) {
            String nombreU = request.getParameter("user");

            u.setUser(nombreU);
            //Llamamos el metodo de listar por Usuario
            u = uDAO.listarUser(u);
            request.setAttribute("u", u);
            request.getRequestDispatcher("perfil.jsp").forward(request, response);

        }

        if (accion.equals("atras")) {
            request.setAttribute("u", u);
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }

        if (accion.equals("ActuFoto")) {
            request.setAttribute("u", u);

            request.getRequestDispatcher("ActualizarFoto.jsp").forward(request, response);
        }

        if (accion.equals("Actualizar")) {
            int Codigo = Integer.parseInt(request.getParameter("Codigo"));
            Part Archivo = request.getPart("Foto");
            InputStream inputstream = Archivo.getInputStream();

            u.setId(Codigo);
            u.setAvatar(inputstream);

            boolean resp = UsuarioDAO.ActualizarFoto(u);
            request.setAttribute("u", u);
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }

        //Actualizar clave del usuario
        if (accion.equals("ActClave")) {
            String nombreU = request.getParameter("user");
            String claveA = request.getParameter("claveA");
            String claveN = request.getParameter("claveN1");
            String claveN2 = request.getParameter("claveN2");

            u.setUser(nombreU);
            u.setClave(claveA);

            if (claveN == null || claveN == "" || claveN2 == null || claveN2 == "") {
                //Si la nueva clave esta vacia 
                response.sendRedirect("Respuesta.jsp?mens='La Nueva clave que desea guardar esta Vacia'");
            } else {

                //Validamos que exista la clave y el usuario
                boolean validarClaveL = uDAO.ValidarClaveLogin(u);

                if (validarClaveL == true) {

                    Usuario user = new Usuario();
                    user.setClave(claveN);

                    user.setUser(nombreU);
                    //Actualizamos la clave
                    uDAO.ActualizarClave(user);

                    //Cerramos sesion para iniciar con claven nueva
                    request.getRequestDispatcher("cerrandoSesion").forward(request, response);

                } else {
                    response.sendRedirect("Respuesta.jsp?mens='Clave antigua incorrecta'");
                }

            }

        }

        out.println("</body>");
        out.println("</html>");

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
