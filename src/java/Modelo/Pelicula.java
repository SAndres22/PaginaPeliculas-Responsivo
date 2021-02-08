package Modelo;

import java.io.InputStream;

/**
 *
 * @author S_and
 */
public class Pelicula {
    
    int codP;
    String nombreP;
    String generoP;
    String descripcion;
    InputStream FotoP;
    
    //Para el avatar agrego
    private byte[] Recuperar_FotoP;
    private String Recuperar_FotoP_Base64;

    public Pelicula() {
    }

    public Pelicula(int codP, String nombreP, String generoP, String descripcion) {
        this.codP = codP;
        this.nombreP = nombreP;
        this.generoP = generoP;
        this.descripcion = descripcion;
    }

    public int getCodP() {
        return codP;
    }

    public void setCodP(int codP) {
        this.codP = codP;
    }

    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public String getGeneroP() {
        return generoP;
    }

    public void setGeneroP(String generoP) {
        this.generoP = generoP;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public InputStream getFotoP() {
        return FotoP;
    }

    public void setFotoP(InputStream FotoP) {
        this.FotoP = FotoP;
    }

    public byte[] getRecuperar_FotoP() {
        return Recuperar_FotoP;
    }

    public void setRecuperar_FotoP(byte[] Recuperar_FotoP) {
        this.Recuperar_FotoP = Recuperar_FotoP;
    }

    public String getRecuperar_FotoP_Base64() {
        return Recuperar_FotoP_Base64;
    }

    public void setRecuperar_FotoP_Base64(String Recuperar_FotoP_Base64) {
        this.Recuperar_FotoP_Base64 = Recuperar_FotoP_Base64;
    }
    
    
    
}
