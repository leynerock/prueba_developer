<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Estadísticas de Encuestas</h1>

    <?php
    // Realizar la conexión a la base de datos
    $servername = "localhost";
    $username = "root";
    $password = "123456Qbit";
    $dbname = "prueba_developer";

    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar conexión
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Consulta SQL para obtener los datos de la tabla de estadísticas uniendo con la tabla de encuestas
    $sql_estadisticas = "SELECT e.nombre_encuesta AS Descripcion, s.Numero_Encuestados, s.Promedio
                        FROM encuestas e
                        INNER JOIN estadisticas s ON e.Id = s.Id";
    $result_estadisticas = $conn->query($sql_estadisticas);
    ?>

    <table>
        <tr>
            <th>Descripción</th>
            <th>Número de Encuestados</th>
            <th>Promedio</th>
        </tr>
        <?php
        // Mostrar los datos en la tabla
        if ($result_estadisticas->num_rows > 0) {
            while($row = $result_estadisticas->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Descripcion"] . "</td>";
                echo "<td>" . $row["Numero_Encuestados"] . "</td>";
                echo "<td>" . $row["Promedio"] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='3'>0 resultados</td></tr>";
        }

        // Cerrar conexión
        $conn->close();
        ?>
    </table>
</body>
</html>


