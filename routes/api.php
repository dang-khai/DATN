<?php

use App\Http\Controllers\Api\CartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     // return $request->user();
// });

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('/logout', LogoutController::class);
    Route::post('/add-to-cart', [CartController::class, 'addToCart']);
    Route::get('/get-cart', [CartController::class, 'getCart']);
    Route::post('/delete-form-cart', [CartController::class, 'delete']);
});

Route::post('/register', [RegisterController::class, 'register']);
Route::post('/verify-email', [RegisterController::class, 'verify']);
Route::post('/login', [LoginController::class, 'login']);