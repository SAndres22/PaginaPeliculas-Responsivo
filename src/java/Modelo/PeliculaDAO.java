package Modelo;

import Config.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author S_and
 */
public class PeliculaDAO {
    private static Connection conexion;
    private static PreparedStatement senteciapreparada;
    private static ResultSet resultado;
    int rta;
    
    //Listar descripcion de las peliculas
    
    public static ArrayList<Pelicula> ListarDesP(){
        String consulta = "SELECT * FROM peliculas";
        ArrayList<Pelicula> listaPeliDes = new ArrayList<>();
         
        try {
           conexion = ConexionBD.conectar();
           senteciapreparada = conexion.prepareStatement(consulta);
           resultado = senteciapreparada.executeQuery();
           
           while(resultado.next()){
               Pelicula p = new Pelicula();
               p.setCodP(resultado.getInt(1));
               p.setNombreP(resultado.getString(2));
               p.setGeneroP(resultado.getString(3));
               p.setDescripcion(resultado.getString(4));
               
               listaPeliDes.add(p); //Agregamos a la lista
           }
           
           conexion.close();
            
        } catch (Exception e) {
            
        }
        return listaPeliDes;
    }
    
    //Insertar Peliculas
    
    public static boolean InsertarPelis(Pelicula p){
        boolean resp = false;

        try{
            conexion = ConexionBD.conectar();
            
            String consulta1 = "INSERT INTO peliculas (nombreP, generoP, descripcionP, imagenP) VALUES (?,?,?,?)";
            
            senteciapreparada = conexion.prepareStatement(consulta1);
            
            senteciapreparada.setString(1, p.getNombreP());
            senteciapreparada.setString(2, p.getGeneroP());
            senteciapreparada.setString(3, p.getDescripcion());
            senteciapreparada.setBlob(4, p.getFotoP());
            
            
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
    
    //Lsitar pelicula por ID
    
        public Pelicula listarID(int id){
        Pelicula peli = new Pelicula();
        String sql = "SELECT * FROM peliculas WHERE cod_P = " +id;
        
         
        try {
           conexion = ConexionBD.conectar();
           senteciapreparada = conexion.prepareStatement(sql);
           resultado =  senteciapreparada.executeQuery();
           
           while(resultado.next()){
               peli.setCodP(resultado.getInt(1));
               peli.setNombreP(resultado.getString(2));
               peli.setGeneroP(resultado.getString(3));
               peli.setDescripcion(resultado.getString(4));
           }
           
           conexion.close();
            
        } catch (SQLException e) {
            
        }
        return peli;
        
    }
}
