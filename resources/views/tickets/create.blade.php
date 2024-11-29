<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Ticket</title>
    <link rel="stylesheet" href="{{ asset('css/Style.css') }}">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="{{ route('tickets.index') }}">Volver a la lista</a></li>
            </ul>
        </nav>
    </header>

    <section class="ticket-form">
        <h1>Crear un nuevo Ticket</h1>
        <form action="{{ route('tickets.store') }}" method="POST">
            @csrf
            <label for="solicitante">Solicitante:</label>
            <input type="text" name="solicitante" id="solicitante" required>
            
            <label for="area">Área:</label>
            <input type="text" name="area" id="area" required>

            <label for="descripcion">Descripción:</label>
            <textarea name="descripcion" id="descripcion" required></textarea>

            <label for="prioridad">Prioridad:</label>
            <select name="prioridad" id="prioridad">
                <option value="normal">Normal</option>
                <option value="alta">Alta</option>
                <option value="baja">Baja</option>
            </select>

            <label for="estatus">Estatus:</label>
            <select name="estatus" id="estatus">
                <option value="pendiente">Pendiente</option>
                <option value="en_proceso">En Proceso</option>
                <option value="resuelto">Resuelto</option>
            </select>

            <button type="submit">Crear Ticket</button>
        </form>
    </section>
    
    <footer>
        <p>&copy; 2024 Ticketera. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
