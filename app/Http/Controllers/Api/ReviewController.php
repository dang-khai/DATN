<?php

namespace App\Http\Controllers\Api;

use App\Models\Review;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class ReviewController extends Controller
{
    public function store(Request $request) 
    {
        $validator = Validator::make($request->all() ,[
            'product_id' => 'required',
            'content' => 'required',
        ]);

        if ($validator->fails()) {
            return $validator->messages()->toJson();
        }

        $data = [
            'user_id' => auth()->id(),
            'product_id' => $request->product_id,
            'content' => $request->content,
        ];

        Review::create($data);

        return response()->json(['message' => 'Success']);
    }
}
