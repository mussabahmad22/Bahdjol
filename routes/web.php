<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Models\User;
use App\Models\AllCategory;
use App\Models\SubCategory;
use App\Models\Booking;
use App\Models\Agent;
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

Route::get('/', function () {
    $users =  User::all()->count();
    $cat =  AllCategory::all()->count();
    $subcat =  SubCategory::all()->count();
    $booking =  Booking::all()->count();
    $agent =  Agent::all()->count();
    return view('dashboard', compact('users', 'cat', 'subcat', 'booking', 'agent'));
})->middleware('auth');

Route::middleware('auth')->group(function () {

    Route::get('/admin_logout', [AdminController::class, 'logout'])->name('admin_logout');
    Route::get('/admin_dashboard', [AdminController::class, 'admin_dashboard'])->name('admin_dashboard');
    // Route::get('/index', [AdminController::class, 'index'])->name('index');
    // Route::get('/show_add_user', [AdminController::class, 'show_add_user'])->name('show_add_user');
    // Route::get('/category', [AdminController::class, 'category'])->name('category');


    //=========================== users ===========================================
    Route::get('/users', [AdminController::class, 'users'])->name('users');
    Route::delete('/delete_user', [AdminController::class, 'delete_user'])->name('delete_user');

    //=============================== Add Agents ============================================
    Route::get('/agents', [AdminController::class, 'agents'])->name('agents');
    Route::get('/show_add_agent', [AdminController::class, 'show_add_agent'])->name('show_add_agent');
    Route::post('/add_agent', [AdminController::class, 'add_agent'])->name('add_agent');
    Route::get('/edit_agent/{id}', [AdminController::class, 'edit_agent'])->name('edit_agent');
    Route::post('/agent_update', [AdminController::class, 'agent_update'])->name('agent_update');
    Route::delete('/delete_agent', [AdminController::class, 'delete_agent'])->name('delete_agent');

    //=============================== Categories  ============================================
    Route::get('categories', [AdminController::class, 'categories'])->name('categories');
    Route::get('/category', [AdminController::class, 'category'])->name('category');
    Route::post('category', [AdminController::class, 'add_category'])->name('addCategory');
    Route::get('categories', [AdminController::class, 'categories'])->name('categories');
    Route::get('edit_category/{id}', [AdminController::class, 'edit_category'])->name('edit_category');
    Route::PUT('category_update', [AdminController::class, 'category_update'])->name('category_update');
    Route::delete('category_delete', [AdminController::class, 'category_delete'])->name('category_delete');

    //=============================Sub Categoury Routes=========================================
    Route::get('subcategory/{id}', [AdminController::class, 'subcategory'])->name('subcategory');
    Route::get('subcategoryshow/{id}', [AdminController::class, 'show_sub_category'])->name('showsubCategory');
    Route::post('add_sub_category', [AdminController::class, 'add_sub_category'])->name('addSubCategory');
    Route::get('subcategoryshow/edit_sub_category/{id}', [AdminController::class, 'edit_sub_category'])->name('edit_sub_category');
    Route::PUT('sub_category_update', [AdminController::class, 'sub_category_update'])->name('sub_category_update');
    Route::delete('sub_category_delete', [AdminController::class, 'sub_category_delete'])->name('sub_category_delete');
    
    //==================================Booking Routes =======================================
    Route::get('booking', [AdminController::class, 'booking'])->name('booking');
    Route::get('booking_details/{id}', [AdminController::class, 'booking_details'])->name('booking_details');
    Route::delete('delete_booking', [AdminController::class, 'delete_booking'])->name('delete_booking');

    //=========================== cahnge order status ===========================================
    Route::get('status', [AdminController::class, 'status'])->name('status');
    Route::get('agent_assign', [AdminController::class, 'agent_assign'])->name('agent_assign');

    //==============================ratings routes ==========================================
    Route::get('feedback', [AdminController::class, 'feedback'])->name('feedback');
    Route::delete('/delete_feedback', [AdminController::class, 'delete_feedback'])->name('delete_feedback');

    //=============================== Manage Wallet  ============================================

    Route::get('/wallet', [AdminController::class, 'wallet'])->name('wallet');
    Route::post('add_wallet', [AdminController::class, 'add_wallet'])->name('add_wallet');
    Route::get('edit_wallet/{id}', [AdminController::class, 'edit_wallet'])->name('edit_wallet');
    Route::PUT('wallet_update', [AdminController::class, 'wallet_update'])->name('wallet_update');
    Route::delete('wallet_delete', [AdminController::class, 'wallet_delete'])->name('wallet_delete');

    //=========================subscription routes===========================================
    Route::get('/subscription', [AdminController::class, 'subscription'])->name('subscription');
    Route::post('add_subscription', [AdminController::class, 'add_subscription'])->name('addpkg');
    Route::get('edit_subscription/{id}', [AdminController::class, 'edit_subscription'])->name('edit_subscription');
    Route::PUT('subscription_update', [AdminController::class, 'subscription_update'])->name('updatepkg');
    Route::delete('subscription_delete', [AdminController::class, 'subscription_delete'])->name('subscription_delete');

    //=========================== Help Section ===========================================
    Route::get('/help', [AdminController::class, 'help'])->name('help');
    Route::delete('/delete_help', [AdminController::class, 'delete_help'])->name('delete_help');

});

Route::get('/dashboard', function () {
    $users =  User::all()->count();
    $cat =  AllCategory::all()->count();
    $subcat =  SubCategory::all()->count();
    $booking =  Booking::all()->count();
    $agent =  Agent::all()->count();
    return view('dashboard', compact('users', 'cat', 'subcat', 'booking', 'agent'));
})->middleware(['auth'])->name('dashboard');

require __DIR__ . '/auth.php';
