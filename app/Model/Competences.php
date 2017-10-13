<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Competences extends Model
{
    public $table = "competences";

    public static function getAll()
    {
    	$post = Competences::get();

	    return $post;
    }
}
