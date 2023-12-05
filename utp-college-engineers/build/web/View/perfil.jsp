<%@page import="ModelDAO.PersonasDAO"%>
<%@ page import="Model.Persona" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sessionPersona = request.getSession();
    int id = (int) sessionPersona.getAttribute("id");
    PersonasDAO personasDAO = new PersonasDAO();
    Persona persona = personasDAO.getPersonaById(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <!-- Estilos -->
        <link rel="stylesheet" href="../css/style.css"/>
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="../components/navbar.jsp" />
        <!-- /Navbar -->
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <%
                                    String imagePath = "/utp-college-engineers/SvPersona?id=" + persona.getId();
                                    if (persona.getImagen() != null) {
                                %>
                                <img src="<%= imagePath%>" alt="no-photo" class="rounded-circle img-fluid" style="width: 150px;" />
                                <%
                                } else {
                                %>
                                <img src="../images/no-photo.jpg" alt="no-photo" class="rounded-circle img-fluid" style="width: 150px;" />
                                <%
                                    }
                                %>
                                <h5 class="my-3"><%= persona.getNombres() %></h5>
                                <p class="text-muted mb-1"><%= persona.getRol()%></p>
                                <p class="text-muted mb-4"><%= persona.getCarrera()%></p>
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="editarPerfil.jsp?id=<%= id %>" class="btn btn-danger rounded-0">Editar perfil</a>
                                </div>
                                <% if ("Administrador".equals(persona.getRol())) { %>
                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="panelNoticia.jsp" class="btn btn-dark rounded-0">Administrar sistema</a>
                                    </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Nombres</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= persona.getNombres() %></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= persona.getCorreo()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Carrera</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= persona.getCarrera()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Telefono</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= persona.getTelefono()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Dirección</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%= persona.getDireccion()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
