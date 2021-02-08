package Modelo;

import Config.ConexionBD;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author S_and
 */
public class UsuarioDAO {

    private static Connection conexion;
    private static PreparedStatement senteciapreparada;
    private static ResultSet resultado;
    int rta;

    //Encriptacion de Contraseñas con MD5
    public String getMD5(Usuario u) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(u.getClave().getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);

            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int RegistrarUsuario(Usuario u) {

        String consulta = "INSERT INTO usuarios (nombre,apellido,user,email,clave) VALUES (?,?,?,?,?)";
        try {
            conexion = ConexionBD.conectar();
            senteciapreparada = conexion.prepareStatement(consulta);

            senteciapreparada.setString(1, u.getNombre());
            senteciapreparada.setString(2, u.getApellido());
            senteciapreparada.setString(3, u.getUser());
            senteciapreparada.setString(4, u.getEmail());
            senteciapreparada.setString(5, getMD5(u));

            senteciapreparada.executeUpdate();

            conexion.close();
        } catch (SQLException e) {
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
            }
        }

        return rta;
    }

    //No repetir usuarios
    public boolean usuarioRepetido(Usuario u) {

        boolean userRepetido = false;

        try {
            conexion = ConexionBD.conectar();

            String consulta = "SELECT user FROM usuarios WHERE user = ?";
            senteciapreparada = conexion.prepareStatement(consulta);
            senteciapreparada.setString(1, u.getUser());

            resultado = senteciapreparada.executeQuery();

            if (resultado.next()) {
                userRepetido = true; //El usuario insertado ya esta registrado
            } else {
                userRepetido = false; //El usuario insertado no esta registrado
            }

            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error" + e);
            }

        }
        System.out.println("El valor del usuario repetido es " + userRepetido);
        return userRepetido;
    }

    //No repetir correos electronicos
    public boolean correoRepetido(Usuario u) {

        boolean correoRepetido = false;

        try {
            conexion = ConexionBD.conectar();

            String consulta = "SELECT user FROM usuarios WHERE email = ?";
            senteciapreparada = conexion.prepareStatement(consulta);
            senteciapreparada.setString(1, u.getEmail());

            resultado = senteciapreparada.executeQuery();

            if (resultado.next()) {
                correoRepetido = true; //El usuario insertado ya esta registrado
            } else {
                correoRepetido = false; //El usuario insertado no esta registrado
            }

            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error" + e);
            }

        }
        System.out.println("El valor del correo repetido es " + correoRepetido);
        return correoRepetido;
    }

    //Login de la pagina
    public Usuario Login(Usuario u) {
        try {
            conexion = ConexionBD.conectar();
            String consulta = "SELECT user,clave FROM usuarios WHERE user = ? AND clave = ?";

            senteciapreparada = conexion.prepareStatement(consulta);
            senteciapreparada.setString(1, u.getUser());
            senteciapreparada.setString(2, getMD5(u));

            resultado = senteciapreparada.executeQuery();
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                conexion.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }
        return u;

    }

    //Validar usuario y contraseña
    public boolean ValidarUserLogin(Usuario u) {

        boolean validarUserL = false;

        try {
            conexion = ConexionBD.conectar();
            String consulta = "SELECT user FROM usuarios WHERE user = ?";
            senteciapreparada = conexion.prepareStatement(consulta);
            senteciapreparada.setString(1, u.getUser());

            resultado = senteciapreparada.executeQuery();

            if (resultado.next()) {
                validarUserL = true; //Usuario registrado ya
            } else {
                validarUserL = false;//El usuario aun no se registra
            }

            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                conexion.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }

        return validarUserL;
    }

    public boolean ValidarClaveLogin(Usuario u) {

        boolean validarClaveL = false;

        try {
            conexion = ConexionBD.conectar();
            String consulta1 = "SELECT clave FROM usuarios WHERE user = ? and clave = ?";
            senteciapreparada = conexion.prepareStatement(consulta1);
            senteciapreparada.setString(1, u.getUser());
            senteciapreparada.setString(2, getMD5(u));

            resultado = senteciapreparada.executeQuery();

            if (resultado.next()) {
                validarClaveL = true; //Usuario registrado ya
            } else {
                validarClaveL = false;//El usuario aun no se registra
            }

            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            try {
                conexion.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
            }
        }

        return validarClaveL;
    }
    
    //Listar Usuario Por nombre de Usuario
    
    public Usuario listarUser(Usuario u){
        String sql = "SELECT * FROM usuarios WHERE user = ?";
          
        try {
           conexion = ConexionBD.conectar();
           senteciapreparada = conexion.prepareStatement(sql);
           senteciapreparada.setString(1, u.getUser());
           resultado =  senteciapreparada.executeQuery();
           
           while(resultado.next()){
               
               u.setId(resultado.getInt(1));
               u.setNombre(resultado.getString(2));
               u.setApellido(resultado.getString(3));
               u.setUser(resultado.getString(4));
               u.setEmail(resultado.getString(5));

           }
           

           conexion.close();
            
        } catch (SQLException e) {
            
        }
        return u;
            
        
    }
    
    
    //Actualizar Usuario Foto
    
    public static boolean ActualizarFoto(Usuario u){
        boolean resp = false;

        try{
            conexion = ConexionBD.conectar();
            
            String consulta1 = "UPDATE usuarios SET avatar = ? WHERE serial = ?";
            
            senteciapreparada = conexion.prepareStatement(consulta1);
            senteciapreparada.setBlob(1, u.getAvatar());
            senteciapreparada.setInt(2, u.getId());
            
            
            int i = senteciapreparada.executeUpdate();
            
            if(i == 1)
                resp = true;
            else
                resp = false;
            
            conexion.close();
        }catch (SQLException ex) {System.out.println(ex.getMessage());
        }catch(Exception e){System.out.println(e.getMessage());
        }
        return resp;
    }
    
    //Actualizar clave de Usuario
    
    public boolean ActualizarClave(Usuario u){
        boolean resp = false;

        try{
            conexion = ConexionBD.conectar();
            
            String consulta1 = "UPDATE usuarios SET clave = ? WHERE user = ?";
            
            senteciapreparada = conexion.prepareStatement(consulta1);
            senteciapreparada.setString(1, getMD5(u));
            senteciapreparada.setString(2, u.getUser());
            
            
            int i = senteciapreparada.executeUpdate();
            
            if(i == 1)
                resp = true;
            else
                resp = false;
            
            conexion.close();
        }catch (SQLException ex) {System.out.println(ex.getMessage());
        }catch(Exception e){System.out.println(e.getMessage());
        }
        return resp;
    }
    
    
    

}
