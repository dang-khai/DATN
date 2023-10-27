<?php

namespace App\Models;

use App\Traits\Timestamp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Category extends Model implements HasMedia
{
    use HasFactory, Timestamp, InteractsWithMedia;
    protected $table = 'categories';

    protected $fillable = ['name', 'visibility', 'slug'];

    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }
}
