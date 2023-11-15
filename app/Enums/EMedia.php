<?php

namespace App\Enums;

class EMedia {
    const CATEGORY = 1;
    const PRODUCT = 2;
    const BLOG = 3;

    public static function getAll()
    {
        return [
            self::CATEGORY => 'Category',
            self::PRODUCT => 'Product',
            self::BLOG => 'Blog',
        ];
    }

    public static function getName($value)
    {
        switch ($value) {
            case self::CATEGORY:
                return 'Category';
            case self::PRODUCT:
                return 'Product';
            case self::BLOG:
                return 'Blog';
        }
        
        return null;
    }
}

?>