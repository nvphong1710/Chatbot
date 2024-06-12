<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ThucDonController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', [MessageController::class,'index']); 
Route::get('/home', [MessageController::class,'index']); 
Route::post('/delete', [MessageController::class, 'delete']);
Route::post('/submit', [MessageController::class, 'submitForm']);
Route::get('/thucdon/{sex}/{tuoi}/{weight}/{height}', [ThucDonController::class,'result']);  