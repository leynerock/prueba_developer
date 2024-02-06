<!DOCTYPE html>
<html>
<head>
    <title>Encuestas</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        // Realizar la solicitud AJAX al cargar la página
        $.ajax({
            url: 'obtener_encuestas.php',
            method: 'GET',
            dataType: 'json',
            success: function(response){
                // Iterar sobre las encuestas y agregarlas al combo
                $.each(response, function(index, encuesta){
                    $('#encuesta').append($('<option>', {
                        value: encuesta.codigo_encuesta,
                        text: encuesta.nombre_encuesta
                    }));
                });
            }
        });

        // Cuando se cambie la selección del combo de encuestas
        $('#encuesta').change(function(){
            var encuesta_id = $(this).val();
            // Realizar una solicitud AJAX para cargar las preguntas asociadas a la encuesta seleccionada
            $.ajax({
                url: 'cargar_preguntas.php',
                type: 'post',
                data: {encuesta_id: encuesta_id},
                success: function(response){
                    // Colocar las preguntas recibidas en el contenedor de preguntas
                    $('#preguntas').html(response);
                    // Agregar opciones de respuesta a las preguntas
                    $('.preguntas').each(function(){
                        var pregunta_id = $(this).data('pregunta-id');
                        var opcionesRespuesta = '';
                        for (var i = 1; i <= 5; i++) {
                            opcionesRespuesta += '<label><input type="radio" name="respuesta_' + pregunta_id + '" value="' + (i * 4) + '"> ' + i + '</label>&nbsp;&nbsp;';
                        }
                        $(this).append('<div class="opciones">' + opcionesRespuesta + '</div>');
                    });
                }
            });
        });

        // Cuando se haga clic en el botón de guardar encuesta
        $('#guardar_encuesta').click(function(){
            // Aquí se implementará la lógica para guardar la encuesta
        });
    });
    </script>
</head>
<body>
<h1>Encuestas</h1>
    <label for="encuesta">Seleccione una encuesta:</label>
    <select id="encuesta">
        <option value="">-- Seleccione --</option>
        <!-- Aquí se cargarán dinámicamente las opciones de encuestas mediante AJAX -->
    </select>
    <div id="preguntas">
        <!-- Aquí se cargarán dinámicamente las preguntas mediante AJAX -->
    </div>
    <button id="guardar_encuesta">Guardar Encuesta</button>
</body>
</html>





