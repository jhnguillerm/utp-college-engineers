<%@page import="ModelDAO.PersonasDAO"%>
<%@page import="ModelDAO.EventosDAO"%>
<%@page import="Model.Noticia"%>
<%@page import="Model.Eventos"%>
<%@page import="Model.Persona"%>
<%@page import="ModelDAO.NoticiaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UTP - Facultad de Ingeniería</title>
        <!-- Fuentes - Montserrat -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,400;0,500;0,600;1,400&family=Open+Sans:wght@300;500&family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- /Fuentes - Montserrat -->
        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/5e6ee48249.js" crossorigin="anonymous"></script>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <!-- Estilos -->
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <!-- Navegación -->
        <nav class="nav">
            <div class="nav-container">
                <a class="logo-link" href="index.jsp"><img class="logo" src="svg/logo-utp-2.svg" alt="Logo" /></a>
                <div class="vertical-rule"></div>
                <div>
                    <span>Facultad de</span>
                    <span>Ingeniería</span>
                </div>
            </div>
            <div class="nav-menu">
                <a class="nav-link" href="View/noticias.jsp">Noticias</a>
                <a class="nav-link" href="View/eventos.jsp">Eventos</a>
                <%
                    HttpSession sessionValida = request.getSession(false);
                    if (sessionValida != null && sessionValida.getAttribute("correo") != null) {
                        String nombres = (String) sessionValida.getAttribute("nombres");
                        int id = (int) sessionValida.getAttribute("id");
                        PersonasDAO personasDAO = new PersonasDAO();
                        Persona persona = personasDAO.getPersonaById(id);
                        String imagePath = "/utp-college-engineers/SvPersona?id=" + id;
                %>
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="align-middle px-1"><%= nombres%></span>
                    <% if (persona.getImagen() != null) {%>
                    <img src="<%= imagePath%>" alt="" width="32" height="32" class="rounded-circle">
                    <% } else { %>
                    <img src="images/no-photo.jpg" alt="" width="32" height="32" class="rounded-circle">
                    <% }%>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="View/perfil.jsp?<%= id%>">Perfil</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/CerrarSesionServlet">Cerrar Sesión</a></li>
                </ul>
                <%
                } else {
                %>
                <a href="View/login.jsp" class="btn btn-danger rounded-0 me-3">
                    Ingresar
                </a>
                <%
                    }
                %>
            </div>
        </nav>
        <!-- /Navegación -->
        <!-- Main -->
        <main class="site-header">
            <h1 class="header-title">Escuela de Ingeniería - <br> Universidad Tecnológica del Perú</h1>
            <p class="header-description">
                Explora las últimas novedades y eventos que están transformando la UTP Piura en un centro de excelencia en
                ingeniería.
            </p>
            <a class="header-link" href="#discovery-section">Descubre más</a>
        </main>
        <!-- / Main -->
        <!-- Descubrir -->
        <section id=discovery-section class="discovery-section">
            <div class="discovery-title">
                <h2>Descubre</h2>
            </div>
            <div class="discovery-item">
                <div class="discovery-icon">
                    <i class="fa-solid fa-school-flag"></i>
                </div>
                <div>
                    <h3 class="discovery-name">INGENIERÍAS</h3>
                </div>
            </div>
            <div class="discovery-item">
                <div class="discovery-icon">
                    <i class="fa-solid fa-newspaper"></i>
                </div>
                <div>
                    <h3 class="discovery-name">NOTICIAS</h3>
                </div>
            </div>
            <div class="discovery-item">
                <div class="discovery-icon">
                    <i class="fa-solid fa-calendar-days"></i>
                </div>
                <div>
                    <h3 class="discovery-name">EVENTOS</h3>
                </div>
            </div>
        </section>
        <!-- /Descubrir -->
        <!-- Ingenierías -->
        <section class="engineering-section">
            <div class="engineering-name">
                <h2>Ingenierías en UTP - Piura</h2>
            </div>
            <div class="engineering-item">
                <div class="engineering-face front">
                    <img src="images/ingenieria-sistemas.jpg" alt="Imagen de Ingeniería de Sistemas e Informática">
                    <h3 class="engineering-title">Ingeniería de Sistemas e Informática</h3>
                </div>
                <div class="engineering-face back">
                    <h3 class="engineering-title">Ingeniería de Sistemas e Informática</h3>
                    <p class="engineering-description">La Ingeniería de Sistemas e Informática de la Universidad Tecnológica 
                        del Perú (UTP) prepara a los estudiantes para liderar proyectos de programación y sistemas informáticos, 
                        integrar las TIC al negocio, y aplicar metodologías de programación de vanguardia. Los egresados de esta 
                        carrera diseñan la arquitectura de softwares, administran bases de datos, evalúan la seguridad de sistemas 
                        informáticos, y manejan programas de acuerdo con el avance tecnológico que solicitan las empresas.</p>
                    <a class="engineering-link" href="https://www.utp.edu.pe/sites/default/files/malla-curricular/PG_Ing.%20Sistemas%20e%20Inform%C3%A1tica%202023%20%28Malla%29.pdf">Ver malla curricular</a>
                </div>
            </div>
            <div class="engineering-item">
                <div class="engineering-face front">
                    <img src="images/ingenieria-industrial.jpg" alt="Imagen de Ingeniería de Sistemas e Informática">
                    <h3 class="engineering-title">Ingeniería Industrial</h3>
                </div>
                <div class="engineering-face back">
                    <h3 class="engineering-title">Ingeniería Industrial</h3>
                    <p class="engineering-description">La carrera de Ingeniería Industrial de la Universidad Tecnológica del Perú 
                        (UTP) está dirigida a formar profesionales que se ocupen de la planeación, diseño, instalación, evaluación y mejora 
                        de sistemas integrados por recursos humanos, financieros, materiales, equipos e información, con el objetivo de 
                        optimizar los procesos en las organizaciones. Si te interesa esta carrera, es importante que tengas habilidades 
                        para el análisis y la resolución de problemas, capacidad para trabajar en equipo y liderazgo.</p>
                    <a class="engineering-link" href="https://www.utp.edu.pe/sites/default/files/malla-curricular/PG_Ing.%20Industrial%20%28Malla%20digital%29.pdf">Ver malla curricular</a>
                </div>
            </div>
            <div class="engineering-item">
                <div class="engineering-face front">
                    <img src="images/ingenieria-civil.jpg" alt="Imagen de Ingeniería de Sistemas e Informática">
                    <h3 class="engineering-title">Ingeniería Civil</h3>
                </div>
                <div class="engineering-face back">
                    <h3 class="engineering-title">Ingeniería Civil</h3>
                    <p class="engineering-description">La carrera de Ingeniería Civil de la UTP te prepara para diseñar, implementar, evaluar 
                        y mejorar sistemas complejos que involucran recursos humanos, financieros, materiales, equipos e información. Como 
                        ingeniero civil, podrás optimizar los procesos en las organizaciones y contribuir al desarrollo sostenible del país. 
                        Para estudiar esta carrera, necesitas tener aptitudes para el análisis y la solución de problemas, habilidad para 
                        trabajar en equipo y liderazgo. ¡Sé parte de la comunidad UTP y forma parte de los expertos en la optimización de 
                        procesos empresariales!</p>
                    <a class="engineering-link" href="https://www.utp.edu.pe/sites/default/files/malla-curricular/PG_Ing.%20Civil%202023%20%28Malla%29_0.pdf">Ver malla curricular</a>
                </div>
            </div>
        </section>
        <!-- /Ingenierías -->
        <!-- Noticias -->
        <section class="news-section">
            <div class="news-header">
                <h2>Noticias</h2>
            </div>
            <div class="news-items">
                <%
                    NoticiaDAO noticiaDAO = new NoticiaDAO();
                    List<Noticia> list = noticiaDAO.getTop3News();
                    Iterator<Noticia> iterador = list.iterator();
                    Noticia noticia = null;

                    while (iterador.hasNext()) {
                        noticia = iterador.next();
                        String descripcion = noticia.getDescripcion();
                        int limiteCaracteres = 150;
                        if (descripcion.length() > limiteCaracteres) {
                            descripcion = descripcion.substring(0, limiteCaracteres) + "...";
                        }
                %>
                <div class="news-item">
                    <%
                        String imagePath = "/utp-college-engineers/SvNoticia?id=" + noticia.getId_noticia();
                        if (noticia.getImagen() != null) {
                    %>
                    <img class="news-image" src="<%= imagePath%>" alt="Imagen de Noticia" />
                    <%
                    } else {
                    %>
                    <img class="news-image" src="images/no-photo.jpg" alt="Imagen de Noticia" />
                    <%
                        }
                    %>
                    <div class="news-content">
                        <h3 class="news-title"><%= noticia.getTitulo()%></h3>
                        <span class="news-date"><%= noticia.getFecha()%></span>
                        <p class="news-description"><%= descripcion%></p>
                        <a class="news-link" href="#">Ver noticia  <i class="fa-solid fa-arrow-right-long"></i></a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <div class="news-more">
                <a class="news-more-link" href="View/noticias.jsp">Ver más noticias</a>
            </div>
        </section>
        <!-- /Noticias -->
        <!-- Eventos -->
        <div class="container-fluid w-100">
            <div class="news-section">
                <div class="news-header">
                    <h2>Eventos</h2>
                </div>
            </div>

            <div class="row justify-content-center w-100">
                <%
                    EventosDAO eventosDAO = new EventosDAO();
                    List<Eventos> eventosList = eventosDAO.getTop4Events();

                    for (Eventos evento : eventosList) {
                        String descripcion = evento.getDescripcion();
                        int limiteCaracteres = 100;
                        if (descripcion.length() > limiteCaracteres) {
                            descripcion = descripcion.substring(0, limiteCaracteres) + "...";
                        }
                %>
                <div class="col-lg-3 col-sm-6 grid-margin mb-5 mb-sm-2">
                    <div class="position-relative image-hover" style="height: 400px">
                        <img src="<%= evento.getImagen_url()%>" class="h-100" alt="Evento">
                    </div>
                    <h5 class="font-weight-bold mt-3">
                        <%= evento.getTitulo()%>
                    </h5>
                    <span class="news-date"><%= evento.getFecha()%></span>
                    <p class="fs-15 font-weight-normal">
                        <%= descripcion%>
                    </p>
                    <a class="news-link" href="#">Ver Evento <i class="fa-solid fa-arrow-right-long"></i></a>
                </div>
                <%
                    }
                %>
            </div>

            <div class="news-section">
                <div class="news-more">
                    <a class="news-more-link" href="View/eventos.jsp">Ver más eventos</a>
                </div>
            </div>
        </div>
        <!-- /Eventos -->
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col">
                    <img src="svg/logo-utp-2.svg" class="logo-2">
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
        <!-- /Footer -->
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>

</html>