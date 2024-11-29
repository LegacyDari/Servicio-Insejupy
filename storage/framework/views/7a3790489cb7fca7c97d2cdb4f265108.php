<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tickets</title>
    <link rel="stylesheet" href="<?php echo e(asset('css/Style.css')); ?>">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="<?php echo e(route('tickets.create')); ?>">Crear Ticket</a></li>
                <li><a href="#">Cerrar sesión</a></li>
            </ul>
        </nav>
    </header>

    <section class="ticket-list">
        <h1>Lista de Tickets</h1>

        <!-- Mostrar mensajes de éxito o error -->
        <?php if(session('success')): ?>
            <div class="alert alert-success">
                <?php echo e(session('success')); ?>

            </div>
        <?php endif; ?>

        <?php if(session('error')): ?>
            <div class="alert alert-error">
                <?php echo e(session('error')); ?>

            </div>
        <?php endif; ?>

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
                <?php $__currentLoopData = $tickets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ticket): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($ticket->id); ?></td>
                        <td><?php echo e($ticket->solicitante); ?></td>
                        <td><?php echo e($ticket->area); ?></td>
                        <td><?php echo e($ticket->estatus); ?></td>
                        <td><a href="<?php echo e(route('tickets.show', $ticket->id)); ?>">Ver</a></td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2024 Ticketera. Todos los derechos reservados.</p>
    </footer>
</body>
</html>

<?php /**PATH C:\Users\Dariel\Desktop\Servicio-Social\resources\views/tickets/index.blade.php ENDPATH**/ ?>