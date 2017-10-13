<?php

namespace App\Http\Controllers;

use App\Model\Message;

class MessageController extends Controller
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

    public function getAllIdPost($idPost)
    {
        $messages = Message::getAllIdPost($idPost);
        return $messages;
    }
}
