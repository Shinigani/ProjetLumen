<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model 
{
    public static function login($login,$pass)
    {
        $count = User::whereRaw('pseudoUser = ? and passwordUser = ?', [$login, $pass])->count();

        return $count;
    } 
    
}
