<%-- 
    Document   : ActualizarFoto
    Created on : 28/01/2021, 07:39:16 PM
    Author     : S_and
--%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Actualizar Foto</title>
        
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
        <link rel="stylesheet" href="css/StylesFoto.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body>
        <!--Modo oscuro esta vez estara no visible -->
                <div>
                    <ul class="nav-menu">
                        <button class="switch" id="switch" >
                            <span><i class="fas fa-sun"></i></span>
                            <span><i class="fas fa-moon"></i></span>
                        </button>
                    </ul>
                </div>
        <section class="gran-cont">
            <section class="cont">
                <form class="form_foto" action="Actualizar_Usuario" method="post" enctype="multipart/form-data">
                    <div>
                        <input value="${u.getId()}" type="hidden" name="Codigo">
                    </div>
                    <div class="uploadF">
                        <label for="id_foto">Foto</label>
                        <input type="file" name="Foto" accept=".png, .jpg, .jpeg">
                    </div>
                    <button class="boton" type="submit" value="Actualizar" name="accion">Actualizar</button>
                </form>
            </section>

            <section class="cont2">
                <div class="cont-form">
                    <form class="form" method="post" action="">
                        <div class="form-cont">
                            <div>
                                <label>Ingrese su nuevo Nombre de Usuario</label>
                                <div>
                                    <input type="text" name="nombreN" placeholder="Nombre de Usuario" required>
                                </div>
                            </div>

                            <div>
                                <label>Seleccione su Genero</label>
                                <div>
                                    Hombre<input type="radio" name="genero"  value="Masculino" autofocus>
                                    <br>
                                    Mujer<input type="radio" name="genero"  value="Femenino" >
                                    <br>
                                    Personalizado<input type="radio" name="genero"  value="Otro" >
                                </div>
                            </div>

                            <div>
                                <label>Ingrese el numero de telefono</label>
                                <div>
                                    <input type="text" name="telefono" placeholder="Telefono">
                                </div>
                            </div>

                            <div>
                                <button class="boton" style="margin-top: 45px;" type="submit" value="" >Actualizar</button>
                            </div>
                        </div>
                    </form>      
                </div>
            </section>
        </section>
        <div>
            <form method="post" action="Actualizar_Usuario">
                <button name="accion" type="submit" value="atras" class="botonC">Cancelar</button>
            </form>
        </div>
        
        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>

