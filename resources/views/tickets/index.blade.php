<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tickets</title>
    <link rel="stylesheet" href="{{ asset('css/Style.css') }}">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="{{ route('tickets.create') }}">Crear Ticket</a></li>
                <li><a href="#">Cerrar sesión</a></li>
            </ul>
        </nav>
    </header>

    <section class="ticket-list">
        <h1>Lista de Tickets</h1>

        <!-- Mostrar mensajes de éxito o error -->
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-error">
                {{ session('error') }}
            </div>
        @endif

        <table>
            <thead>
                <tr>
                    <th># de Ticket</th>
                    <th>Solicitante</th>
                    <th>Área</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach($tickets as $ticket)
                    <tr>
                        <td>{{ $ticket->id }}</td>
                        <td>{{ $ticket->solicitante }}</td>
                        <td>{{ $ticket->area }}</td>
                        <td>{{ $ticket->estatus }}</td>
                        <td><a href="{{ route('tickets.show', $ticket->id) }}">Ver</a></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2024 Ticketera. Todos los derechos reservados.</p>
    </footer>
</body>
</html>

