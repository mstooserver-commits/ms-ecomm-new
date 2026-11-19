@props(['product', 'actions' => false])
@php
    $image = \App\Support\StoreMedia::url($product->images->first()?->path);
    $off = ($product->isOnSale() && $product->compare_at_price > 0)
        ? (int) round((1 - ($product->effectivePrice() / $product->compare_at_price)) * 100)
        : 0;
@endphp
<article {{ $attributes->merge(['class' => 'group']) }}>
    <div class="relative">
        <a href="{{ route('products.show', $product) }}" class="relative block aspect-[4/5] overflow-hidden rounded-[3px] bg-[#f4f4f4]">
            <img src="{{ $image }}" alt="{{ $product->name }}" class="h-full w-full object-cover transition duration-500 group-hover:scale-[1.035]" loading="lazy">
            <span class="absolute left-3 top-3 flex flex-col items-start gap-1 text-[10px] font-bold uppercase">
            @if($product->is_best_seller)
                <span class="text-[#1f9d4a]">Best seller</span>
            @endif
            @if($off > 0)
                <span class="rounded-sm bg-[#ecff75] px-2 py-1 text-black">{{ $off }}% off</span>
            @elseif($product->is_new_arrival)
                <span class="bg-black px-1.5 py-0.5 text-white">New</span>
            @endif
            </span>
        </a>
        @if($actions)
            <button type="button" wire:click="toggleWishlist({{ $product->id }})" aria-label="Save {{ $product->name }}" class="absolute right-2 top-2 grid h-8 w-8 place-items-center bg-white/90">
                <svg class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M12 20s-7-4.4-7-9a4 4 0 0 1 7-2 4 4 0 0 1 7 2c0 4.6-7 9-7 9Z"/></svg>
            </button>
        @endif
    </div>
    <div class="pt-3">
        <a href="{{ route('products.show', $product) }}" class="block text-[13px] font-semibold leading-snug">{{ $product->name }}</a>
        @if($product->category)
            <p class="mt-0.5 text-[12px] text-black/45">{{ $product->category->name }}</p>
        @endif
        <p class="mt-1 text-[13px]">
            @if($product->isOnSale())
                <span class="mr-1 text-[12px] text-black/40 line-through">₹{{ number_format($product->compare_at_price, 0) }}</span>
                <span class="font-semibold text-[#e23b3b]">₹{{ number_format($product->effectivePrice(), 0) }}</span>
            @else
                <span class="font-semibold">₹{{ number_format($product->effectivePrice(), 0) }}</span>
            @endif
        </p>
        @if($actions)
            <div class="mt-3">
                @livewire('store.quick-add', ['productId' => $product->id, 'presentation' => 'outline'], key('card-add-'.$product->id))
            </div>
        @endif
    </div>
</article>
