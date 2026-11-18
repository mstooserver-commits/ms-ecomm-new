<div>
    <div x-show="$wire.open" x-cloak class="fixed inset-0 z-[80]" @keydown.escape.window="$wire.close()">
        <div class="absolute inset-0 bg-black/40" @click="$wire.close()"></div>
        <aside class="absolute inset-y-0 right-0 w-[min(100%,420px)] bg-white flex flex-col shadow-xl">
            <div class="h-[72px] px-5 flex items-center justify-between border-b border-black/10">
                <p class="text-[12px] font-semibold uppercase tracking-[.16em]">Your cart</p>
                <button type="button" wire:click="close" class="text-2xl leading-none" aria-label="Close cart">×</button>
            </div>

            <div class="flex-1 overflow-y-auto px-5 py-5">
                @if($cart->items->isEmpty())
                    <p class="text-sm text-black/60">Your cart is empty.</p>
                    <a href="{{ route('shop') }}" wire:navigate class="btn-dark mt-6">Shop now</a>
                @else
                    <div class="space-y-5">
                        @foreach($cart->items as $item)
                            @php $img = $item->product->images->first(); @endphp
                            <div class="flex gap-4" wire:key="drawer-{{ $item->id }}">
                                <a href="{{ route('products.show', $item->product) }}" class="w-20 h-24 bg-[#f3f3f3] shrink-0 overflow-hidden">
                                    <img src="{{ \App\Support\StoreMedia::url($img?->path) }}" alt="" class="w-full h-full object-cover">
                                </a>
                                <div class="flex-1 min-w-0">
                                    <a href="{{ route('products.show', $item->product) }}" class="text-[13px] font-semibold uppercase tracking-wide">{{ $item->product->name }}</a>
                                    @if($item->variant)<p class="text-[11px] text-black/50 mt-1">{{ trim(($item->variant->color ?? '').' '.($item->variant->size ?? '')) }}</p>@endif
                                    <p class="text-sm mt-1">₹{{ number_format($item->unit_price, 0) }}</p>
                                    <div class="flex items-center gap-3 mt-2">
                                        <div class="flex border border-black text-sm">
                                            <button type="button" wire:click="updateQty({{ $item->id }}, {{ $item->quantity - 1 }})" class="px-2.5 py-1">−</button>
                                            <span class="px-2.5 py-1">{{ $item->quantity }}</span>
                                            <button type="button" wire:click="updateQty({{ $item->id }}, {{ $item->quantity + 1 }})" class="px-2.5 py-1">+</button>
                                        </div>
                                        <button type="button" wire:click="remove({{ $item->id }})" class="text-[11px] uppercase tracking-[.1em] text-black/50">Remove</button>
                                    </div>
                                </div>
                                <p class="text-sm font-semibold">₹{{ number_format($item->lineTotal(), 0) }}</p>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>

            @if($cart->items->isNotEmpty())
                <div class="border-t border-black/10 px-5 py-5 space-y-3">
                    <div class="flex justify-between text-sm"><span>Subtotal</span><span>₹{{ number_format($subtotal, 0) }}</span></div>
                    @if($discount > 0)<div class="flex justify-between text-sm"><span>Discount</span><span>−₹{{ number_format($discount, 0) }}</span></div>@endif
                    <div class="flex justify-between text-sm"><span>Tax</span><span>₹{{ number_format($tax, 0) }}</span></div>
                    <div class="flex justify-between text-sm"><span>Shipping</span><span>{{ $shipping > 0 ? '₹'.number_format($shipping, 0) : 'Free' }}</span></div>
                    <div class="flex justify-between text-base font-semibold pt-2 border-t border-black/10"><span>Total</span><span>₹{{ number_format($total, 0) }}</span></div>
                    <a href="{{ route('cart') }}" wire:navigate class="btn-light w-full">View cart</a>
                    <a href="{{ route('checkout') }}" wire:navigate class="btn-dark w-full">Checkout</a>
                </div>
            @endif
        </aside>
    </div>
</div>
