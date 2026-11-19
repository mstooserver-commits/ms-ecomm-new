<?php

namespace Database\Seeders;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductVariant;
use Illuminate\Database\Seeder;

class ZorrussoDropSeeder extends Seeder
{
    public function run(): void
    {
        $brand = Brand::where('slug', 'msf-tech')->firstOrFail();

        $categories = [
            ['phone-cases', 'Phone Cases', 'images/tech/phone-case.jpg', 'Cases with a finish you can see, shaped to the phone you already carry.', 1],
            ['charging', 'Charging', 'images/tech/power-bank.jpg', 'Power banks and desk stands that keep a phone ready.', 2],
            ['earbuds-cases', 'Earbuds Cases', 'images/tech/earbuds-case.jpg', 'Cases and pouches that keep earbuds from rattling around.', 3],
            ['ring-holders', 'Ring Holders', 'images/tech/ring-holder.jpg', 'A grip that stays on the back of the phone.', 4],
            ['watch-bands', 'Watch Bands', 'images/tech/watch-band.jpg', 'Bands that swap the look of a watch in a minute.', 5],
            ['laptop-protection', 'Laptop Protection', 'images/tech/laptop-sleeve.jpg', 'Sleeves that take a laptop through a commute.', 6],
            ['tablet-cases', 'Tablet Cases', 'images/tech/tablet-case.jpg', 'Folios and shells for a tablet that leaves the house.', 7],
            ['screen-guards', 'Screen Guards', 'images/tech/tempered-glass.jpg', 'Clear glass that sits flush and keeps the display clean.', 8],
            ['cables', 'Cables', 'images/tech/braided-cable.jpg', 'Braided charge cables that stay tidy in a bag.', 9],
        ];

        $categoryIds = [];
        foreach ($categories as [$slug, $name, $image, $description, $sort]) {
            $category = Category::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'image' => $image,
                'description' => $description,
                'is_featured' => true,
                'is_active' => true,
                'sort_order' => $sort,
            ]);
            $categoryIds[$slug] = $category->id;
        }

        $products = [
            ['Sandstone Phone Case', 'sandstone-phone-case', 'MSF-TECH-008', 2199, 2799, 'phone-cases', 'images/tech/sandstone-phone-case.jpg', true, true, true, 'A warm stone texture on a slim case.'],
            ['Lime Grid Phone Case', 'lime-grid-phone-case', 'MSF-TECH-009', 2299, 2899, 'phone-cases', 'images/tech/lime-grid-phone-case.jpg', true, true, false, 'A matte black case crossed with a lime grid.'],
            ['Night Glass Phone Case', 'night-glass-phone-case', 'MSF-TECH-010', 2399, null, 'phone-cases', 'images/tech/night-glass-phone-case.jpg', false, true, false, 'Smoked translucent shell with a dark tint.'],
            ['Desk Charge Stand', 'desk-charge-stand', 'MSF-TECH-011', 2799, 3499, 'charging', 'images/tech/desk-charge-stand.jpg', false, false, true, 'An aluminum stand that holds a phone upright while it charges.'],
            ['Braided Charge Cable', 'braided-charge-cable', 'MSF-TECH-012', 899, null, 'cables', 'images/tech/braided-cable.jpg', false, true, false, 'An olive braided USB-C cable that coils without kinking.'],
            ['Matte Ring Holder', 'matte-ring-holder', 'MSF-TECH-013', 999, null, 'ring-holders', 'images/tech/matte-ring-holder.jpg', true, false, false, 'A matte black ring that folds flat against the case.'],
            ['Sport Loop Band', 'sport-loop-band', 'MSF-TECH-014', 1499, 1899, 'watch-bands', 'images/tech/sport-loop-band.jpg', false, true, true, 'A charcoal knit loop that closes without a buckle.'],
            ['Clear Tablet Shell', 'clear-tablet-shell', 'MSF-TECH-015', 2799, 3499, 'tablet-cases', 'images/tech/clear-tablet-shell.jpg', false, true, false, 'A clear hard shell that shows the tablet and covers the corners.'],
            ['Tempered Glass Guard', 'tempered-glass-guard', 'MSF-TECH-016', 699, 999, 'screen-guards', 'images/tech/tempered-glass.jpg', false, true, true, 'A clear sheet of glass cut to the display, with room for the camera.'],
            ['Cream Earbuds Pouch', 'cream-earbuds-pouch', 'MSF-TECH-017', 1499, null, 'earbuds-cases', 'images/tech/soft-earbuds-pouch.jpg', true, false, false, 'A soft cream pouch with a snap close for a charging case.'],
        ];

        foreach ($products as [$name, $slug, $sku, $price, $compare, $category, $image, $trending, $newArrival, $bestSeller, $short]) {
            $product = Product::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'sku' => $sku,
                'brand_id' => $brand->id,
                'category_id' => $categoryIds[$category],
                'short_description' => $short,
                'description' => $short.' Made for everyday carry, with a clean profile and a finish that stays put.',
                'specifications' => 'Precision fit. Raised edges where the piece covers a camera or screen. Wireless charging where the product allows it.',
                'shipping_info' => 'Ships across India. Free delivery on orders over ₹15,000.',
                'price' => $price,
                'compare_at_price' => $compare,
                'stock' => 40,
                'is_active' => true,
                'is_featured' => true,
                'is_trending' => $trending,
                'is_new_arrival' => $newArrival,
                'is_best_seller' => $bestSeller,
                'meta_title' => $name.' | Zorrusso',
                'meta_description' => $short,
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
    }
}
