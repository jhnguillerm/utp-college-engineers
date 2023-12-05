
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,500;0,600;0,700;1,400&display=swap"
            rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">


        <title>Iniciar Sesion </title>
    </head>

    <body>
        <div class="container-form register hide" >
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                    <p>Para unirse a nuestra comunidad ingrese sus datos</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in">

                </div>

            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear Cuenta</h2>
                    <div class="icons">
                        <i class='bx bxl-google'></i>
                        <i class='bx bxl-github'></i>
                        <i class='bx bxl-linkedin'></i>
                    </div>
                    <p>O usa tu email para registrarte</p>
                    <%
                        String message = request.getParameter("message");
                        if (message != null && !message.isEmpty()) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong><%= message%></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        }
                    %>
                    <form  action="register.jsp" method="post" >
                        <div class="form" action>
                            <label>
                                <i class='bx bx-user'></i>
                                <input type="text" name="name" placeholder="Nombre Completo">
                            </label>
                            <label>
                                <i class='bx bx-envelope'></i>
                                <input type="email" name="address" placeholder="Correo Electronico">
                            </label>
                            <label >
                                <i class='bx bx-lock-alt'></i>
                                <input type="password"  name="pass" placeholder="Cotraseña">
                            </label>
                            <input type="submit" name="btn-registro" value="Registrarse">
                        </div>
                    </form>
                </div>
            </div>

        </div>


        <div class="container-form login ">
            <div class="information">
                <div class="info-childs">
                    <h2>!Bienvenido Nuevamente!</h2>
                    <p>Para unirse a nuestra comunidad ingrese sus datos</p>
                    <input type="button" value="Registrarse" id="sign-up">

                </div>

            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Iniciar Sesión</h2>
                    <div class="icons">
                        <i class='bx bxl-google'></i>
                        <i class='bx bxl-github'></i>
                        <i class='bx bxl-linkedin'></i>
                    </div>
                    <p>O iniciar sesion con una cuenta</p>
                    <div class="container py-4">
                        <%
                            String error = (String) request.getAttribute("error");
                            if (error != null && !error.isEmpty()) {
                        %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong><%= error%></strong>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%
                            }
                        %>


                        <div class="form">
                            <form action="${pageContext.request.contextPath}/SvLogin" method="post">

                                <label>
                                    <i class='bx bx-envelope'></i>
                                    <input type="email" name="txtUsuario" placeholder="Correo Electronico">
                                </label>
                                <label>
                                    <i class='bx bx-lock-alt'></i>
                                    <input type="password" name="txtPassword" placeholder="Contraseña">
                                </label>

                                <input type="submit" name="accion" value="login">

                            </form> 
                        </div>
                    </div>
                </div>

            </div>

            <script src="${pageContext.request.contextPath}/Script/script.js"></script>



    </body>

</html>