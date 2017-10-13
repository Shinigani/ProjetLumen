<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    public static function get($login,$pass,$email)
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
