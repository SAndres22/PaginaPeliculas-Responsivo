
package Modelo;

import java.io.InputStream;

/**
 *
 * @author S_and
 */
public class Usuario {
    
    int id;
    String nombre;
    String apellido;
    String user;
    String email;
    String clave;
    InputStream avatar;
    
    //Para el avatar agrego
    private byte[] Recuperar_avatar;
    private String Recuperar_Avatar_Base64;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String apellido, String user, String email, String clave, InputStream avatar) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.user = user;
        this.email = email;
        this.clave = clave;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public InputStream getAvatar() {
        return avatar;
    }

    public void setAvatar(InputStream avatar) {
        this.avatar = avatar;
    }

    public byte[] getRecuperar_avatar() {
        return Recuperar_avatar;
    }

    public void setRecuperar_avatar(byte[] Recuperar_avatar) {
        this.Recuperar_avatar = Recuperar_avatar;
    }

    public String getRecuperar_Avatar_Base64() {
        return Recuperar_Avatar_Base64;
    }

    public void setRecuperar_Avatar_Base64(String Recuperar_Avatar_Base64) {
        this.Recuperar_Avatar_Base64 = Recuperar_Avatar_Base64;
    }
    
    
    
    
}
