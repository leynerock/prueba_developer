<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "123456Qbit";
$dbname = "prueba_developer";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener el ID de la encuesta seleccionada
$encuesta_id = $_POST['encuesta_id'];

// Consulta SQL para obtener las preguntas asociadas a la encuesta seleccionada
$sql = "SELECT descripcion FROM preguntas_encuesta WHERE codigo_encuesta = $encuesta_id";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Mostrar las preguntas
    while($row = $result->fetch_assoc()) {
        echo "<p>" . $row["descripcion"] . "</p>";
    }
} else {
    echo "No se encontraron preguntas para esta encuesta";
}
$conn->close();
?>
