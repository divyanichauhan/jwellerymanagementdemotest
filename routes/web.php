<?php

use Illuminate\Support\Facades\Route;

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
    return view('welcome');
});

Auth::routes();
// front product listpage
Route::get('productlist','Admin\ProductController@productlist')->name('productlist');

Route::group(['prefix'=>'admin','middleware' =>  'admin'], function ()
  {
    Route::get('admin-dashbord','HomeController@adminindex');
    Route::resource('product', 'Admin\ProductController');

  });

Route::group(['middleware' =>  'user'], function ()
  {
	Route::get('/home', 'HomeController@index')->name('home');

  });