//busqueda rapida de index que redirige a buscar.html y muestra resultados
function buscar(){
    var t = getParameterByName("buscar",false);
    // Definimos la URL que vamos a solicitar via Ajax con sus parametros
    //let ajax_url = "./rest/receta/?t="+texto1+","+texto2;
    let ajax_url = "./rest/receta/?t="+t;

    // Creamos un nuevo objeto encargado de la comunicación
    var ajax_request = new XMLHttpRequest();

    // Definimos como queremos realizar la comunicación
    ajax_request.open( "GET", ajax_url, true );

    //Enviamos la solicitud
    ajax_request.send();

    ajax_request.onreadystatechange = function(){
        if(ajax_request.readyState == 4 && ajax_request.status == 200){
            let datosJSON = JSON.parse(ajax_request.responseText);
            let i = 0;

            //Vaciar el texto que irá en la sección
            finalText = "";

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
            document.getElementById("resulbusqueda").innerHTML = finalText;
        }else{
            document.getElementById("resulbusqueda").innerHTML ="<h3>Busqueda sin resultados</h3>";
        }
    }
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

var busquedaActual = "";

//Mandar la petición de búsqueda y mostrar los resultados
function loadPagBusqueda(frm){
    //Coger informacion del form
    let pag = 0;
    let num = 6;

    let puesto = false;
    let nombre = document.getElementById("nombre-buscar").value;
    let ingredientes = document.getElementById("ingredientes-buscar").value;
    let tiempo = document.getElementById("ingredientes-buscar2").value;
    let dificultad = document.getElementById("dificultad").value;
    let comensales = document.getElementById("comensales-buscar").value;
    let autor = document.getElementById("autor-buscar").value;

    let xhr = new XMLHttpRequest(),
        url = "./rest/receta/",
        finalText = "<h2>Lo sentimos, no se ha podido atender la petici&oacute;n en este momento.</h2>";

    //adaptar link
    url+="?"
    if(nombre!=""){
        url+="n="+nombre;
        puesto=true;
    }

    if(ingredientes!=""){
        if(puesto){
            url+="&";
        }
        url+="i="+ingredientes;
        puesto = true;
    }

    if(tiempo!=""){
        if(puesto){
            url+="&";
        }
        url+="df="+tiempo;
        puesto = true;
    }

    if(dificultad!=""){
        if(puesto){
            url+="&";
        }
        url+="d="+dificultad;
        puesto=true;
    }

    if(comensales!=""){
        if(puesto){
            url+="&";
        }
        url+="c="+comensales;
        puesto = true;
    }

    /*if(autor!=""){
        if(puesto){
            url+="&";
        }
        url+="a="+autor;
        puesto = true;
    }*/

    //Para posteriores busquedas con paginacion
    busquedaActual = url;


    if(puesto){
        url+="&";
    }

    url += "pag="+pag+"&lpag="+num;

    console.log(url);

    xhr.open('GET',url,true);
    xhr.send();
    xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    let datosJSON = JSON.parse(xhr.responseText);
                    let i = 0;
                    console.log(xhr.responseText);
                    finalText = "";

                    for( i = 0; i<datosJSON["FILAS"].length; i++){
                        finalText +=
                        "<article>"+
                            "<img src=fotos/"+datosJSON["FILAS"][i]["fichero"]+" alt="+datosJSON["FILAS"][i]["nombre"]+" >"+
                            "<p>"+datosJSON["FILAS"][i]["descripcion_foto"]+
                                "<a href='receta.html"+datosJSON["FILAS"][i]["id"]+"'>Ver m&aacute;s </a>"+
                            "</p>"+

                            "<a href='receta.html"+datosJSON["FILAS"][i]["id"]+"'>"+datosJSON["FILAS"][i]["nombre"]+"</a>"+
                            "<address>"+datosJSON["FILAS"][i]["login"]+"</address>"+
                            "<footer>"+
                                "<time datetime='"+datosJSON["FILAS"][i]["fecha"]+"'>Fecha <br> "+datosJSON["FILAS"][i]["fecha"]+"</time>"+
                                "<p>Fotos<br>"+datosJSON["FILAS"][i]["nfotos"]+"</p>"+
                                "<p>Comentarios <br> "+datosJSON["FILAS"][i]["comentarios"]+"</p>"+
                            "</footer>"+
                        "</article>";
                    }

                    document.getElementById("resulbusqueda").innerHTML = finalText;
                }else{
                    document.getElementById("resulbusqueda").innerHTML = finalText;
                    console.log("ERROR: "+xhr.responseText);
                }
            }
    }


    return false;
};