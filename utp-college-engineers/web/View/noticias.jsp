<%-- 
    Document   : noticias
    Created on : 17 oct. 2023, 11:37:49
    Author     : jhn_g
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Noticia"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.NoticiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UTP - Facultad de Ingeniería</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <!-- Estilos -->
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
        <jsp:include page="../components/navbar.jsp" />
        <!-- / Navegación -->
        <!-- Noticias -->
        <section class="news-container">
            <div class="news-header">
                <h2>Noticias</h2>
            </div>
            <table id="tabla" class="table" style="width:100%">
                <thead>
                    <tr>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        NoticiaDAO noticiaDAO = new NoticiaDAO();
                        List<Noticia> list = noticiaDAO.toList();
                        Iterator<Noticia> iterador = list.iterator();
                        Noticia noticia = null;

                        while (iterador.hasNext()) {
                            noticia = iterador.next();
                    %>
                    <tr>
                        <td>
                            <div class="news-item">
                                <div class="news-image-container">
                                    <%
                                        String imagePath = "/utp-college-engineers/SvNoticia?id=" + noticia.getId_noticia();
                                        if (noticia.getImagen() != null) {
                                    %>
                                    <img class="news-img" src="<%= imagePath%>" alt="no-photo" />
                                    <%
                                    } else {
                                    %>
                                    <img class="news-img" src="../images/no-photo.jpg" alt="no-photo" />
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="news-content-container">
                                    <h3 class="news-title"><%= noticia.getTitulo()%></h3>
                                    <span class="news-date"><%= noticia.getFecha()%></span>
                                    <p class="news-description"><%= noticia.getDescripcion()%></p>
                                    <a class="news-link" href="#">Ver noticia <i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
        <!-- /Noticias -->

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
        <!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <!-- Paginación -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#tabla').DataTable({
                    "paging": true,
                    "lengthMenu": [5, 10, 25, 50],
                    "searching": false
                });
            });
        </script>
    </body>
</html>
