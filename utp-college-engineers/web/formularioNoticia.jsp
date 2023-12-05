<!-- formularioNoticia.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Noticias</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/SvAgregarNoticia" method="post" enctype="multipart/form-data">
        <label for="imagen">Imagen:</label>
        <input type="file" name="imagen" accept="image/*" required><br>

        <label for="titulo">Título:</label>
        <input type="text" name="titulo" required><br>

        <label for="fechaPublicacion">Fecha de Publicación:</label>
        <input type="date" name="fechaPublicacion" required><br>

        <label for="descripcion">Descripción:</label>
        <textarea name="descripcion" rows="4" required></textarea><br>

        <label for="imagenUrl">URL de la Imagen:</label>
        <input type="text" name="imagenUrl" required><br>

        <input type="submit" value="Agregar Noticia">
    </form>
</body>
</html>
