package Controlador;

import Config.ConexionBD;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class img extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("image/png");

        ConexionBD con = new ConexionBD();
        PreparedStatement ps = null;
        ResultSet rs = null;
        byte[] b = null;

        try {

            String Nuser = request.getParameter("Usuario");
            ps = con.conectar().prepareStatement("SELECT avatar FROM usuarios WHERE user = ?;");
            ps.setString(1, Nuser);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = rs.getBytes(1);
            }
            InputStream bos = new ByteArrayInputStream(b);

            int tamanoInput = bos.available();
            byte[] datosIMAGEN = new byte[tamanoInput];
            bos.read(datosIMAGEN, 0, tamanoInput);
            
            
            response.getOutputStream().write(datosIMAGEN);
            
            
            bos.close();
            ps.close();
            rs.close();
            con.desconectar();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
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
