//Modo Oscuro

const btnSwitch = document.querySelector('#switch');

//Forma actual de hacerlo
btnSwitch.addEventListener('click', () => {
    document.body.classList.toggle('dark');
    btnSwitch.classList.toggle('active');
    
    //guardamos el modo en Localatorage
    if(document.body.classList.contains('dark'))  {
        localStorage.setItem('dark-mode', 'true');   
    }else{
        localStorage.setItem('dark-mode', 'false');
    }
});

//Obtenemos el modo actual.

if(localStorage.getItem('dark-mode') === 'true'){
    document.body.classList.add('dark');
    btnSwitch.classList.add('active');
}else{
    document.body.classList.remove('dark');
    btnSwitch.classList.remove('active');
}


//funciones para abrir y cerrar la ventana de registro

const abrir = () =>{
    document.getElementById("ventana-registro").style.display="block";
    
};

const cerrar = () =>{
    document.getElementById("ventana-registro").style.display="none";
};

//Funcion para validar que ambas contraseñas sean iguales Cliente

const coincidirClave = () =>{
    let claveN1 = document.getElementById("claveN1");
    let claveN2 = document.getElementById("claveN2");
    
    let msg = document.getElementById("msg");
    
    if(claveN1.value.length === 0 || claveN2.value.length === 0){
        msg.innerHTML = "Ninguna contraseña puede quedar vacia";
        msg.style.background ="rgba(255, 193, 7, 0.6)";
    }else if(claveN1.value !== claveN2.value){
        msg.innerHTML = "Las contraseñas no coinciden";
        msg.style.background ="rgba(220, 53, 69, 0.6)";
    }
    else{
        msg.innerHTML = "Contraseñas correctas,si actualiza debe iniciar sesión";
        msg.style.background ="rgba(40, 167, 69, 0.6)";
    }
};



