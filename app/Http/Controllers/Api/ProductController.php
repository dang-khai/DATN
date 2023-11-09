<?php

namespace App\Http\Controllers\Api;

use App\Enums\EMedia;
use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('reviews')->get();
        foreach ($products as $product) {
            $product->getMedia('', ['original_url', 'file_name']);
        }

        return response()->json($products);
    }

    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }
        $product->reviews;
        $product->getMedia('', ['original_url', 'file_name']);

        return response()->json($product);
    }
}
