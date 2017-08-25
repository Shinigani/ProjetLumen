<?php

namespace App\Http\Controllers;

use App\User;

class LoginController extends Controller
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

    public function login()
    {
    	if(isset($_GET['login']) && isset($_GET['pass']))
    	{
    		$return = User::login($_GET['login'],$_GET['pass']);
    	}
    	else
    	{
    		$return = 0;
    	}

        return $return;
    }

    //
}
