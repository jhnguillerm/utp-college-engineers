package Controller;

import Model.Persona;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModelDAO.PersonasDAO;
import javax.servlet.http.HttpSession;

public class SvLogin extends HttpServlet {

    Persona empleado = new Persona();
    PersonasDAO empleadoDAO = new PersonasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String accion = request.getParameter("accion");

        if (accion != null && accion.equals("login")) {
            if (session.getAttribute("usuario") != null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }

            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            String encryptedPassword = empleadoDAO.getMD5(password);

            Persona empleado = empleadoDAO.login(usuario, encryptedPassword);

            if (empleado != null && empleado.getCorreo() != null) {
                session.setAttribute("usuario", empleado);

                session.setAttribute("correo", empleado.getCorreo());
                session.setAttribute("nombres", empleado.getNombres());
                session.setAttribute("id", empleado.getId());

                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("View/login.jsp").forward(request, response);
            }
        } else if (accion.equals("salir")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            request.getRequestDispatcher("View/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
