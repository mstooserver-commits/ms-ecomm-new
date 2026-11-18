@props(['product'])
@php
    $image = \App\Support\StoreMedia::url($product->images->first()?->path);
    $variant = $product->variants->first(fn ($item) => $item->is_active && $item->stock > 0) ?? $product->variants->first();
    $label = $variant ? (trim(($variant->color ?: '').' '.($variant->size ?: '')) ?: 'Standard') : 'Standard';
@endphp
<article {{ $attributes->merge(['class' => 'flex flex-col border border-black/15 bg-white p-4 sm:p-5']) }}>
    <a href="{{ route('products.show', $product) }}" class="mb-4 block aspect-square bg-white">
        <img src="{{ $image }}" alt="{{ $product->name }}" class="h-full w-full object-contain" loading="lazy">
    </a>
    <a href="{{ route('products.show', $product) }}" class="text-[15px] font-semibold leading-snug">{{ $product->name }}</a>
    <p class="mt-0.5 text-[12px] text-black/45">{{ $product->category?->name }}</p>
    <p class="mt-2 text-[14px]">
        @if($product->isOnSale())
            <span class="mr-1 text-[#e23b3b]/70 line-through">₹{{ number_format($product->compare_at_price, 0) }}</span>
            <span class="font-semibold text-[#e23b3b]">₹{{ number_format($product->effectivePrice(), 0) }}</span>
        @else
            <span class="font-semibold">₹{{ number_format($product->effectivePrice(), 0) }}</span>
        @endif
    </p>
    <div class="mt-3 rounded-full border border-black/20 px-4 py-2.5 text-[12px] text-black/70">{{ $label }}</div>
    <div class="mt-3">
        @livewire('store.quick-add', ['productId' => $product->id, 'presentation' => 'outline'], key('commerce-'.$product->id))
    </div>
</article>
