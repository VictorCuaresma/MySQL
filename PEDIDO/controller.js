//todo:Llamar la URL
const url ="http://localhost:3001/api/pedido";

let result ='';

const formArticulo = document.querySelector("form");

const userped = document.getElementById("USERPED");
const emausped = document.getElementById("EMAUSPED");
const celusped = document.getElementById("CELUSPED");
const foodped = document.getElementById("FOODPED");
const  msgped = document.getElementById("MSGPED");

let option ='';
//bOTON CREAR 

btnCrear.addEventListener(
    "click",()=>{
        console.log("Boton activado");
        option ='crear';
    }
);

//formulario

formArticulo.addEventListener(
    'submit', (e) =>{
        e.preventDefault();
        if(option == 'crear'){
            if(userped.value ==""|| emausped.value == ""|| celusped.value ==""||foodped.value ==""|| msgped.value ==""){
            alert("Asegurese de que todos los campos esten completos");
            return false;
        } else{
            console.log("Todos los campos estan completos");
            fetch(
                url, {
                    method: 'POST',
                    headers:{
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(
                        {
                            USERPED: USERPED.value,
                            EMAUSPED: EMAUSPED.value,
                            CELUSPED: CELUSPED.value,
                            FOODPED: FOODPED.value,
                            MSGPED: MSGPED.value,
                        }
                    )
                }
            )
            .then(
                response => response.json()
            )
            .then(
                response => location .reload()
            );
        }
        }

    }
);