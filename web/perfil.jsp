<%-- 
    Document   : perfil
    Created on : 17/01/2021, 08:52:38 PM
    Author     : S_and
--%>

<%@page import="Modelo.UsuarioDAO"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<%
    Usuario userR = (Usuario) request.getSession().getAttribute("registro");

    Usuario userI = (Usuario) request.getSession().getAttribute("ingreso");
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SamgPelis | Mi perfil</title>

        <%
            //Deja ingresar si no ha cerrado la sesion de lo contrario redirecciona al index
            if (session.getAttribute("NUser") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <!--Linkeando Font-awesome-Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="img/icon-Pelis.png"/>

        <!--Linkeando CSS -->
        <link rel="stylesheet" href="css/stylesperfil.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="contP">
            <header class="header">
                <div class="cont-title-switch">
                    <div>
                        <h2> Configuración del Perfil</h2>
                    </div>
                    <div>
                        <ul class="nav-menu">
                            <button class="switch" id="switch" >
                                <span><i class="fas fa-sun"></i></span>
                                <span><i class="fas fa-moon"></i></span>
                            </button>
                        </ul>
                    </div>
                </div>

                <div>
                    <div class="perfil-user">
                        <div class="foto_avatar">
                            <!--Traemos la imagen desde el servlet Avatar -->
                            <img class="fotoP" src="Avatar?Usuario=${u.getUser()} "/>   
                            <div class="perfil-user_form">
                                <form action="Actualizar_Usuario" method="post">
                                    <label for="id_input">
                                        <a>
                                            <i class="fas fa-camera"></i>
                                        </a>
                                    </label>
                                    <input style="display: none;" id="id_input" value="ActuFoto" type="submit" name="accion">
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-I">
                    <a class="btn-inicio" href="inicio.jsp"> Ir al Inicio</a>
                </div>
            </header>

            <section class="datosPersonales">
                <div class="cont-nombres">
                    <div>
                        <label>Nombres</label>
                    </div>
                    <div>
                        <span>${u.getNombre()}</span>
                        <span>${u.getApellido()}</span>
                    </div>
                    <div>
                        <label>Nombre de Usuario</label>
                    </div>
                    <div>
                        <span>${u.getUser()}</span>
                    </div>
                    <a class="editar" href="ActualizarFoto.jsp" >Cambiar Nombres <i class="fas fa-edit"></i> </a>
                </div>

                <div class="cont-clave">
                    <div>
                        <label>Contraseña</label>
                    </div>
                    <a class="editar"  href="ActClave.jsp?user=${u.getUser()}" >Cambiar Contraseña <i class="fas fa-edit"></i></a>
                </div>
            </section>
        </div>





        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>
