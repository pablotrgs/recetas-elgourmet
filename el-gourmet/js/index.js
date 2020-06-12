var paginaindex=0;
var totalpaginas=0;
//Variable que muestra la pagina actual
var actualPage = 0;

//Funciones generales de apoyo, como cargar página
function loadPag(pag,num,obj){
    //La pagina actual pasa a ser la solicitada
    actualPage=pag;

    //inicializando texto base, url de la petición y la petición XML
    let xhr = new XMLHttpRequest(),
        url = "./rest/receta/?u=6&pag="+pag+"&lpag="+num,
        finalText = "<h2>Lo sentimos, no se ha podido atender la petici&oacute;n en este momento.</h2>";

    //Enviar petición GET
    xhr.open('GET',url,true);
    xhr.send();
    xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    //console.log(xhr.responseText);
                    //Parsear los datos JSON recibidos
                    let datosJSON = JSON.parse(xhr.responseText);
                    let i = 0;

                    //Vaciar el texto que irá en la sección
                    finalText = "";

                    //guardar el mensaje formateado
                    for( i = 0; i<datosJSON["FILAS"].length; i++){
                        finalText +=
                        "<article>"+
                            "<img src=fotos/"+datosJSON["FILAS"][i]["fichero"]+" alt="+datosJSON["FILAS"][i]["nombre"]+" >"+
                            "<p>"+datosJSON["FILAS"][i]["descripcion_foto"]+
                                "<a href='receta.html?id="+datosJSON["FILAS"][i]["id"]+"'>Ver m&aacute;s </a>"+
                            "</p>"+

                            "<a href='receta.html?id="+datosJSON["FILAS"][i]["id"]+"'>"+datosJSON["FILAS"][i]["nombre"]+"</a>"+
                            "<address>"+datosJSON["FILAS"][i]["login"]+"</address>"+
                            "<footer>"+
                                "<time datetime='"+datosJSON["FILAS"][i]["fecha"]+"'>Fecha <br> "+datosJSON["FILAS"][i]["fecha"]+"</time>"+
                                "<p>Fotos<br>"+datosJSON["FILAS"][i]["nfotos"]+"</p>"+
                                "<p>Comentarios <br> "+datosJSON["FILAS"][i]["comentarios"]+"</p>"+
                            "</footer>"+
                        "</article>";
                    }

                    document.getElementById(obj).innerHTML = finalText;
                }else{
                    //Mostrar el mensaje de error y por consola lo sucedido en caso de no realizarse la petición
                    document.getElementById(obj).innerHTML = finalText;
                    console.log("ERROR: "+xhr.responseText);
                }
            }
    }
    return false;

};

//Funciones onload de la página
function loadGallery(){
    loadPag(actualPage,6,"ultimasEntradas");
    return false;
};

//Carga del menú en función del logueo
function cargarMenu(){
    let header = document.querySelector("header");
    if(comprobarLogin()){
        let html =
        "<input type='checkbox' id='ckb-menu'>"+
        "<nav class='menu'>"+
            "<ul id='menuPrincipal'>"+
                "<li><label for='ckb-menu'>&equiv;</label></li>"+
                "<li><a class='icon-home' href='index.html'>Inicio</a></li>"+
                "<li><a class='icon-search' href='buscar.html'>Buscar</a></li>"+
                "<li id='signout'><a onclick='cerrarSesion();' class='icon-logout' href=''>Cerrar sesi&oacute;n</a></li>"+
                "<li><a class='icon-book-open' href='nueva-receta.html'>Nueva receta</a></li>"+
            "</ul>"+
        "</nav>";

        header.innerHTML = header.innerHTML + html;

    }else{
        let html =
        "<input type='checkbox' id='ckb-menu'>"+
        "<nav class='menu'>"+
            "<ul  id='menuPrincipal'>"+
                "<li><label for='ckb-menu'>&equiv;</label></li>"+
                "<li><a class='icon-home' href='index.html'>Inicio</a></li>"+
                "<li><a class='icon-search' href='buscar.html'>Buscar</a></li>"+
                "<li><a class='icon-user' href='registro.html'>Registro</a></li>"+
                "<li id='signin'><a class='icon-login-1' href='login.html'>Iniciar sesi&oacute;n</a></li>"+
            "</ul>"+
        "</nav>";

        header.innerHTML = header.innerHTML + html;
    }
}

//Comprobación del login
function comprobarLogin(){
    if(sessionStorage.getItem('status')){
        return true;
    }
    else{
        return false;
    }
}

//Función de cerrar sesión
function cerrarSesion(){
    sessionStorage.clear();
    volverIndex();
    return false;
}

function cargarIndex(){
    cargarMenu();
    loadGallery();
    comprobarLogin();
}

/*<script>
    document.getElementById("menu").onload = function() {logueado()};

    function logueado() {
        if(typeof(Storage) !== "undefined") {
            if(sessionStorage.getItem("usuario")!=null){    //si existe usuario
                document.getElementById("iniciarsesion").style.display = "none";
                document.getElementById("registro").style.display = "none";
            }else{  //si no existe usuario
                //sessionStorage.setItem
                var x = document.getElementById("cerrarsesion").style.display = "none";
                x.style.display = "none";
                document.getElementById("nuevareceta").style.display = "none";
            }
        } else {
            alert("Lo siento, tu navegador no soporta web storage");
        }
    }
</script>*/