
package Model;

import java.io.InputStream;

public class Noticia {
    
    private int id_noticia;
    private InputStream imagen;
    private String titulo;
    private String fecha;
    private String descripcion;
    private String imagen_url;

    public Noticia() {
    }

    public Noticia(int id_noticia, InputStream imagen, String titulo, String fecha, String descripcion, String imagen_url) {
        this.id_noticia = id_noticia;
        this.imagen = imagen;
        this.titulo = titulo;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.imagen_url = imagen_url;
    }

    public int getId_noticia() {
        return id_noticia;
    }

    public void setId_noticia(int id_noticia) {
        this.id_noticia = id_noticia;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen_url() {
        return imagen_url;
    }

    public void setImagen_url(String imagen_url) {
        this.imagen_url = imagen_url;
    }
}
