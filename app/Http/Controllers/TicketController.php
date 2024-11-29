<?php
namespace App\Http\Controllers;

use App\Models\Ticket;
use App\Models\Seguimiento;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Database\QueryException;

class TicketController extends Controller
{
    // Mostrar todos los tickets
    public function index()
    {
        $tickets = Ticket::all();  // Obtener todos los tickets
        return view('tickets.index', compact('tickets'));
    }

    // Ver un ticket específico y sus seguimientos
    public function show($id)
    {
        $ticket = Ticket::find($id);
        $seguimientos = Seguimiento::where('ticket_id', $id)->get();
        return view('tickets.show', compact('ticket', 'seguimientos'));
    }

    // Crear un nuevo ticket
    public function create()
    {
        return view('tickets.create');
    }

    // Guardar el ticket
    public function store(Request $request)
    {
        // Validar los datos del formulario
        $validatedData = $request->validate([
            'solicitante' => 'required|string|max:255',
            'area' => 'required|string|max:255',
            'descripcion' => 'required|string',
            'prioridad' => 'required|string|max:20',
            'estatus' => 'required|string|max:20',
        ]);

        try {
            // Crear el ticket
            $ticket = Ticket::create([
                'solicitante' => $validatedData['solicitante'],
                'area' => $validatedData['area'],
                'descripcion' => $validatedData['descripcion'],
                'prioridad' => $validatedData['prioridad'],
                'estatus' => $validatedData['estatus'],
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
    
            // Redirigir a la vista de tickets con éxito
            return redirect()->route('tickets.index')->with('success', 'Ticket creado correctamente.');
        } catch (QueryException $e) {
            // Capturar y mostrar errores si existen problemas en la base de datos
            return back()->withErrors(['error' => 'Error al crear el ticket: ' . $e->getMessage()]);
        }
    }

    // Crear un seguimiento para un ticket
    public function storeSeguimiento(Request $request, $ticketId)
    {
        // Validar el comentario
        $validatedData = $request->validate([
            'comentario' => 'required|string',
        ]);

        // Crear el seguimiento
        Seguimiento::create([
            'ticket_id' => $ticketId,
            'comentario' => $validatedData['comentario'],
        ]);

        return redirect()->route('tickets.show', $ticketId)->with('success', 'Seguimiento agregado correctamente.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Ticket $ticket)
    {
        // Aquí puedes agregar la lógica para editar tickets si es necesario
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Ticket $ticket)
    {
        // Lógica para actualizar el ticket si es necesario
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Ticket $ticket)
    {
        // Lógica para eliminar el ticket si es necesario
    }
}
