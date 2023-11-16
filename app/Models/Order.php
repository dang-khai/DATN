<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Carbon;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';
    protected $fillable = ['user_id', 'phone', 'address', 'status', 'order_at', 'total_amount'];

    public function orderDetail(): BelongsTo
    {
        return $this->belongsTo(OrderDetail::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    public function items(): HasMany
    {
        return $this->hasMany(OrderDetail::class, 'order_id');
    }
    // public function getOrderAtAttribute($value)
    // {
    //     $this->attributes['order_at'] = Carbon::parse($value);
    // }
}
