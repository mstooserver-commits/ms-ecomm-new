<?php

namespace App\Livewire\Store;

use App\Models\Product;
use App\Services\CartService;
use Livewire\Component;

class QuickAdd extends Component
{
    public int $productId;

    public string $presentation = 'pair';

    public ?string $notice = null;

    public function addToCart(CartService $cart): void
    {
        $product = $this->product();
        $variant = $this->variant($product);

        if (! $this->available($product, $variant)) {
            $this->notice = 'Out of stock';

            return;
        }

        $cart->add($product, $variant, 1);
        $this->notice = 'Added';
        $this->dispatch('cart-updated');
        $this->dispatch('open-cart');
    }

    public function buyNow(CartService $cart): void
    {
        $this->addToCart($cart);

        if ($this->notice === 'Out of stock') {
            return;
        }

        $this->redirect(route('checkout'), navigate: true);
    }

    private function product(): Product
    {
        return Product::with('variants')->findOrFail($this->productId);
    }

    private function variant(Product $product)
    {
        return $product->variants->first(fn ($variant) => $variant->is_active && $variant->stock > 0);
    }

    private function available(Product $product, $variant): bool
    {
        if ($variant) {
            return $variant->is_active && $variant->stock > 0;
        }

        return $product->stock > 0;
    }

    public function render()
    {
        return view('livewire.store.quick-add');
    }
}
