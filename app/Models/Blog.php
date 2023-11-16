<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Blog extends Model implements HasMedia
{
    use HasFactory;
    use InteractsWithMedia;

    protected $table = 'blogs';
    protected $fillable = ['title', 'description', 'slug', 'published_at', 'visibility'];

    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }
}
