<%-- 
    Document   : inicioAdmin
    Created on : 4/02/2021, 10:58:29 AM
    Author     : S_and
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.PeliculaDAO"%>
<%@page import="Modelo.Pelicula"%>
<%@page import="Modelo.Usuario"%>

<%
    Usuario userI = (Usuario)request.getSession().getAttribute("ingresoA");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SamgPelis | Inicio</title>
        
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
        <link rel="stylesheet" href="css/stylesInicioAdmin.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body>
        <header class="header">
            <nav class="cont-nav">
                <div>
                    <img class="nav-logo" src="img/Logo-Pelis.png" alt="Logo de SamgPelis">  
                </div>
                <div class="nav-menu_peliculas">
                    <label for="desplegar"></label>
                    <input type="checkbox" id="desplegar" checked>
                    <ul class="menu-hamburger_Item">
                        <a href="#"><li>Acción</li></a>
                        <a href="#"><li>Infantil</li></a>
                        <a href="#"><li>Comedia</li></a>
                        <a href="#"><li>Terror</li></a>
                        <a href="#"><li>Ciencia Ficción</li></a>
                        <a href="#"><li>Aventura</li></a>
                        <a href="#"><li>Suspenso</li></a>
                        <a href="#"><li>Romance</li></a>
                        <a href="#"><li>Drama</li></a>
                        <a href="#"><li>Animacion</li></a>
                        <a href="#"><li>Misterio</li></a>
                    </ul>
                </div>
                <div>
                    <ul class="nav-menu">
                        <li class="menu_item">
                            <div class="perfil-user">
                                <!--Traemos la imagen desde el servlet Avatar -->
                                <a class="link_fotoP" href="Actualizar_Usuario?accion=ActuPerfil&user=${NUser}">
                                    <img class="fotoP" src="Avatar?Usuario=${NUser} "/> 
                                </a>
                            </div>
                        </li>
                        <li class="menu_item">
                            <form action="cerrandoSesion" method="post">
                                <input type="submit" value="Cerrar Sesión">
                            </form>
                        </li>
                        <button class="switch" id="switch" >
                            <span><i class="fas fa-sun"></i></span>
                            <span><i class="fas fa-moon"></i></span>
                        </button>
                    </ul>
                </div>
            </nav>

        </header>

        <section class="cont-principal">

            <div class="cont-peliculas">
                <%
                    ArrayList<Pelicula> lista = PeliculaDAO.ListarDesP();
                    for (int i = 0; i < lista.size(); i++) {
                        Pelicula peliD = lista.get(i);
                %>

                <div class="tarjetas ">
                    <img class="img" src="imgP?id=<%=peliD.getCodP() %>" />
                    <div class="aparecer">
                        <h4 style="margin-bottom: 5px;"><%=peliD.getNombreP()%></h4>
                        <p style="margin-bottom: 5px;font-size: 0.8em;"><%=peliD.getDescripcion()%></p>
                        <span><%=peliD.getGeneroP()%></span>
                    </div>
                </div>
                <%
                    }
                %>

            </div>

            <article class="cont-uploapPelis">

                <div class="uploadPelis">
                    <h3>Subir Pelicula</h3>
                    
                     <form class="form_uploadPelis" action="PeliculasAdmin" method="post" enctype="multipart/form-data">
                        <div class="uploadN">
                            <label for="nombreP">Nombre</label>
                            <input id="nombreP" type="text" name="nombreP">
                        </div>
                        <div class="uploadG">
                            <label for="generoP">Genero</label>
                            <input id="generoP" type="text" name="generoP">
                        </div>
                        <div class="uploadD">
                            <label for="text-desc">Descripcion</label>
                            <br>
                            <textarea class="text-desc" name="text-desc" id="text-comment"> </textarea>
                        </div>
                        <div class="uploadF">
                            <label for="id_foto">Foto</label>
                            <input type="file" name="FotoP" accept=".png, .jpg, .jpeg">
                        </div>
                        <button class="boton" type="submit" value="Guardar" name="accion">Insertar Pelicula</button>
                    </form>
                </div>

            </article>

        </section>

        <footer class="footer">

            <div class="redes-sociales">

            </div>
            <div class="cont-reservado">

            </div>
        </footer>

        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>

