<?php

namespace App\Enums;

class EMedia {
    const CATEGORY = 1;
    const PRODUCT = 2;

    public static function getAll()
    {
        return [
            self::CATEGORY => 'Category',
            self::PRODUCT => 'Product',
        ];
    }

    public static function getName($value)
    {
        switch ($value) {
            case self::CATEGORY:
                return 'Category';
            case self::PRODUCT:
                return 'Product';
        }
        
        return null;
    }
}

?>