@props(['product'])
@php
    $stored = $product->images->first()?->path;
    $image = \App\Support\StoreMedia::url($stored);
    $alternateStored = $product->images->skip(1)->first()?->path;
    $alternate = $alternateStored ? \App\Support\StoreMedia::url($alternateStored) : null;
@endphp
<article {{ $attributes->merge(['class' => 'group']) }}>
    <a href="{{ route('products.show', $product) }}" class="relative block aspect-[4/5] overflow-hidden bg-[#f3f3f3]">
        <img src="{{ $image }}" alt="{{ $product->name }}" class="w-full h-full object-cover transition duration-500 {{ $alternate ? 'group-hover:opacity-0' : 'group-hover:scale-[1.03]' }}" loading="lazy">
        @if($alternate)
            <img src="{{ $alternate }}" alt="" class="absolute inset-0 w-full h-full object-cover opacity-0 group-hover:opacity-100 transition duration-500" loading="lazy">
        @endif
        <span class="absolute top-3 left-3 flex flex-col items-start gap-1">
            @if($product->isOnSale())
                <span class="bg-[#ff4d6d] text-white text-[10px] font-bold uppercase tracking-wide px-2 py-1">Sale</span>
            @endif
            @if($product->is_new_arrival)
                <span class="bg-black text-white text-[10px] font-bold uppercase tracking-wide px-2 py-1">New</span>
            @endif
            @if($product->is_best_seller)
                <span class="bg-[#efe7ff] text-[#5b3cc4] text-[10px] font-bold uppercase tracking-wide px-2 py-1">Most wanted</span>
            @endif
        </span>
    </a>
    <div class="pt-3">
        <a href="{{ route('products.show', $product) }}" class="block text-[13px] font-semibold uppercase tracking-[.04em] leading-snug">{{ $product->name }}</a>
        <p class="mt-1 text-[13px]">
            @if($product->isOnSale())
                <span class="line-through text-black/35 mr-1">₹{{ number_format($product->compare_at_price, 0) }}</span>
            @endif
            <span class="font-semibold">₹{{ number_format($product->effectivePrice(), 0) }}</span>
        </p>
        @livewire('store.quick-add', ['productId' => $product->id], key('quick-add-'.$product->id))
    </div>
</article>
