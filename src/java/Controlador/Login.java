/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class Login extends HttpServlet {

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

        String nombreuserL = request.getParameter("nombreuserL");
        String claverL = request.getParameter("claveuserL");

        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");

        out.println("<html>");
        out.println("<body>");

        user.setUser(nombreuserL);
        user.setClave(claverL);
        boolean validarUserL = userDAO.ValidarUserLogin(user);

        
        if (validarUserL == true) {
            boolean validarClaveL = userDAO.ValidarClaveLogin(user);
            if (validarClaveL == true) {
                    user = userDAO.Login(user);
                    //Validar el Admin que sea el usuario Andres22 !!Esta mal pero es valido XD
                if (user.getUser().equals("Andres22")) {
                    
                    sesion.setAttribute("NUser", nombreuserL);
                    request.getSession().setAttribute("ingresoA", user);
                    response.sendRedirect("inicioAdmin.jsp");
                    

                } else {
                    //Enviamos el nombre del usuario Recogido en el Input luego de validar
                    sesion.setAttribute("NUser", nombreuserL);
                    request.getSession().setAttribute("ingreso", user);
                    response.sendRedirect("inicio.jsp");
                    
                    if(user.getUser() == null){
                        response.sendRedirect("index.jsp");
                    }

                }
            } else {   //contraseña incorrecta

                response.sendRedirect("Res.jsp?mens='La clave ingresada es incorrecta'");
            }
        } else {    //usuario no encontrado en BD

           response.sendRedirect("Res.jsp?mens='El Usuario no existe en nuestro Base de Datos'");
        }

        out.println("</body>");
        out.println("</html>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
