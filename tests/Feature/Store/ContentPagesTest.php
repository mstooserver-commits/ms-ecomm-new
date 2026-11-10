<?php

namespace Tests\Feature\Store;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ContentPagesTest extends TestCase
{
    use RefreshDatabase;

    public function test_materials_page_and_shopify_compatible_url_are_available(): void
    {
        $this->get('/materials')->assertOk()->assertSee('Our premium woods');
        $this->get('/pages/view-materials')->assertOk()->assertSee('Luxury cushioning');
    }

    public function test_all_products_shopify_compatible_url_is_available(): void
    {
        $this->get('/collections/all')->assertOk()->assertSee('Furniture for living well');
    }

    public function test_contact_page_contains_the_showroom_details(): void
    {
        $this->get('/contact')
            ->assertOk()
            ->assertSee('Sector 74-A')
            ->assertSee('+91 98886 73566');
    }

    public function test_homepage_contains_category_and_craftsmanship_sections(): void
    {
        $this->get('/')
            ->assertOk()
            ->assertSee('Furniture by category')
            ->assertSee('Luxury Sofa')
            ->assertSee('Materials')
            ->assertSee('craftsmanship')
            ->assertSee('Our Projects');
    }
}
