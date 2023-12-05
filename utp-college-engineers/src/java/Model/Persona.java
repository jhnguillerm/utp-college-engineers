package Model;

import java.io.InputStream;

public class Persona {

    private int id;
    private String nombres;
    private String correo;
    private String password;
    private String carrera;
    private String telefono;
    private String direccion;
    private String rol;
    private InputStream imagen;

    public Persona() {
    }

    public Persona(int id, String nombres, String correo, String password, String carrera, String telefono, String direccion, String rol, InputStream imagen) {
        this.id = id;
        this.nombres = nombres;
        this.correo = correo;
        this.password = password;
        this.carrera = carrera;
        this.telefono = telefono;
        this.direccion = direccion;
        this.rol = rol;
        this.imagen = imagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

}
