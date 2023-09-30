<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function getCart()
    {
        $data = auth()->user()->cart->cartItems;

        return response()->json($data);
    }

    public function addToCart(Request $request)
    {
        try {
            DB::beginTransaction();

            $user = auth()->user();

            $validated = Validator::make($request->all(), [
                'product_id' => 'required',
                'quantity' => 'required',
            ]);
            if ($validated->fails()) {
                return response()->json($validated->messages(), 401);
            }
            if (!Product::find(request('product_id'))) {
                return response()->json(['message' => 'Product not found'], 404);
            }
            
            if ($user->cart == null) {
                $cart = Cart::create([
                    'user_id' => $user->id,
                ]);
            }

            CartItem::updateOrCreate(
                [
                    'cart_id' => $user->cart ? $user->cart->id : $cart->id,
                    'product_id' => request('product_id'),
                ],
                [
                    'product_id' => request('product_id'),
                    'quantity' => request('quantity'),
                ]
            );

            DB::commit();

            return response()->json(['Message' => 'Add to cart successfully'], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return $e;
        }
    }

    public function delete(Request $request)
    {
        $validated = Validator::make($request->all(), [
            'product_id' => 'required',
        ]);
        if ($validated->fails()) {
            return response()->json($validated->messages(), 401);
        }
        $userCart = auth()->user()->cart;
        $productInCart = $userCart->cartItems->where('product_id', request('product_id'));

        if (!$productInCart || !$userCart) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $productInCart[0]->delete();

        return response()->json(['message' => 'Delete product successfully']);
    }
}