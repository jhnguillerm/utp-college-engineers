/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marlon
 */
public class SessionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Obtén la sesión
        HttpSession session = httpRequest.getSession(false);

        // Obtén la URI actual
        String uri = httpRequest.getRequestURI();

        // Permite el acceso a la página de inicio de sesión sin autenticación
        if (uri.endsWith("index.jsp") || uri.endsWith("index.jsp")) {
            chain.doFilter(request, response);
            return;
        }

        // Verifica si el usuario está autenticado
        if (session != null && session.getAttribute("correoa") != null) {
            chain.doFilter(request, response);  // Usuario autenticado, permite el acceso
        } else {
            // Usuario no autenticado, redirige a la página de inicio de sesión
            httpResponse.sendRedirect("index.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Puedes realizar inicializaciones si es necesario
    }

    @Override
    public void destroy() {
        // Puedes realizar limpieza si es necesario
    }
    
}
