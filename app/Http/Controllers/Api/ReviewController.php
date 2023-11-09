<?php

namespace App\Http\Controllers\Api;

use App\Models\Review;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ReviewController extends Controller
{
    public function store(Request $request) 
    {


        $data = [
            'user_id' => auth()->id(),
            'product_id' => $request->product_id,
            'content' => $request->content,
        ];

        Review::create($data);

        return response()->json(['message' => 'Success']);
    }
}
