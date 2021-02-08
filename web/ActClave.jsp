<%-- 
    Document   : ActClave
    Created on : 2/02/2021, 06:13:04 PM
    Author     : S_and
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Actualizar Clave</title>
        
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
        <link rel="stylesheet" href="css/stylesClave.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body>

        <section class="cont-form">
            <div>
                <ul class="nav-menu">
                    <button class="switch" id="switch" >
                        <span><i class="fas fa-sun"></i></span>
                        <span><i class="fas fa-moon"></i></span>
                    </button>
                </ul>
            </div>

            <div class="cont-form">
                <form method="post" class="form" action="Actualizar_Usuario">
                    <div>
                        <input type="hidden" value="<%= request.getParameter("user")%>" name="user"> 
                    </div>
                    <div>
                        <label>Ingrese la clave Anterior</label>
                        <div>
                            <input type="password" name="claveA" placeholder="Contraseña" required>
                        </div>
                    </div>

                    <div>
                        <label for="claveN1">Ingrese la Nueva clave</label>
                        <div>
                            <input type="password" id="claveN1" name="claveN1" placeholder="Nueva Contraseña" onkeyup="coincidirClave()">
                        </div>
                    </div>

                    <div>
                        <label for="claveN2">Confirmacion</label>
                        <div>
                            <input type="password" id="claveN2" name="claveN2" placeholder="Confirmacion" onkeyup="coincidirClave()">
                        </div>
                    </div>
                    <div>
                        <label class="msg" id="msg">*_*</label>
                    </div>
                    <br>
                    <button class="boton" type="submit" name="accion" value="ActClave" >Actualizar</button>

                </form>
            </div>
        </section>
        <div style="margin-top: 20px;">
            <form method="post" action="Actualizar_Usuario">
                <button name="accion" type="submit" value="atras" class="botonC">Cancelar</button>
            </form>
        </div>

        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>