<%-- 
    Document   : index
    Created on : 27/01/2021, 02:13:22 PM
    Author     : S_and
--%>
<%@page import="Modelo.PeliculaDAO"%>
<%@page import="Modelo.Pelicula"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SamgPelis | Bienvenido</title>

        <!--Linkeando Font-awesome-Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="img/icon-Pelis.png"/>

        <!--Linkeando CSS -->
        <link rel="stylesheet" href="css/styles.css">
        
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
        <!--Inicio de la Pagina -->
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
                        <li class="menu_item"><a class="activo" href="javaScript:abrir()">Registrarse</a></li>
                        <li class="menu_item"><a class="red"href="login.jsp">Iniciar sesión</a></li>
                        <button class="switch" id="switch" >
                            <span><i class="fas fa-sun"></i></span>
                            <span><i class="fas fa-moon"></i></span>
                        </button>
                    </ul>
                </div>
                <div class="buscador">       
                    <input type="text" placeholder="Buscar Pelicula">
                </div>
            </nav>

            <!-- Ventana flotante de registro-->

            <div class="ventanaR" id="ventana-registro">

                <div id="cerrar" class="cerrar-icon"> 
                    <a href="javascript:cerrar()">
                        <img src="img/cancelar.png">
                    </a>   
                </div>

                <h2> Registrarte</h2>
                <p>Es rápido y fácil.</p>

                <hr class="hr-form">

                <form action="registrarse"  method="post" class="form-registro">
                    <input type="hidden" name="idr" autocomplete="off" class="name">
                    <input type="text" name="nombrer" autocomplete="off" required autofocus placeholder="Nombre" class="name">
                    <input type="text" name="apellidor" autocomplete="off" required placeholder="Apellidos">
                    <input type="text" name="nombreuser" autocomplete="off" required placeholder="Nombre de usuario">
                    <input type="email" name="correor" id="correor" autocomplete="off" required placeholder="Email">
                    <input type="password" name="claver" autocomplete="off" required placeholder="Contraseña nueva">

                    <p class="parraf-condiciones">Al hacer clic en "Registrarte", aceptas nuestras Condiciones, 
                        la Política de datos y la Política de cookies. 
                    </p>

                    <br>
                    <input class="btn" type="submit"  value="Registrarse">

                    <p>Tambien puedes registrarte con algunas de las siguientes cuentas</p>

                </form>


                <div class="form-registro_redes">
                    <a href="#">
                        <img src="img/icono-facebook.png">
                    </a>
                    <a href="#">
                        <img src="img/icono-google.png"> 
                    </a>
                </div>
            </div>
        </header>

        <section class="cont-principal">
            <div class="cont-peliculas">

                <%
                    ArrayList<Pelicula> lista = PeliculaDAO.ListarDesP();
                    for (int i = 0; i < lista.size(); i++) {
                        Pelicula peliD = lista.get(i);
                %>

                <div class="tarjetas ">
                    <img class="img" src="imgP?id=<%=peliD.getCodP()%>" />
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

            <article class="cont-publicidad">
                <div class="publicidad publicidadT publicidad1">   
                </div>

                <div class="publicidad publicidadT publicidad2">
                </div>

                <div class="publicidad publicidadT publicidad3">
                </div>

            </article>

        </section>

        <footer class="footer">

            <div class="redes-sociales">

            </div>
            <div class="cont-reservado">

            </div>
        </footer>
            
            
        <!--Script para que pedir desbloquear el bloqueador de anuncios-->
        <script>//<![CDATA[
            function adBlockDetected(){document.getElementById("WgD").classList.add("is-detected"), document.body.classList.add("ab-is-detected")}if ("undefined" != typeof fuckAdBlock || "undefined" != typeof FuckAdBlock)adBlockDetected();  else{var importFAB = document.createElement("script"); importFAB.onload = function(){fuckAdBlock.onDetected(adBlockDetected), fuckAdBlock.onNotDetected(adBlockNotDetected)}, importFAB.onerror = function(){adBlockDetected()}, importFAB.integrity = "sha384-CXnSItT4vv0CF9Lrll7Wu5SofkJWovtQcEuqpH2REEeQURSJapSzBwvm1QTDwgBK", importFAB.crossOrigin = "anonymous", importFAB.src = "https://cdn.jsdelivr.net/npm/fuckadblock@3.2.1/fuckadblock.min.js", document.head.appendChild(importFAB)}
    //]]></script>
        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>
