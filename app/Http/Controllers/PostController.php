<?php

namespace App\Http\Controllers;

use App\Model\Post;
use App\Model\Message;

class PostController extends Controller
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

    public function getFullPostById($idPost)
    {
        $messages = Message::getAllIdPost($idPost);
        $post = Post::getFullPostById($idPost);
        $post["messages"] = $messages;
        return $post;
    }

    public function getList()
    {
        $posts = Post::join('message', 'post.idPost', '=', 'message.idPost')->where('message.isMainMessage','1')->orderBy('post.dateLastPost', 'DESC')->get();
        return $posts;
    }
}
