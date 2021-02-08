swal.fire({
    icon: 'warning',
    type: 'Error',
    title: 'Error de Login',
    html: 'La clave ingresada es incorrecta\n\
    <a \n\
    style=" display: block; background: #4FC65C;margin-top:2%; padding: 10px; cursor:pointer; border-radius:10px;\n\
    color: white; text-decoration: none; font-size: 1.2em\n\
    " href="login.jsp">Intentarlo de Nuevo</a>',
    width: '30%',
    showConfirmButton: false,
    position: 'center',
    allowOutsideClick: false,
    allowEnterKey: false,
    stopKeydownPropagation: false,
});



