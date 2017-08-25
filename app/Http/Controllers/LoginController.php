<?php

namespace App\Http\Controllers;

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
    	if(isset($_GET['login']) && isset($_GET['pass']) && $_GET['login'] == 'root' and $_GET['pass'] == "0000")
    	{
    		$return = 1;
    	}
    	else
    	{
    		$return = 0;
    	}
        return $return;
    }

    //
}
