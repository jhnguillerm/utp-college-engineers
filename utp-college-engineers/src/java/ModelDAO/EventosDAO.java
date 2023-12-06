
package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Eventos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventosDAO extends ConexionDB implements CRUD<Eventos>{
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs;
    Eventos evento= new Eventos();

    @Override
    public List toList() {
        ArrayList<Eventos> list = new ArrayList<>();
        
        String sql = "SELECT * FROM evento";
        
        try {
            connection = conexionDB.getConnection();
            
            ps = connection.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Eventos evento = new Eventos();
                
                evento.setId_evento(rs.getInt("id"));
                evento.setImagen(rs.getBytes("imagen"));
                evento.setTitulo(rs.getString("titulo"));
               evento.setFecha(rs.getString("fecha_publicacion"));
                evento.setDescripcion(rs.getString("descripcion"));
               evento.setImagen_url(rs.getString("imagen_url"));
                
                list.add(evento);
            }
        } catch (Exception e) {
            System.out.println("Noticia - toList: " + e);
        }
        return list;
      
    }

    @Override
    public boolean create(Eventos entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Eventos entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Eventos entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean search(Eventos entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<Eventos> getTop4Events() {
        ArrayList<Eventos> list = new ArrayList<>();

        String sql = "SELECT * FROM evento ORDER BY fecha_publicacion DESC LIMIT 4";

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                Eventos evento = new Eventos();

                evento.setId_evento(rs.getInt("id"));
                evento.setImagen(rs.getBytes("imagen"));
                evento.setTitulo(rs.getString("titulo"));
                evento.setFecha(rs.getString("fecha_publicacion"));
                evento.setDescripcion(rs.getString("descripcion"));
                evento.setImagen_url(rs.getString("imagen_url"));

                list.add(evento);
            }
        } catch (Exception e) {
            System.out.println("Evento - getTop4RecentEvents: " + e);
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
    
}
