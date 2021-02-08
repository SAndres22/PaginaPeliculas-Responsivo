<%-- 
    Document   : verPelicula
    Created on : 5/02/2021, 10:52:47 AM
    Author     : S_and
--%>

<%@page import="Modelo.PeliculaDAO"%>
<%@page import="Modelo.Pelicula"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver | ${pelicula.getNombreP()}</title>
        
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
        <link rel="stylesheet" href="css/stylesVerPelicula.css">

        <!--Linkeando cssBloqueador de Anuncios-->
        <link rel="stylesheet" href="css/stylesBloqueador.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body>
        <!--Desactivar el bloqueador de anuncios-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"/>
        <div id="WgD">
            <div class='WgD-position'>
                <div class='WgD-container'>
                    <img width="100" height="100" src="img/error.png">
                    <h3 class='WgD-title'>
                        Adblock Detectado</h3>
                    <p class='WgD-text'>
                        Nuestro sitio se mantiene gracias a la publicidad, por favor <strong>Desactiva Adblock</strong> para seguir navegando</p>
                    <a class='WgD-reload' href=".">He desactivado Adblock</a>
                </div>
            </div>
            <div class='WgD-particles'>
                <i class="wgd-usd"></i><i class="wgd-eur"></i>
                <i class="wgd-usd"></i><i class="wgd-eur"></i>
                <i class="wgd-btc"></i><i class="wgd-usd"></i>
                <i class="wgd-usd"></i><i class="wgd-eur"></i>
                <i class="wgd-btc"></i><i class="wgd-usd"></i>
                <i class="wgd-eur"></i>
            </div>
        </div>
        
        <!--Cabeza de la Pagina -->
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
        
        <section class="cont">
            <div class="tituloP">
                <h2>${pelicula.getNombreP()}</h2>        
            </div>
            <div class="flex">
                <div class="imgP">
                    <img class="img" src="imgP?id=${pelicula.getCodP()}&NombrePelicula${pelicula.getNombreP()}" />
                </div>
                <div class="descripcionP">
                    <p>${pelicula.getDescripcion()}</p>
                </div>
            </div>
        </section>
                
        <section class="cont2">
            <div class="cont-comentarios">
                <h3>Deja Tu Cometario</h3>
                <form name="form-comentarios" action="" method="post">
                    <label for="text-comment"></label>
                    <textarea class="text-comment" name="text-comment" id="text-comment"> </textarea>
                    <div class="botones-comment">
                        <input type="submit" value="Enviar Comentario" name="boton-comment" id="boton-comment">
                        <input type="reset" value="Cancelar">
                    </div>
                </form>
            </div>
        </section>

        <footer class="footer">

            <div class="redes-sociales">

            </div>
            <div class="cont-reservado">

            </div>
        </footer>


        <!--Script para que pedir desbloquear el bloqueador de anuncios-->
        <script>//<![CDATA[
            function adBlockDetected(){document.getElementById("WgD").classList.add("is-detected"), document.body.classList.add("ab-is-detected")}if ("undefined" != typeof fuckAdBlock || "undefined" != typeof FuckAdBlock)adBlockDetected(); else{var importFAB = document.createElement("script"); importFAB.onload = function(){fuckAdBlock.onDetected(adBlockDetected), fuckAdBlock.onNotDetected(adBlockNotDetected)}, importFAB.onerror = function(){adBlockDetected()}, importFAB.integrity = "sha384-CXnSItT4vv0CF9Lrll7Wu5SofkJWovtQcEuqpH2REEeQURSJapSzBwvm1QTDwgBK", importFAB.crossOrigin = "anonymous", importFAB.src = "https://cdn.jsdelivr.net/npm/fuckadblock@3.2.1/fuckadblock.min.js", document.head.appendChild(importFAB)}
            //]]></script>
        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>

