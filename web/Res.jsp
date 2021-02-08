<%-- 
    Document   : Respuesta
    Created on : 29/01/2021, 09:06:25 AM
    Author     : S_and
--%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Respuesta</title>

        <!--Linkeando Font-awesome-Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="img/icon-Pelis.png"/>

        <!--Linkeando CSS -->
        <link rel="stylesheet" href="css/styleRespuesta.css">

        <!--Linkenado Fuentes de Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">
    </head>
    <body>
        <div>
            <ul class="nav-menu">
                <button class="switch" id="switch" >
                    <span><i class="fas fa-sun"></i></span>
                    <span><i class="fas fa-moon"></i></span>
                </button>
            </ul>
        </div>

        <div class="cont">
            <div class="cont-msg">
                <span class="error">Error!</span>
                <img class="img-error" width="100" height="100" src="img/error.png">   
                <p class="msg">
                    <%
                        if(request.getParameter("mens") != null){
                            out.println(request.getParameter("mens"));
                        }
                        
                    %>
                    <br>
                    Intentalo de nuevo
                </p>
            </div>
        </div>
        <!--Linkeando Java Script -->
        <script src="js/script.js"></script>
    </body>
</html>