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

        <form action="/utp-college-engineers/SvNoticia" method="post" class="m-0" enctype="multipart/form-data">
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 mx-5">
                <div class="d-flex flex-column justify-content-center">
                    <h4 class="mb-1 mt-3">Agregar Noticia</h4>
                </div>
                <div class="d-flex align-content-center flex-wrap gap-3">
                    <button type="submit" class="btn btn-danger rounded-0" id="btn-agregar" name="action" value="create">Agregar Noticia</button>
                </div>
            </div>

            <div class="row mx-5">
                <!-- Información general -->
                <div class="col-12 col-lg-8">
                    <div class="card mb-4 border-0 shadow-lg">
                        <div class="card-header border-0 bg-body">
                            <h5 class="card-title mb-0">Información general</h5>
                        </div>
                        <div class="card-body">
                            <!-- ID -->
                            <div class="row mb-3">
                                <div class="col-4">
                                    <label class="form-label" for="txtIdNoticia">ID</label>
                                    <input type="text" class="form-control" id="txtIdNoticia" disabled>
                                    <input name="txtIdNoticia" type="hidden" id="txtIdNoticia-hidden" class="form-control">
                                </div>
                            </div>
                            <!-- Titulo y Fecha de Publicación en la misma fila -->
                            <div class="mb-3 row">
                                <!-- Titulo -->
                                <div class="col-9">
                                    <label class="form-label" for="txtTitulo">Título</label>
                                    <input type="text" class="form-control" id="txtTitulo" placeholder="Título de la noticia" name="txtTitulo">
                                </div>
                                <!-- Fecha de Publicación -->
                                <div class="col-3">
                                    <label class="form-label" for="txtFechaPublicacion">Fecha de Publicación</label>
                                    <input type="date" class="form-control" id="txtFechaPublicacion" name="txtFechaPublicacion">
                                </div>
                            </div>
                            <!-- Descripcion -->
                            <div class="mb-3">
                                <label class="form-label" for="txtDescripcion">Descripción</label>
                                <textarea class="form-control" id="txtDescripcion" placeholder="Descripción de la noticia" name="txtDescripcion"></textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Segunda columna -->
                <div class="col-12 col-lg-4">
                    <div class="card mb-4 border-0 shadow-lg">
                        <div class="card-header border-0 bg-body">
                            <h5 class="card-title mb-0">Imagen</h5>
                        </div>
                        <div class="card-body">
                            <!-- Imagen -->
                            <div class="mb-3">
                                <label class="form-label" for="fileImagen">Imagen</label>
                                <input type="file" class="form-control" id="fileImagen" name="fileImagen">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Segunda columna -->
            </div>
        </form>

        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
