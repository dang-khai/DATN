<?php

namespace App\Enums;

class EOrderStatus {
    const NEW = 1;
    const PROCESSING = 2;
    const SHIPPING = 3;
    const DELIVERIED = 4;
    const CANCELED = 5;


    public static function getAll()
    {
        return [
            self::NEW => 'New',
            self::PROCESSING => 'Processing',
            self::SHIPPING => 'Shipping',
            self::DELIVERIED => 'Delivered',
            self::CANCELED => 'Cancelled',
        ];
    }

    public static function getName($value)
    {
        switch ($value) {
            case self::NEW:
                return 'New';
            case self::PROCESSING:
                return 'Processing';
            case self::SHIPPING:
                return 'Shipping';
            case self::DELIVERIED:
                return 'Delivered';
            case self::CANCELED:
                return 'Cancelled';
        }
        
        return null;
    }
}

?>