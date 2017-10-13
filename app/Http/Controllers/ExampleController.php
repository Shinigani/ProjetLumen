<?php

namespace App\Http\Controllers;

use App\User;

class ExampleController extends Controller
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

    public function index()
    {
<<<<<<< HEAD
        $test = array(
          array("marque" => "Volvo","prix" => 22,"cv" => 18),
          array("marque" => "BMW","prix" => 15,"cv" => 13),
          array("marque" => "Saab","prix" => 5,"cv" => 2),
          array("marque" => "Land Rover","prix" => 17,"cv" => 15)
        );
=======
        $test = User::login("root","0000");
>>>>>>> 8e566135623e72670d30d64319f719c973a14f93
        return json_encode($test);
    }

    //
}
