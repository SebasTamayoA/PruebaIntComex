<?php

$server = "localhost";
$usuario = "root";
$pass = "";
$db = "company";
$link = mysqli_connect($server, $usuario, $pass, $db);

if (!$link) {
    echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
} else {
    // echo "<h3>Conexion Exitosa PHP - MySQL</h3><hr><br>";
}
