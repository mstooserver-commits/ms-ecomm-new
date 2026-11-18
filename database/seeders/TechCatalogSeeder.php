<?php

namespace Database\Seeders;

use App\Models\Banner;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductVariant;
use App\Models\Setting;
use Illuminate\Database\Seeder;

class TechCatalogSeeder extends Seeder
{
    public function run(): void
    {
        $brand = Brand::updateOrCreate(
            ['slug' => 'msf-tech'],
            ['name' => 'MSF', 'is_active' => true]
        );

        $categories = [
            ['phone-cases', 'Phone Cases', 'images/tech/phone-case.jpg'],
            ['charging', 'Charging', 'images/tech/power-bank.jpg'],
            ['earbuds-cases', 'Earbuds Cases', 'images/tech/earbuds-case.jpg'],
            ['ring-holders', 'Ring Holders', 'images/tech/ring-holder.jpg'],
            ['watch-bands', 'Watch Bands', 'images/tech/watch-band.jpg'],
            ['laptop-protection', 'Laptop Protection', 'images/tech/laptop-sleeve.jpg'],
            ['tablet-cases', 'Tablet Cases', 'images/tech/tablet-case.jpg'],
        ];

        $categoryIds = [];
        foreach ($categories as $index => [$slug, $name, $image]) {
            $category = Category::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'image' => $image,
                'is_featured' => true,
                'is_active' => true,
                'sort_order' => $index + 1,
            ]);
            $categoryIds[$slug] = $category->id;
        }

        $products = [
            ['Marble Phone Case', 'marble-phone-case', 'MSF-TECH-001', 2499, 3299, 'phone-cases', 'images/tech/phone-case.jpg', true, true, true],
            ['Magnetic Power Bank', 'magnetic-power-bank', 'MSF-TECH-002', 3499, 4299, 'charging', 'images/tech/power-bank.jpg', true, false, true],
            ['Stripe Earbuds Case', 'stripe-earbuds-case', 'MSF-TECH-003', 1999, null, 'earbuds-cases', 'images/tech/earbuds-case.jpg', false, true, false],
            ['Gold Ring Holder', 'gold-ring-holder', 'MSF-TECH-004', 1299, null, 'ring-holders', 'images/tech/ring-holder.jpg', true, false, false],
            ['Print Watch Band', 'print-watch-band', 'MSF-TECH-005', 1799, null, 'watch-bands', 'images/tech/watch-band.jpg', false, true, false],
            ['Canvas Laptop Sleeve', 'canvas-laptop-sleeve', 'MSF-TECH-006', 2999, null, 'laptop-protection', 'images/tech/laptop-sleeve.jpg', false, false, true],
            ['Folio Tablet Case', 'folio-tablet-case', 'MSF-TECH-007', 3299, 3999, 'tablet-cases', 'images/tech/tablet-case.jpg', false, true, false],
        ];

        $slugs = array_column($products, 1);

        foreach ($products as [$name, $slug, $sku, $price, $compare, $category, $image, $trending, $newArrival, $bestSeller]) {
            $product = Product::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'sku' => $sku,
                'brand_id' => $brand->id,
                'category_id' => $categoryIds[$category],
                'short_description' => 'A fashion tech essential with a precise fit and a finish made to be seen.',
                'description' => 'Designed as an everyday accessory. Drop-conscious construction, a clean profile, and a print that stays sharp.',
                'specifications' => 'Precision fit. Raised edges for the camera and screen. Compatible with wireless charging where marked.',
                'shipping_info' => 'Ships across India. Free delivery on orders over ₹15,000.',
                'price' => $price,
                'compare_at_price' => $compare,
                'stock' => 40,
                'is_active' => true,
                'is_featured' => true,
                'is_trending' => $trending,
                'is_new_arrival' => $newArrival,
                'is_best_seller' => $bestSeller,
                'meta_title' => $name.' | MSF',
                'meta_description' => $name.' — fashion tech accessories.',
            ]);

            ProductImage::updateOrCreate(
                ['product_id' => $product->id, 'is_primary' => true],
                ['path' => $image, 'alt' => $name, 'sort_order' => 0]
            );

            ProductVariant::updateOrCreate(
                ['sku' => $sku.'-STD'],
                ['product_id' => $product->id, 'color' => 'Standard', 'price' => $price, 'stock' => 40, 'is_active' => true]
            );
        }

        Product::query()->whereNotIn('slug', $slugs)->update([
            'is_active' => false,
            'is_featured' => false,
            'is_trending' => false,
            'is_new_arrival' => false,
            'is_best_seller' => false,
        ]);

        Category::query()->whereNotIn('id', array_values($categoryIds))->update([
            'is_active' => false,
            'is_featured' => false,
        ]);

        Banner::query()->update(['is_active' => false]);
        Banner::updateOrCreate(['title' => 'Everyday tech, dressed up'], [
            'subtitle' => 'Phone cases, charging and matching accessories.',
            'image' => 'images/tech/hero-tech.jpg',
            'link' => '/shop',
            'button_text' => 'Shop now',
            'placement' => 'hero',
            'is_active' => true,
            'sort_order' => 1,
        ]);

        Setting::updateOrCreate(['key' => 'announcement'], [
            'group' => 'store',
            'value' => 'New tech drop · Phone cases, power and accessories',
            'type' => 'text',
        ]);
    }
}
