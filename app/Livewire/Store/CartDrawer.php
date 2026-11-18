<?php

namespace App\Livewire\Store;

use App\Services\CartService;
use Livewire\Attributes\On;
use Livewire\Component;

class CartDrawer extends Component
{
    public bool $open = false;

    #[On('open-cart')]
    public function show(): void
    {
        $this->open = true;
    }

    #[On('cart-updated')]
    public function refreshCart(): void
    {
        // Re-render so the drawer and totals stay current.
    }

    public function close(): void
    {
        $this->open = false;
    }

    public function updateQty(int $itemId, int $qty, CartService $cart): void
    {
        $item = $cart->getCart()->items()->with(['product', 'variant'])->findOrFail($itemId);
        $available = $item->variant ? $item->variant->stock : $item->product->stock;

        if ($qty > $available) {
            return;
        }

        $cart->updateQuantity($item, $qty);
        $this->dispatch('cart-updated');
    }

    public function remove(int $itemId, CartService $cart): void
    {
        $item = $cart->getCart()->items()->findOrFail($itemId);
        $cart->remove($item);
        $this->dispatch('cart-updated');
    }

    public function render(CartService $cartService)
    {
        $cart = $cartService->getCart()->load(['items.product.images', 'items.variant']);
        $subtotal = $cart->subtotal();
        $discount = $cartService->calculateDiscount($cart, $subtotal);
        $tax = round(max(0, $subtotal - $discount) * ((float) config('shop.tax_rate') / 100), 2);
        $shipping = $subtotal >= (float) config('shop.free_shipping_threshold') ? 0 : (float) config('shop.shipping_fee');

        return view('livewire.store.cart-drawer', [
            'cart' => $cart,
            'subtotal' => $subtotal,
            'discount' => $discount,
            'tax' => $tax,
            'shipping' => $shipping,
            'total' => max(0, $subtotal - $discount + $tax + $shipping),
        ]);
    }
}
