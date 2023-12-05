<nav class="nav">
    <div class="nav-container">
        <a class="logo-link" href="../index.jsp"><img class="logo" src="../svg/logo-utp-2.svg" alt="Logo" /></a>
        <div class="vertical-rule"></div>
        <div>
            <span>Facultad de</span>
            <span>Ingeniería</span>
        </div>
    </div>
    <div class="nav-menu">
        <a class="nav-link" href="../View/noticias.jsp">Noticias</a>
        <a class="nav-link" href="../View/eventos.jsp">Eventos</a>
        <%
            HttpSession sessionValida = request.getSession(false);

            if (sessionValida != null && sessionValida.getAttribute("correo") != null) {

                String nombres = (String) sessionValida.getAttribute("nombres");
                int id = (int) sessionValida.getAttribute("id");
        %>
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i style="font-size: 20px" class="bi bi-person-bounding-box"></i>
        </a>
        <ul class="dropdown-menu">
            <li class="px-3"><%= nombres%></li>
            <li><a class="dropdown-item" href="../View/perfil.jsp?<%= id%>">Perfil</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/CerrarSesionServlet">Cerrar Sesión</a></li>
        </ul>
        <%
        } else {
        %>
        <a class="nav-link" href="View/principal.jsp">Únete</a>
        <%
            }
        %>
    </div>
</nav>