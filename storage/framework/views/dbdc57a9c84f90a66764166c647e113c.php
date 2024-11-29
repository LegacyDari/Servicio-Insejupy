<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Ticket</title>
    <link rel="stylesheet" href="<?php echo e(asset('css/Style.css')); ?>">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="<?php echo e(route('tickets.index')); ?>">Volver a la lista</a></li>
            </ul>
        </nav>
    </header>

    <section class="ticket-detail">
        <h1>Detalles del Ticket #<?php echo e($ticket->id); ?></h1>
        <p><strong>Solicitante:</strong> <?php echo e($ticket->solicitante); ?></p>
        <p><strong>Área:</strong> <?php echo e($ticket->area); ?></p>
        <p><strong>Descripción:</strong> <?php echo e($ticket->descripcion); ?></p>
        <p><strong>Prioridad:</strong> <?php echo e($ticket->prioridad); ?></p>
        <p><strong>Estatus:</strong> <?php echo e($ticket->estatus); ?></p>
        
        <h2>Seguimientos</h2>
        <?php $__currentLoopData = $seguimientos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $seguimiento): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <p><strong>Comentario:</strong> <?php echo e($seguimiento->comentario); ?> <em>(<?php echo e($seguimiento->fecha); ?>)</em></p>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        <h3>Agregar Seguimiento</h3>
        <form action="<?php echo e(route('seguimiento.store', $ticket->id)); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <textarea name="comentario" required></textarea>
            <button type="submit">Agregar Seguimiento</button>
        </form>
    </section>
    
    <footer>
        <p>&copy; 2024 Ticketera. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
<?php /**PATH C:\Users\Dariel\Desktop\Servicio-Social\resources\views/tickets/show.blade.php ENDPATH**/ ?>