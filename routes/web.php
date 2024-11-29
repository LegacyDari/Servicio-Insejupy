<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TicketController;
Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::get('/', [TicketController::class, 'index'])->name('index.blade');
Route::resource('tickets', TicketController::class);
Route::get('/tickets', [TicketController::class, 'index'])->name('tickets.index');
Route::get('/tickets/create', [TicketController::class, 'create'])->name('tickets.create');
Route::post('/tickets', [TicketController::class, 'store'])->name('tickets.store');
Route::get('/tickets/{id}', [TicketController::class, 'show'])->name('tickets.show');
Route::post('/tickets/{id}/seguimiento', [TicketController::class, 'storeSeguimiento'])->name('seguimiento.store');
