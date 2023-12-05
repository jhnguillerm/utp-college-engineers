<%@page import="Model.Eventos"%>
<%@page import="ModelDAO.EventosDAO"%>
<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UTP - Facultad de Ingeniería</title>
        <link rel="stylesheet" href="../css/noticias.css">
        <!-- Fuentes - Montserrat -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,400;0,500;0,600;1,400&family=Open+Sans:wght@300;500&family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- / Fuentes - Montserrat -->
        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/5e6ee48249.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navegación -->
        <nav class="nav">
            <div class="nav-container">
                <a class="logo-link" href="principal.jsp"><img class="logo" src="../svg/logo-utp.svg" alt="Logo" /></a>
                <div class="vertical-rule"></div>
                <div>
                    <span>Facultad de</span>
                    <span>Ingeniería</span>
                </div>
            </div>
            <div class="nav-menu">
                <a class="nav-link" href="noticias.jsp">Noticias</a>
                <a class="nav-link" href="Eventos.jsp">Eventos</a>
                <a class="nav-link" href="#">Preguntas</a>
                <a class="nav-link" href="#">Productividad</a>
                <a class="nav-link" href="#">Únete</a>
            </div>
        </nav>
        <!-- / Navegación -->
      <!-- Noticias -->
        <section class="news-container">
            <div class="news-header">
                <h2>Eventos</h2>
            </div>
            <%
                EventosDAO eventoDAO = new EventosDAO();
                List<Eventos> list = eventoDAO.toList();
                Iterator<Eventos> iterador = list.iterator();
                Eventos noticia = null;

                while (iterador.hasNext()) {
                    noticia = iterador.next();
            %>
            <div class="news-item">
                <div class="news-image-container">
                    <img class="news-img" style="width: 200px;" src="../<%= noticia.getImagen_url()%>" alt="alt" />
                </div>
                <div class="news-content-container">
                    <h3 class="news-title"><%= noticia.getTitulo()%></h3>
                    <span class="news-date"><%= noticia.getFecha()%></span>
                    <p class="news-description"><%= noticia.getDescripcion()%></p>
                    <a class="news-link" href="#">Ver evento <i class="fa-solid fa-arrow-right-long"></i></a>
                </div>
            </div>
            <%
                }
            %>
        </section>
        <!-- / Noticias -->
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col">
                    <img src="../svg/logo-utp-2.svg" class="logo-2">
                    <p>Suscribete a nuestra comunidad Universitaria para estar al tanto de todo lo 
                        que sucede en nuestra Universidad
                    </p>
                </div>
                <div class="col">
                    <h3>Office <div class="underline"><span></span></div></h3>
                    <p>UTP</p>
                    <p>Dirección: Av. San Camilo 1180, Piura</p>

                    <p class="email-id">admision@utp.edu.pe</p>
                    <h4>+51 123 456 789</h4>
                </div>
                <div class="col">
                    <h3>Links<div class="underline"><span></span></div></h3>
                    <ul>
                        <li><a href="">Home</a></li>
                        <li><a href="">Servicios</a></li>
                        <li><a href="">About </a></li>
                        <li><a href="">Features</a></li>
                        <li><a href="">Contacts</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h3>Contactanos<div class="underline"><span></span></div></h3>
                    <form >
                        <i class="far fa-envelope"></i>
                        <input type="email" placeholder="Ingresa tu correo" required>
                        <button type="submit"><i class="fas fa-arrow-right"></i></button>
                    </form>
                    <div class="social-icons">
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-twitter"></i>
                        <i class="fab fa-whatsapp"></i>
                        <i class="fab fa-instagram"></i>
                    </div>
                </div>
            </div>
            <hr>
            <p class="copyright">ESTUDIANTES UTP 2033-Todos los derechos reservados</p>
        </footer>
        <!-- / Footer -->
    </body>
</html>
