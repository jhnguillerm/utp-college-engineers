<%@page import="ModelDAO.PersonasDAO"%>
<%@ page import="Model.Persona" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idPersonaParam = request.getParameter("id");
    int id = (idPersonaParam != null && !idPersonaParam.isEmpty()) ? Integer.parseInt(idPersonaParam) : 0;
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
            <form action="/utp-college-engineers/SvPersona" method="post" class="m-0" enctype="multipart/form-data">
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
                                    <h5 class="my-3"><%= persona.getNombres()%></h5>
                                    <p class="text-muted mb-1"><%= persona.getRol()%></p>
                                    <p class="text-muted mb-4"><%= persona.getCarrera()%></p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button type="submit" class="btn btn-danger rounded-0" name="action" value="edit">Guardar cambios</button>
                                    </div>
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
                                            <input name="txtIdPersona" type="hidden" id="txtIdPersona-hidden" class="form-control" value="<%= persona.getId()%>">
                                            <input name="txtRol" type="hidden" id="txtRol-hidden" class="form-control" value="<%= persona.getRol()%>">
                                            <input type="text" class="form-control" id="nombres" name="nombres" value="<%= persona.getNombres()%>" required>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="correo" name="correo" value="<%= persona.getCorreo()%>" required>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Carrera</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="carrera" name="carrera" value="<%= persona.getCarrera()%>">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Telefono</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="tel" class="form-control" id="telefono" name="telefono" value="<%= persona.getTelefono()%>">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Dirección</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="direccion" name="direccion" value="<%= persona.getDireccion()%>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Nueva contraseña</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="nuevaContrasena" name="nuevaContrasena" required>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Repetir contraseña</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="repetirContrasena" name="repetirContrasena" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Imagen</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="file" class="form-control" id="fileImagen" name="fileImagen">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
