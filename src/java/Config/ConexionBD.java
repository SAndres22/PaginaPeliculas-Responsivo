package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author S_and
 */
public class ConexionBD {
    
    private static String url = "jdbc:mysql://127.0.0.1:3306/miproyecto?useUnicode=true&characterEncoding=UTF-8"; //la Ip es = localhost
    private static String user = "root";
    private static String password = "admin";
    Connection connection = null;
                                            
    
    public static Connection conectar(){
        Connection conexion = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error" + e);
        }
        return conexion;
    }
    
    public Connection getConnection(){
        return connection;
    }
    
    public void desconectar(){
        connection = null;
    }
    

}
