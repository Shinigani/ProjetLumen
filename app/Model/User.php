<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public static function login($login,$pass)
    {
        $count = User::whereRaw('pseudoUser = ? and passwordUser = ?', [$login, $pass])->count();

        return $count;
    }

    public static function register($login,$pass,$email)
    {
    	$count = User::whereRaw('pseudoUser = ? or emailUser = ?', [$login, $email])->count();

    	if($count > 0)
    	{
    		$return = "email ou pseudo existe deja";
    	}
    	else
		{
	        User::insert(
		        [
		        	"pseudoUser" => $login,
		        	"passwordUser" => $pass,
		        	"emailUser" => $email
		        ]
	        );

	        $return = 1;
	    }

	    return $return;

    }

}
