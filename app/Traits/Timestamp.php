<?php

namespace App\Traits;

trait Timestamp
{
    public function getCreatedAtAttribute($value)
    {
        $createdAt = \Carbon\Carbon::parse($value);
        $createdAt->setTimezone('Asia/Ho_Chi_Minh');
        return $createdAt->format('Y-m-d H:i:s');
    }
    public function getUpdatedAtAttribute($value)
    {
        $createdAt = \Carbon\Carbon::parse($value);
        $createdAt->setTimezone('Asia/Ho_Chi_Minh');
        return $createdAt->format('Y-m-d H:i:s');
    }

}