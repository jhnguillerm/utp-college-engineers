package ModelDAO;

import Config.ConexionDB;

import Interface.Validar;
import Model.Persona;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class PersonasDAO extends ConexionDB implements Validar {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs;
    int r = 0;

    public List<Persona> toList() {
        List<Persona> personasList = new ArrayList<>();

        String sql = "SELECT * FROM user";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Persona persona = new Persona();

                persona.setId(rs.getInt("id"));
                persona.setNombres(rs.getString("nombres"));
                persona.setCorreo(rs.getString("correo"));
                persona.setPassword(rs.getString("password"));
                persona.setCarrera(rs.getString("carrera"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setRol(rs.getString("rol"));
                persona.setImagen(rs.getBinaryStream("imagen"));

                personasList.add(persona);
            }
        } catch (Exception e) {
            System.out.println("Error en toList: " + e);
        } finally {
            closeResources();
        }

        return personasList;
    }

    public void toListImagen(int id, HttpServletResponse response) {
        String sql = "SELECT * FROM user WHERE id = " + id;
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

            int i;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
            System.out.println("Error en toListImagen: " + e);
        } finally {
            closeResources();
            try {
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                if (bufferedOutputStream != null) {
                    bufferedOutputStream.close();
                }
            } catch (Exception ex) {
                System.out.println("Error al cerrar recursos: " + ex);
            }
        }
    }

    public void create(Persona persona) {
        String sql = "INSERT INTO user (nombres, correo, password, carrera, telefono, direccion, rol, imagen) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, persona.getNombres());
            ps.setString(2, persona.getCorreo());
            String encryptedPassword = getMD5(persona.getPassword());
            ps.setString(3, encryptedPassword);
            ps.setString(4, persona.getCarrera());
            ps.setString(5, persona.getTelefono());
            ps.setString(6, persona.getDireccion());
            ps.setString(7, persona.getRol());
            ps.setBlob(8, persona.getImagen());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en create: " + e);
        } finally {
            closeResources();
        }
    }

    public void update(Persona persona) {
        String sql = "UPDATE user SET nombres = ?, correo = ?, password = ?, carrera = ?, telefono = ?, direccion = ?, rol = ?, imagen = ? WHERE id = ?";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, persona.getNombres());
            ps.setString(2, persona.getCorreo());
             String encryptedPassword = getMD5(persona.getPassword());
            ps.setString(3, encryptedPassword);
            ps.setString(4, persona.getCarrera());
            ps.setString(5, persona.getTelefono());
            ps.setString(6, persona.getDireccion());
            ps.setString(7, persona.getRol());
            ps.setBlob(8, persona.getImagen());
            ps.setInt(9, persona.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en update: " + e);
        } finally {
            closeResources();
        }
    }

    public Persona getPersonaById(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        Persona persona = null;

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                persona = new Persona();

                persona.setId(rs.getInt("id"));
                persona.setNombres(rs.getString("nombres"));
                persona.setCorreo(rs.getString("correo"));
                persona.setCarrera(rs.getString("carrera"));
                persona.setTelefono(rs.getString("telefono"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setRol(rs.getString("rol"));
                persona.setImagen(rs.getBinaryStream("imagen"));
            }
        } catch (Exception e) {
            System.out.println("Error en getPersonaById: " + e);
        } finally {
            closeResources();
        }

        return persona;
    }

    public void delete(int id) {
        String sql = "DELETE FROM user WHERE id = ?";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en delete: " + e);
        } finally {
            closeResources();
        }
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

    public Persona login(String correo, String password) {
        String sql = "SELECT * FROM user where  correo=? and password=?";

        Persona empleado = new Persona();

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                empleado.setId(rs.getInt("id"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setCorreo(rs.getString("correo"));
                empleado.setPassword(rs.getString("password"));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return empleado;
    }

    public boolean validarDatos(String correo, String password) {

        String sql = "SELECT * FROM user where  correo=? and password=?";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public int validar(Persona per) {

        String sql = "SELECT * FROM user where  correo=? and password=?";
        try {

            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            ps.setString(1, per.getCorreo());
            ps.setString(1, per.getPassword());

            rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;

                per.setNombres(rs.getNString("correo"));
                per.setNombres(rs.getNString("password"));

            }
            if (r == 1) {
                return 1;

            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }

    }

    public String getMD5(String input) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, bytes);
            String string = numero.toString(16);
            while (string.length() < 32) {
                string = "0" + string;
            }
            return string;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

}
