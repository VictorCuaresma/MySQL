/*importar las librerias*/
var express = require("express");
var mysql = require("mysql");
var app = express();
var cors = require("cors");


/*configuraciones*/
app.use(express.json());
app.use(cors());

var conexion = mysql.createConnection(
{
    host: "localhost",
    user: "root",
    password: "admin",
    database:"dbRestaurante"
}
);
conexion.connect(
    function(error){
        if(error){
            throw error;
        }
        else{
            console.log("Conexion exitosa");

        }
    }
);

const port = process.env.PUERTO || 3001;

app.listen(
    port, function() {
    console.log("Servidor funcionando en puerto: "+ port)
    }
);
app.post(
    "/api/pedido", (req, res) =>{
        let data ={
            userped: req.body.USERPED,
            emausped: req.body.EMAUSPED,
            celusped: req.body.CELUSPED,
            foodped: req.body.FOODPED,
            msgped: req.body.MSGPED,
        }
        let sql = "INSERT INTO pedido SET ?";
        conexion.query(
            sql, data, function (error, resultados){
                if (error){
                    throw error;
                } else {
                    console.log(data);
                    res.send(data)

                }
            }
        );
    }
);
//localhost:3000/api/pedido