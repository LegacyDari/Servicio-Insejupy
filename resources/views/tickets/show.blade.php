<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Ticket</title>
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

    <section class="ticket-detail">
        <h1>Detalles del Ticket #{{ $ticket->id }}</h1>
        <p><strong>Solicitante:</strong> {{ $ticket->solicitante }}</p>
        <p><strong>Área:</strong> {{ $ticket->area }}</p>
        <p><strong>Descripción:</strong> {{ $ticket->descripcion }}</p>
        <p><strong>Prioridad:</strong> {{ $ticket->prioridad }}</p>
        <p><strong>Estatus:</strong> {{ $ticket->estatus }}</p>
        
        <h2>Seguimientos</h2>
        @foreach($seguimientos as $seguimiento)
            <p><strong>Comentario:</strong> {{ $seguimiento->comentario }} <em>({{ $seguimiento->fecha }})</em></p>
        @endforeach

        <h3>Agregar Seguimiento</h3>
        <form action="{{ route('seguimiento.store', $ticket->id) }}" method="POST">
            @csrf
            <textarea name="comentario" required></textarea>
            <button type="submit">Agregar Seguimiento</button>
        </form>
    </section>
    
    <footer>
        <p>&copy; 2024 Ticketera. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
