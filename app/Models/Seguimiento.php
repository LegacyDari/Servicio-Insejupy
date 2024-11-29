<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seguimiento extends Model
{
    use HasFactory;

    protected $fillable = ['ticket_id', 'comentario'];

    // Relación inversa con el ticket
    public function ticket()
    {
        return $this->belongsTo(Ticket::class);
    }
}
