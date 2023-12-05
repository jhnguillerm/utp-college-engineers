package Controller;

import Model.Noticia;
import ModelDAO.NoticiaDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class SvNoticia extends HttpServlet {

    NoticiaDAO noticiaDAO = new NoticiaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        noticiaDAO.toListImagen(id, response);

        String pageParam = request.getParameter("page");
        int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

        // Número de noticias por página
        int pageSize = 5;

        // Calcular el índice de inicio basado en la página actual y el tamaño de la página
        int startIndex = (page - 1) * pageSize;

        // Obtener las noticias para la página actual
        List<Noticia> noticias = noticiaDAO.pagination(startIndex, pageSize);

        // Agregar noticias y detalles de paginación al request
        request.setAttribute("noticias", noticias);
        request.setAttribute("currentPage", page);
        request.setAttribute("pageSize", pageSize);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Crear una nueva noticia
            Part filePart = request.getPart("fileImagen");
            InputStream inputStream = filePart.getInputStream();

            String titulo = request.getParameter("txtTitulo");
            String fecha = request.getParameter("txtFechaPublicacion");
            String descripcion = request.getParameter("txtDescripcion");
            String imagenURL = request.getParameter("txtImagenURL");

            Noticia nuevaNoticia = new Noticia();
            nuevaNoticia.setImagen(inputStream);
            nuevaNoticia.setTitulo(titulo);
            nuevaNoticia.setFecha(fecha);
            nuevaNoticia.setDescripcion(descripcion);
            nuevaNoticia.setImagen_url(imagenURL);

            noticiaDAO.create(nuevaNoticia);

            response.sendRedirect(request.getContextPath() + "/View/panelNoticia.jsp");
        } else if ("edit".equals(action)) {
            // Obtener los valores actualizados de los campos del formulario
            int idNoticia = Integer.parseInt(request.getParameter("txtIdNoticia"));
            String titulo = request.getParameter("txtTitulo");
            String fecha = request.getParameter("txtFechaPublicacion");
            String descripcion = request.getParameter("txtDescripcion");
            String imagenURL = request.getParameter("txtImagenURL");

            // Obtener el Part para la imagen
            Part filePart = request.getPart("fileImagen");
            InputStream inputStream = filePart.getInputStream();

            // Crear una instancia de Noticia con los nuevos valores
            Noticia noticiaActualizada = new Noticia();
            noticiaActualizada.setId_noticia(idNoticia);
            noticiaActualizada.setTitulo(titulo);
            noticiaActualizada.setFecha(fecha);
            noticiaActualizada.setDescripcion(descripcion);
            noticiaActualizada.setImagen_url(imagenURL);
            noticiaActualizada.setImagen(inputStream);

            // Actualizar la noticia en la base de datos
            noticiaDAO.update(noticiaActualizada);

            // Redirigir a tu página de noticias o donde desees
            response.sendRedirect(request.getContextPath() + "/View/panelNoticia.jsp");
        } else if ("delete".equals(action)) {
            // Obtener el ID de la noticia a eliminar
            int idNoticia = Integer.parseInt(request.getParameter("id_noticia"));

            // Lógica para eliminar la noticia
            noticiaDAO.delete(idNoticia);

            // Redirigir a tu página de noticias o donde desees después de la eliminación
            response.sendRedirect(request.getContextPath() + "/View/panelNoticia.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}