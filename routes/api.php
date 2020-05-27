<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


// Route::group(['middleware' => 'auth:api'], function(){
 	
//  });
	Route::post('api-add-to-cart','Api\CartController@addtocart')->name('api-add-to-cart');
	Route::post('api-change-qty','Api\CartController@changeQty')->name('api-change-qty');
	Route::post('api-remove-cart-data','Api\CartController@removeCart')->name('api-remove-cart-data');
	Route::post('api-clear-cart-data','Api\CartController@clearCart')->name('api-clear-cart-data');
	Route::get('api-cart-data','Api\CartController@cartDetails')->name('api-cart-data');