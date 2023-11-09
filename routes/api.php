<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Api\ReviewController;
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

    Route::prefix('/products')->group(function () {
        Route::get('/', [ProductController::class, 'index']);
        Route::get('/{id}', [ProductController::class, 'show']);
    });

    Route::post('/review', [ReviewController::class, 'store']);
});

Route::post('/register', [RegisterController::class, 'register']);
Route::post('/verify-email', [RegisterController::class, 'verify']);
Route::post('/login', [LoginController::class, 'login']);