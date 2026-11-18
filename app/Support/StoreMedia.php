<?php

namespace App\Support;

class StoreMedia
{
    public static function url(?string $path): string
    {
        if (! $path) {
            return asset('images/product-placeholder.svg');
        }

        if (str_starts_with($path, 'http://') || str_starts_with($path, 'https://')) {
            return $path;
        }

        if (str_starts_with($path, 'images/')) {
            return asset($path);
        }

        return asset('storage/'.$path);
    }
}
