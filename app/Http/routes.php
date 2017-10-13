<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return '123';
});

$app->get('hello','ExampleController@index');


// Login
// Request post :
// 	login => 'admin', pass => '0000'
//	retourne 1 si le couple existe dans la db, 0 sinon
$app->post('login','UserController@login');

// Register - Insere une ligne dans la table user
// Request post :
// 	login => 'admin', pass => '0000', email => 'test@test.fr'
//	retourn 0 si ok, un message d'erreur sinon
$app->post('register','UserController@register');

$app->post('post/{id}', 'PostController@getFullPostById');
$app->post('posts', 'PostController@getList');
