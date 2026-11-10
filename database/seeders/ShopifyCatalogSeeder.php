<?php

namespace Database\Seeders;

use App\Models\Banner;
use App\Models\Blog;
use App\Models\Brand;
use App\Models\Category;
use App\Models\InstagramPost;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductVariant;
use App\Models\Setting;
use App\Models\Testimonial;
use Illuminate\Database\Seeder;

class ShopifyCatalogSeeder extends Seeder
{
    public function run(): void
    {
        Banner::query()->update(['is_active' => false]);
        Blog::where('slug', 'australian-streetwear-rise')->update(['is_published' => false]);
        Testimonial::whereIn('name', ['Alex M.', 'Jordan K.'])->update(['is_active' => false]);
        InstagramPost::where('link', 'https://instagram.com')->update(['is_active' => false]);
        Brand::whereIn('slug', ['noir', 'street-labs', 'urban-drift', 'collective-co', 'arden-and-co'])->update(['is_active' => false]);
        Product::whereIn('slug', [
            'haven-modular-sofa', 'elara-lounge-chair', 'sora-oak-coffee-table', 'milo-boucle-armchair',
            'tide-solid-oak-dining-table', 'cove-dining-chair', 'forma-bed-frame', 'aster-travertine-lamp',
        ])->update(['is_active' => false]);
        Category::whereIn('slug', ['living-room', 'dining', 'bedroom', 'lighting'])->update(['is_active' => false, 'is_featured' => false]);

        $brand = Brand::updateOrCreate(['slug' => 'ms-furniture'], ['name' => 'MS Furniture', 'is_active' => true]);
        $categories = collect([
            'chairs' => ['Chairs', 'https://4zgwrv-td.myshopify.com/cdn/shop/collections/make-design-of-chair-more-royal.png?v=1769484765&width=1000'],
            'sofas' => ['Sofas', 'https://4zgwrv-td.myshopify.com/cdn/shop/collections/change-fabric-color-from-blue-to-pista-light-greaan-and-cream-with-royal-prints-on-sofa.png?v=1769483918&width=1000'],
            'tables-consoles' => ['Tables & Consoles', 'https://4zgwrv-td.myshopify.com/cdn/shop/collections/a-royal-luxury-console-table.png?v=1769484946&width=1000'],
            'office-furniture' => ['Office Furniture', 'https://4zgwrv-td.myshopify.com/cdn/shop/collections/make-it-look-more-royal-and-luxury.png?v=1769255618&width=1000'],
        ])->mapWithKeys(function ($data, $slug) {
            $category = Category::updateOrCreate(['slug' => $slug], [
                'name' => $data[0], 'image' => $data[1], 'is_featured' => true, 'is_active' => true,
            ]);
            return [$slug => $category];
        });

        $products = [
            ['Classic Chair MS03','classic-chair-ms03',35000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_6bf510c7-9461-411d-9781-9482b06310a4.png?v=1788173714'],
            ['Vintage Chair MS17','vintage-chair-ms17',35000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_36c7b699-0a0b-40b1-9f62-da54a3850972.png?v=1788173714'],
            ['Cane Chair MS01','cane-ms01',15000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_fd419c4f-00c5-4d68-a3ba-9701922e9fda.png?v=1788173714'],
            ['Edward Console','edword-console',165000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_d3e9a2e2-c16d-4d92-96ac-968c600aa114.png?v=1788172340'],
            ['Leather Trunk','trunk',65000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_5572b6a2-cda0-46b8-8222-9a1aa9837fd2.png?v=1788172164'],
            ['British Chesterfield Sofa','british-chester-sofa',350000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_07388e23-0005-4e42-b026-5253135734fe.jpg?v=1788171963'],
            ['Leather Tub Chair','tub-chair',22000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_0661773a-9f61-4b36-bb5d-fadb8a544994.jpg?v=1788171770'],
            ['Kong II Sofa','kong-ii-sofa',250000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_d10a7115-625c-4fe7-836e-7769ec268ce2.jpg?v=1788170855'],
            ['The Karan Aujla Signature Tufted Chesterfield Sofa','the-karan-aujla-signature-tufted-chesterfield-sofa',80000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_478d83cb-05ef-4063-8857-fe4aa8417bfc.png?v=1772044015'],
            ['Bespoke Personalised Signature Marble Tabletop','bespoke-personalized-signature-marble-table-top',27000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_eccc673a-170f-4486-9064-d252974f3cda.jpg?v=1772043862'],
            ['The Karan Aujla Signature Dual-Upholstery Lounge Chair','the-karan-aujla-signature-dual-upholstery-lounge-chair',50000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_a7a8e5d4-b940-465c-afff-fa5568b59e51.jpg?v=1772042130'],
            ['The Karan Aujla Signature Carved Leather Accent Chair','the-karan-aujla-signature-carved-leather-accent-chair',50000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_6b559cb0-4c6d-4c6a-81f0-9d8deb16aab0.jpg?v=1772041466'],
            ['The Karan Aujla Signature Marble Centre Table','the-karan-aujla-signature-marble-center-table',60000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_ab4ece70-734e-4fe4-84a6-6c522e8906c8.jpg?v=1772041091'],
            ['The Karan Aujla Signature Marble Console & Mirror Set','the-karan-aujla-signature-marble-console-mirror-set',75000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_1c70d083-6bb2-4110-b199-5958b6633df9.jpg?v=1772039981'],
            ['The Karan Aujla Signature Marble Top Dining Set','the-karan-aujla-signature-marble-top-dining-set',200000,'tables-consoles','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_42ff0aff-1f76-43f3-878a-3b084b03d917.jpg?v=1772039348'],
            ['The Karan Aujla Signature Carved Teak Sofa Set','the-karan-aujla-signature-carved-teak-sofa-set',250000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_d691ef90-9a50-4c57-89f5-9a0918ebbefa.jpg?v=1772038722'],
            ['Bespoke High-Back Crystal Tufted Accent Chair','bespoke-high-back-crystal-tufted-accent-chair',70000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_92512b89-dd1d-43d4-9779-79010539856b.png?v=1771752432'],
            ['Bespoke Designer-Inspired Fabric Chesterfield Sofa','bespoke-designer-inspired-fabric-chesterfield-sofa',250000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_81d40c83-8082-4c1e-96e3-fb54313632d8.png?v=1771745704'],
            ['Bespoke Antique Gold Carved Crocodile Leather Sofa','bespoke-antique-gold-carved-crocodile-leather-sofa',180000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_0e6e53c3-1a4f-4528-9655-a610caa77045.png?v=1771744367'],
            ['Bespoke Carved Teak Tufted Accent Armchair','bespoke-carved-teak-tufted-accent-armchair',35000,'chairs','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_b15e2cf1-8e1a-4aa8-965b-198f49e2ac12.png?v=1771752959'],
            ['Bespoke Classic Chesterfield Genuine Leather Sofa','bespoke-classic-chesterfield-genuine-leather-sofa',225000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_af9f73a5-a7c0-4781-a915-2bd8f4ea1552.png?v=1771739843'],
            ['Luxury Carved Teak Executive Chair','luxury-carved-teak-executive-boss-chair',65000,'office-furniture','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_405e5c79-3fe3-481b-b231-62ab4d99cb15.png?v=1771738321'],
            ['Bespoke Carved Teak Wood & Genuine Leather Sofa','bespoke-carved-teak-wood-genuine-leather-sofa',250000,'sofas','https://cdn.shopify.com/s/files/1/0973/7958/2323/files/rn-image_picker_lib_temp_96103115-d3b7-4136-b08d-a1b7e87a5051.png?v=1771669887'],
        ];

        foreach ($products as $index => [$name, $slug, $price, $category, $image]) {
            $product = Product::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'sku' => 'MSF-'.str_pad((string) ($index + 1), 3, '0', STR_PAD_LEFT),
                'brand_id' => $brand->id,
                'category_id' => $categories[$category]->id,
                'short_description' => 'A handcrafted MS Furniture design, customisable in material, colour, polish and dimensions.',
                'description' => 'Made by MS Furniture using selected materials and skilled craftsmanship. Contact our design team for configuration, upholstery, finish and made-to-measure options.',
                'specifications' => 'Custom sizes and finishes available. Final material and dimensions are confirmed before production.',
                'shipping_info' => 'Delivery timing and charges are confirmed according to product, location and customisation.',
                'price' => $price, 'stock' => 10, 'is_active' => true,
                'is_featured' => $index < 8, 'is_new_arrival' => $index < 8, 'is_best_seller' => in_array($index, [8, 15, 20], true),
                'available_colors' => ['Natural Teak', 'Walnut', 'Custom Finish'],
                'meta_title' => $name.' | MS Furniture',
                'meta_description' => 'Explore '.$name.' by MS Furniture. Custom materials, finishes and dimensions available from our Mohali showroom.',
            ]);
            ProductImage::updateOrCreate(['product_id' => $product->id, 'is_primary' => true], ['path' => $image, 'alt' => $name, 'sort_order' => 0]);
            ProductVariant::updateOrCreate(['sku' => $product->sku.'-STD'], ['product_id' => $product->id, 'color' => 'Custom finish', 'price' => $price, 'stock' => 10, 'is_active' => true]);
        }

        Product::whereIn('slug', ['bespoke-diamond-tufted-crocodile-leather-boss-chair', 'executive-boss-chair', 'sofa-main'])->update(['is_active' => false]);

        $settings = [
            'announcement' => 'Luxury & custom furniture · Visit our Mohali showroom',
            'footer_story' => 'Bespoke furniture made with premium woods, master-applied finishes and lasting comfort in Mohali, Punjab.',
            'footer_email' => 'hello@msfurnitureworld.com',
            'footer_phone' => '+91 98886 73566',
            'whatsapp_number' => '919779696006',
            'footer_address' => 'Shop No. 5 & 6, Sector 74-A, Mohali, Punjab 160055',
            'about_content' => 'MS Furniture creates luxury and custom furniture for homes, hotels and statement interiors from Mohali, Punjab.',
        ];
        foreach ($settings as $key => $value) {
            Setting::updateOrCreate(['key' => $key], ['group' => 'store', 'value' => $value, 'type' => 'text']);
        }

        Banner::updateOrCreate(['title' => 'Bespoke Furniture, Made for Your Space'], [
            'subtitle' => 'Premium woods, genuine leather and custom finishes crafted in Mohali.',
            'image' => 'https://4zgwrv-td.myshopify.com/cdn/shop/files/making-bespoke-furniture.png?width=2000',
            'link' => '/collections/all', 'button_text' => 'Explore all furniture', 'placement' => 'hero', 'is_active' => true, 'sort_order' => 1,
        ]);
    }
}
