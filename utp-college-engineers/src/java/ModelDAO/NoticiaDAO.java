package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Noticia;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class NoticiaDAO extends ConexionDB /*implements CRUD<Noticia>*/ {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs;

    public List toList() {
        ArrayList<Noticia> list = new ArrayList<>();

        String sql = "SELECT * FROM noticia";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                Noticia noticia = new Noticia();

                noticia.setId_noticia(rs.getInt("id"));
                noticia.setImagen(rs.getBinaryStream("imagen"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setFecha(rs.getString("fecha_publicacion"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImagen_url(rs.getString("imagen_url"));

                list.add(noticia);
            }
        } catch (Exception e) {
            System.out.println("Noticia - toList: " + e);
        }
        return list;
    }

    public void toListImagen(int id, HttpServletResponse response) {
        String sql = "SELECT * FROM noticia WHERE id = " + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imagen");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

    public void create(Noticia noticia) {
        String sql = "INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url) VALUES (?, ?, ?, ?, ?)";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            ps.setBlob(1, noticia.getImagen());
            ps.setString(2, noticia.getTitulo());
            ps.setString(3, noticia.getFecha());
            ps.setString(4, noticia.getDescripcion());
            ps.setString(5, noticia.getImagen_url());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Noticia - create: " + e);
        }
    }

    public void update(Noticia noticia) {
        String sql = "UPDATE noticia SET imagen = ?, titulo = ?, fecha_publicacion = ?, descripcion = ?, imagen_url = ? WHERE id = ?";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            ps.setBlob(1, noticia.getImagen());
            ps.setString(2, noticia.getTitulo());
            ps.setString(3, noticia.getFecha());
            ps.setString(4, noticia.getDescripcion());
            ps.setString(5, noticia.getImagen_url());
            ps.setInt(6, noticia.getId_noticia());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Noticia - update: " + e);
        } finally {
            closeResources();
        }
    }

    public Noticia getNoticiaById(int id_noticia) {
        String sql = "SELECT * FROM noticia WHERE id = ?";
        Noticia noticia = null;

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id_noticia);
            rs = ps.executeQuery();

            if (rs.next()) {
                noticia = new Noticia();

                noticia.setId_noticia(rs.getInt("id"));
                noticia.setImagen(rs.getBinaryStream("imagen"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setFecha(rs.getString("fecha_publicacion"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImagen_url(rs.getString("imagen_url"));
            }
        } catch (Exception e) {
            System.out.println("Noticia - getNoticiaById: " + e);
        } finally {
            closeResources();
        }
        return noticia;
    }

    public void delete(int id_noticia) {
        String sql = "DELETE FROM noticia WHERE id = ?";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id_noticia);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Noticia - delete: " + e);
        } finally {
            closeResources();
        }
    }

    public List<Noticia> getTop3News() {
        ArrayList<Noticia> list = new ArrayList<>();

        String sql = "SELECT * FROM noticia ORDER BY fecha_publicacion DESC LIMIT 3";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                Noticia noticia = new Noticia();

                noticia.setId_noticia(rs.getInt("id"));
                noticia.setImagen(rs.getBinaryStream("imagen"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setFecha(rs.getString("fecha_publicacion"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImagen_url(rs.getString("imagen_url"));

                list.add(noticia);
            }
        } catch (Exception e) {
            System.out.println("Noticia - getTop3RecentNews: " + e);
        } finally {
            closeResources();
        }
        return list;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("Error al cerrar recursos: " + e);
        }
    }

    public List<Noticia> pagination(int startIndex, int count) {
        List<Noticia> allNoticias = toList();

        // Verificar si el índice de inicio es válido
        if (startIndex < 0 || startIndex >= allNoticias.size()) {
            return Collections.emptyList(); // Índice fuera de rango, devuelve una lista vacía
        }

        // Calcular el índice final
        int endIndex = Math.min(startIndex + count, allNoticias.size());

        // Obtener la sublista de noticias desde el índice de inicio hasta el índice final
        return allNoticias.subList(startIndex, endIndex);
    }

}
