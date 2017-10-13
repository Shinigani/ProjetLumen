<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    public $table = "post";

    public static function getFullPostById($idPost)
    {
    	$post = Post::whereRaw('idPost = ?', [$idPost])->first();

	    return $post;
    }



}
