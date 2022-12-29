<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login',  [ApiController::class, 'login']);

//================== Add Users Api ====================================
Route::post('/add_users' , [ApiController::class, 'add_users']);

//================== Update Profile User Api ====================================
Route::post('/edit_user' , [ApiController::class, 'edit_user']);

//===============================Categoury Routes=====================================
Route::get('category', [ApiController::class, 'category'])->name('category');

//===============================Subcategoury Routes=============================================
Route::get('Subcategory', [ApiController::class, 'Subcategory'])->name('Subcategory');

//===============================Add booking against user Routes=============================================
Route::post('add_booking', [ApiController::class, 'add_booking'])->name('add_booking');

//===============================Categoury Routes=====================================
Route::post('upload_img', [ApiController::class, 'upload_img'])->name('upload_img');

//===============================booking_list against user Routes=============================================
Route::get('booking_list', [ApiController::class, 'booking_list'])->name('booking_list');

//===============================pending_list against user Routes=============================================
Route::get('pending_list', [ApiController::class, 'pending_list'])->name('pending_list');

//===============================confirmed_list against user Routes=============================================
Route::get('confirmed_list', [ApiController::class, 'confirmed_list'])->name('confirmed_list');

//===============================canclled_list against user Routes=============================================
Route::get('canclled_list', [ApiController::class, 'canclled_list'])->name('canclled_list');

//===============================completed_list against user Routes=============================================
Route::get('completed_list', [ApiController::class, 'completed_list'])->name('completed_list');

//============================Ratings Api ===========================================
Route::post('feedback', [ApiController::class, 'feedback']);

//============================Wallet Api ===========================================
Route::post('wallet', [ApiController::class, 'wallet']);

//============================Wallet Against user Api ===========================================
Route::get('wallet_user', [ApiController::class, 'wallet_user']);

//============================After Payment Api ===========================================
Route::post('payment', [ApiController::class, 'payment']);

//==============================Agent Login Api=======================================
Route::post('/agent_login',  [ApiController::class, 'agent_login']);

//=========================subscription Api's===========================================
Route::get('/subscription', [ApiController::class, 'subscription'])->name('subscription');

//=========================User-subscription Api's===========================================
Route::post('/user_subscription', [ApiController::class, 'user_subscription'])->name('user_subscription');

//=========================chk subscription Api's===========================================
Route::get('/chk_subscription', [ApiController::class, 'chk_subscription'])->name('chk_subscription');

//========================= Help Section Api's===========================================
Route::post('/help', [ApiController::class, 'help'])->name('help');

//========================= User Transaction Api's===========================================
Route::get('/user_trans', [ApiController::class, 'user_trans'])->name('user_trans');

//========================= Agent New Request Api's===========================================
Route::get('/new_request', [ApiController::class, 'new_request'])->name('new_request');

//========================= Agent On Going Request Api's===========================================
Route::get('/on_going', [ApiController::class, 'on_going'])->name('on_going');

//========================= Agent Request Status Change Api's===========================================
Route::get('/status_chng', [ApiController::class, 'status_chng'])->name('status_chng');

//========================= Agent Request History Api's===========================================
Route::get('/req_history', [ApiController::class, 'req_history'])->name('req_history');

//========================= Notification User Api's===========================================
Route::get('/notification', [ApiController::class, 'notification'])->name('notification');

//========================= Notification Agent Api's===========================================
Route::get('/notification_agent', [ApiController::class, 'notification_agent'])->name('notification_agent');

//========================= Agent Rating Api's===========================================
Route::post('/agent_rating', [ApiController::class, 'agent_rating'])->name('agent_rating');

//========================= User Rating Api's===========================================
Route::post('/user_rating', [ApiController::class, 'user_rating'])->name('user_rating');

//========================= Agent Average Rating Api's===========================================
// Route::post('/agent_rating_avg', [ApiController::class, 'agent_rating_avg'])->name('agent_rating_avg');