<?php

namespace App\Http\Controllers;

use App\User;

class UserController extends Controller
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

    public function register()
    {
        if(isset($_GET['login']) && isset($_GET['pass']) && isset($_GET['email']))
        {
            $return = User::register($_GET['login'],$_GET['pass'],$_GET['email']);
        }
        else
        {
            $return = 0;
        }

        return $return;
    }
}
