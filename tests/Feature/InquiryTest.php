<?php

namespace Tests\Feature;

use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class InquiryTest extends TestCase
{
    use RefreshDatabase;

    public function test_a_visitor_can_submit_a_product_inquiry(): void
    {
        $product = Product::create([
            'name' => 'Custom Sofa', 'slug' => 'custom-sofa', 'sku' => 'SOFA-1',
            'price' => 0, 'stock' => 0, 'is_active' => true,
        ]);

        $response = $this->post(route('inquiries.store'), [
            'type' => 'product', 'product_id' => $product->id,
            'name' => 'A Customer', 'phone' => '9999999999', 'city' => 'Mumbai',
            'message' => 'Please share available fabrics.',
        ]);

        $response->assertSessionHasNoErrors()->assertSessionHas('success');
        $this->assertDatabaseHas('inquiries', [
            'product_id' => $product->id, 'type' => 'product', 'phone' => '9999999999',
        ]);
    }
}
