<%@page import="java.util.List"%>
<%@page import="ModelDAO.NoticiaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="../components/navbarPanel.jsp" />
        <!-- /Navbar -->
        <!-- Noticias -->
        <div class="mx-5 bg-body shadow-lg rounded">
            <div class="d-flex justify-content-end">
                <a class="btn btn-danger rounded-0 mx-5 my-3" id="btn-agregar" href="nuevaNoticia.jsp">Agregar Noticia</a>
            </div>
            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>
                        <th>Título</th>
                        <th>Fecha</th>
                        <th>Actions</th>
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
                            <div class="d-flex align-items-center">
                                <%
                                    String imagePath = "/utp-college-engineers/SvNoticia?id=" + noticia.getId_noticia();
                                    if (noticia.getImagen() != null) {
                                %>
                                <img src="<%= imagePath%>" alt="no-photo" width="50px" height="50px" />
                                <%
                                } else {
                                %>
                                <img src="../images/no-photo.jpg" alt="no-photo" width="50px" height="50px" />
                                <%
                                    }
                                %>
                                <div class="ms-3">
                                    <p class="fw-normal mb-1"><%= noticia.getTitulo()%></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="fw-normal mb-1"><%= noticia.getFecha()%></p>
                        </td>
                        <td>
                            <!-- Boton editar -->
                            <a href="editarNoticia.jsp?id=<%= noticia.getId_noticia()%>" class="btn text-primary">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <!-- Boton eliminar -->
                            <a class="btn text-danger" data-bs-toggle="modal" data-bs-target="#confirmarEliminar">
                                <i class="bi bi-x-square"></i>
                            </a>

                            <!-- Modal de confirmación de eliminación -->
                            <div class="modal fade" id="confirmarEliminar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Confirmar Eliminación</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            ¿Estás seguro de que quieres eliminar esta noticia?
                                        </div>
                                        <div class="modal-footer">
                                            <form action="<%= request.getContextPath()%>/SvNoticia" method="post">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id_noticia" value="<%= noticia.getId_noticia()%>">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-danger">Eliminar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- /Noticias -->
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
