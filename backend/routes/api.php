<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AsetController;
use App\Http\Controllers\Api\MutasiAsetController;
use App\Http\Controllers\Api\BarcodeController;
use App\Http\Controllers\Api\LaporanController;

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

// CORS test route
Route::get('/cors-test', function () {
    return response()->json([
        'message' => 'CORS is working!',
        'timestamp' => now(),
        'origin' => request()->header('Origin')
    ]);
});

// Public routes

Route::get('/login', function () {
    return response()->json([
        'message' => 'Login API aktif. Gunakan method POST dengan email dan password.',
    ]);
});
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

// Protected routes
Route::middleware('auth:sanctum')->group(function () {
    // Auth routes
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);

    // Asset routes
    Route::apiResource('asets', AsetController::class);
    Route::get('asets/statistics', [AsetController::class, 'statistics']);

    // Mutation routes
    Route::apiResource('mutasi-asets', MutasiAsetController::class);
    Route::get('mutasi-asets/overdue', [MutasiAsetController::class, 'overdue']);
    Route::get('mutasi-asets/user-history', [MutasiAsetController::class, 'userHistory']);

    // Barcode routes
    Route::get('barcode/{id}/generate', [BarcodeController::class, 'generate']);
    Route::get('barcode/{id}/generate-qr', [BarcodeController::class, 'generateQR']);
    Route::get('barcode/{id}/download-pdf', [BarcodeController::class, 'downloadPDF']);
    Route::post('barcode/scan', [BarcodeController::class, 'scan']);

    // Report routes
    Route::get('laporan/aset/excel', [LaporanController::class, 'exportAsetExcel']);
    Route::get('laporan/aset/pdf', [LaporanController::class, 'exportAsetPDF']);
    Route::get('laporan/mutasi/excel', [LaporanController::class, 'exportMutasiExcel']);
    Route::get('laporan/mutasi/pdf', [LaporanController::class, 'exportMutasiPDF']);
    Route::get('laporan/dashboard-stats', [LaporanController::class, 'dashboardStats']);
});
