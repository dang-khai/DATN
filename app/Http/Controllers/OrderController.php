<?php

namespace App\Http\Controllers;

use App\Enums\EOrderStatus;
use App\Http\Requests\OrderRequest;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderItem;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function store(OrderRequest $request)
    {
        $total_amount = 0;
        $data = [ 
            "fullname" => "hehehehe",
            "quantity" => "2",
            "phone" => "0904059215",
            "address" => "ehhehe",
            "order_detail" => [
                [
                    'product_id' => 29,
                    'quantity' => 3,
                    'price' => '20000'
                ],
                [
                    'product_id' => 31,
                    'quantity' => 5,
                    'price' => '20000'
                ],
            ],
        ];

        $order = Order::create([
            'user_id' => auth()->id(),
            'phone' => $request->phone,
            'address'=> $request->address,
            'status' => EOrderStatus::NEW,
            'order_at' => Carbon::now(),
        ]);

        foreach ($data['order_detail'] as $item) {
            OrderDetail::create([
                'order_id' => $order->id,
                'product_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'amount' => $item['quantity'],
            ]);
            $total_amount += $item['quantity'] * $item['price'];
        }

        $order->update(['total_amount' => $total_amount]);

        return response()->json(['message' => 'Order created successfully']);
    }
}