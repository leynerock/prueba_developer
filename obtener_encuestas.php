<?php
// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "123456Qbit", "prueba_developer");

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Consulta para obtener las encuestas
$sql = "SELECT codigo_encuesta, nombre_encuesta FROM encuestas";
$resultado = $conexion->query($sql);

// Crear un array para almacenar los datos de las encuestas
$encuestas = array();

// Obtener los datos de las encuestas y almacenarlos en el array
if ($resultado->num_rows > 0) {
    while($fila = $resultado->fetch_assoc()) {
        $encuestas[] = $fila;
    }
}

// Convertir el array a formato JSON y devolverlo
echo json_encode($encuestas);

// Cerrar la conexión
$conexion->close();
?>
<?php
