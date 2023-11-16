<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function index()
    {
        $blogs = Blog::all();

        return response()->json($blogs);
    }

    public function show($id)
    {
        $blog = Blog::find($id)->with(['comments']);

        return response()->json($blog);
    }
}
