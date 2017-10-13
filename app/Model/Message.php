<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    public $table = "message";

    public static function getAllIdPost($idPost)
    {
      $post = Message::whereRaw('idPost = ?', [$idPost])->orderBy('dateMessage', 'ASC')->get()->toArray();

	    return $post;

    }

}
