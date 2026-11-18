<?php

namespace App\Providers;

use App\Models\Category;
use App\Models\Setting;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer(['layouts.store', 'livewire.store.home-page'], function ($view) {
            $defaults = [
                'announcement' => 'Luxury & custom furniture · Visit our Mohali showroom',
                'footer_story' => 'Bespoke furniture made with premium woods, master-applied finishes and lasting comfort in Mohali, Punjab.',
                'footer_email' => 'hello@msfurnitureworld.com',
                'footer_phone' => '+91 98886 73566',
                'whatsapp_number' => '919779696006',
                'footer_address' => 'Shop No. 5 & 6, Sector 74-A, Mohali, Punjab 160055',
                'instagram_url' => '#',
                'facebook_url' => '#',
                'pinterest_url' => '#',
            ];

            if (Schema::hasTable('settings')) {
                foreach ($defaults as $key => $default) {
                    $defaults[$key] = Setting::valueFor($key, $default);
                }
            }

            $categories = Schema::hasTable('categories')
                ? Category::active()->orderBy('sort_order')->orderBy('name')->get()
                : collect();

            $view->with('storeSettings', $defaults);
            $view->with('navCategories', $categories);
        });
    }
}
