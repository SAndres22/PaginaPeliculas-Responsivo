<%-- 
    Document   : login
    Created on : 27/01/2021, 05:09:39 PM
    Author     : S_and
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar sesion</title>
        
        
        <!--Linkeando Font-awesome-Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="img/icon-Pelis.png"/>

        <!--Linkeando CSS -->
        <link rel="stylesheet" href="css/stylesLogin.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">

    </head>
    <body id="blur">
        
        <header class="header">
            <img  class="img-logo" src="img/Logo-Pelis.png" >
        </header>

	<section class="contenedor">
            
            <form action="IniciarSesion" method="post" class="formulario">

                <h3>Inicia Sesión</h3>     
                <label for="nombre" class="izquierda"> Nombre de Usuario</label>
                <input type="text" name="nombreuserL" placeholder="Digite su nombre de usuario" required autocomplete="off" autofocus>

                <label for="contraseña" class="izquierda"> Contraseña</label>
                <input type="password" name="claveuserL" placeholder="Digite su contraseña" required autocomplete="off">


                <input type="submit" value="Ingresar">

                <a href="javascript:abrir()"> ¿Olvido su contraseña?</a>
                <p><span> Aun no te has registrado?</span>
                    <a style="padding-left: 10px;" href="index.jsp">Registrate aqui</a>
                </p>
            </form>
                         
	</section>
        
        <section >
            <!-- Ventana flotante de recuperar password-->

            <div class="ventanaR" id="ventana-Recuperar">

                <div id="cerrar" class="cerrar-icon"> 
                    <a href="javascript:cerrar()" >
                        <img src="img/cancelar.png">
                    </a>   
                </div>

                <h2> Recuperar Contraseña</h2>
                <p>Es rápido y fácil.</p>

                <hr class="hr-form">

                <form action="#" method="post" class="form-recuperarClave">

                    <input type="email" name="correor" id="correor" autocomplete="off" required placeholder="Email">

                    <input class="btn" type="submit"  value="Enviar">

                </form>

            </div>
            
        </section>
        
        
        <footer class="footer">
                <p>&copy; 2020 Ándres Morales - SamgPelis </p>
        </footer>
        
        <!--Linkeando Java Script -->
        <script src="js/scriptRecuperarClave.js"></script>
    </body>
</html>