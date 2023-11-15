<?php

use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\BlogController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\GoogleController;
use App\Http\Controllers\OrderController;

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

    Route::prefix('/order')->group(function () {
        Route::post('/', [OrderController::class, 'store']);
    });

    Route::post('/logout', LogoutController::class);

    Route::post('/review', [ReviewController::class, 'store']);
});

Route::get('/categories', [CategoryController::class,'index']);

Route::prefix('/products')->group(function () {
    Route::get('/', [ProductController::class, 'index']);
    Route::get('/{id}', [ProductController::class, 'show']);
});

Route::get('/blogs', [BlogController::class, 'index']);

Route::post('/register', [RegisterController::class, 'register']);
Route::post('/verify-email', [RegisterController::class, 'verify']);
Route::post('/login', [LoginController::class, 'login']);

//google login
Route::group(['middleware' => ['web']], function () {
    Route::get('/google', [GoogleController::class, 'redirectToGoogle']);
    Route::get('/google/callback', [GoogleController::class, 'handleGoogleCallback']);
});