
package Controller;

import Model.Persona;
import ModelDAO.PersonasDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class SvPersona extends HttpServlet {
    
    PersonasDAO personasDAO = new PersonasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        personasDAO.toListImagen(id, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int idPersona = Integer.parseInt(request.getParameter("txtIdPersona"));
            String rol = request.getParameter("txtRol");
            String nombres = request.getParameter("nombres");
            String correo = request.getParameter("correo");
            String carrera = request.getParameter("carrera");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String nuevaContrasena = request.getParameter("nuevaContrasena");

            Part filePart = request.getPart("fileImagen");
            InputStream inputStream = filePart.getInputStream();

            Persona personaActualizada = new Persona();
            personaActualizada.setId(idPersona);
            personaActualizada.setNombres(nombres);
            personaActualizada.setCorreo(correo);
            personaActualizada.setCarrera(carrera);
            personaActualizada.setTelefono(telefono);
            personaActualizada.setDireccion(direccion);
            personaActualizada.setPassword(nuevaContrasena);
            personaActualizada.setRol(rol);
            personaActualizada.setImagen(inputStream);

            personasDAO.update(personaActualizada);

            response.sendRedirect(request.getContextPath() + "/View/perfil.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
