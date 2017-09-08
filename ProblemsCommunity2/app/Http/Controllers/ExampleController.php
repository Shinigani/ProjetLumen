<?php

namespace App\Http\Controllers;

use App\User;

class ExampleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function index()
    {
        $test = User::login("admin","0000");
        return json_encode($test);
    }

    //
}
