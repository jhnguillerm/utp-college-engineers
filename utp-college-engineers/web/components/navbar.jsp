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
            <span class="align-middle px-1"><%= nombres%></span>
            <img src="<%= "/utp-college-engineers/SvPersona?id=" + id%>" alt="foto-perfil" width="32" height="32" class="rounded-circle">
        </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="../View/perfil.jsp?<%= id%>">Perfil</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/CerrarSesionServlet">Cerrar Sesión</a></li>
        </ul>
        <%
        } else {
        %>
        <a href="../View/login.jsp" class="btn btn-danger rounded-0 me-3">
            Ingresar
        </a>
        <%
            }
        %>
    </div>
</nav>