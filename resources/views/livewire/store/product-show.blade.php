<div class="mx-auto max-w-[1200px] px-4 py-6 pb-24 sm:px-5 lg:py-10 lg:pb-10" x-data="{ zoom: false }">
    <nav class="mb-6 text-[11px] uppercase tracking-[.12em] text-black/45">
        <a href="{{ route('home') }}">Home</a>
        <span class="mx-1.5">/</span>
        @if($product->category)
            <a href="{{ route('shop', ['category' => $product->category->slug]) }}">{{ $product->category->name }}</a>
            <span class="mx-1.5">/</span>
        @endif
        <span class="text-black">{{ $product->name }}</span>
    </nav>

    <div class="grid items-start gap-8 lg:grid-cols-[minmax(0,1fr)_380px] lg:gap-10">
        <div class="lg:col-start-1">
            @php $images = $product->images; $mainImage = $images[$selectedImage] ?? null; $src = $mainImage?->path; @endphp
            <button type="button" class="block aspect-square w-full overflow-hidden bg-[#f6f6f6]" @click="zoom = true">
                <img src="{{ \App\Support\StoreMedia::url($src) }}" alt="{{ $product->name }}" class="h-full w-full object-contain">
            </button>
            @if($images->count() > 1)
                <div class="mt-2 flex gap-2 overflow-x-auto">
                    @foreach($images as $i => $img)
                        <button type="button" wire:click="$set('selectedImage', {{ $i }})" class="h-16 w-16 shrink-0 overflow-hidden border bg-[#f6f6f6] {{ $selectedImage === $i ? 'border-black' : 'border-transparent' }}">
                            <img src="{{ \App\Support\StoreMedia::url($img->path) }}" class="h-full w-full object-cover" alt="">
                        </button>
                    @endforeach
                </div>
            @endif

        </div>

        <div class="lg:sticky lg:top-24 lg:col-start-2 lg:row-start-1 lg:row-span-2">
            @php
                $off = ($product->isOnSale() && $product->compare_at_price > 0)
                    ? (int) round((1 - ($product->effectivePrice() / $product->compare_at_price)) * 100)
                    : 0;
            @endphp
            <div class="mb-3 flex flex-wrap gap-2 text-[11px] font-bold uppercase">
                @if($product->is_best_seller)<span class="text-[#1f9d4a]">Best seller</span>@endif
                @if($off > 0)<span class="bg-[#ff4d6d] px-1.5 py-0.5 text-white">{{ $off }}% off</span>@endif
                @if($product->is_new_arrival)<span class="bg-black px-1.5 py-0.5 text-white">New</span>@endif
            </div>
            <h1 class="mb-2 text-[28px] font-semibold leading-tight">{{ $product->name }}</h1>
            <p class="mb-3 text-[13px]">
                <span class="text-[#1f9d4a]">★★★★★</span>
                <span class="text-black/50">{{ $product->rating_count ? $product->rating_count.' reviews' : 'No reviews yet' }}</span>
            </p>
            <p class="mb-4 text-[13px] text-black/50">{{ $product->category?->name }}</p>
            <p class="mb-5 text-[15px]">
                @if($product->isOnSale())
                    <span class="mr-2 text-black/40 line-through">₹{{ number_format($product->compare_at_price, 0) }}</span>
                    <span class="font-semibold text-[#e23b3b]">₹{{ number_format($product->effectivePrice(), 0) }}</span>
                @else
                    <span class="font-semibold">₹{{ number_format($product->effectivePrice(), 0) }}</span>
                @endif
            </p>

            <ul class="mb-5 space-y-1.5 text-[13px] text-black/75">
                <li>Free shipping to India for orders over ₹{{ number_format(config('shop.free_shipping_threshold'), 0) }}</li>
                <li>Phone cases, charging and matching accessories</li>
            </ul>

            @if($product->variants->isNotEmpty())
                <p class="mb-3 text-[12px] font-semibold uppercase tracking-[.14em]">Choose your finish</p>
                <div class="mb-5 grid gap-2">
                    @foreach($product->variants as $variant)
                        @php $label = trim(($variant->color ?: '').' '.($variant->size ?: '')) ?: 'Standard'; @endphp
                        <label class="flex cursor-pointer items-center justify-between border px-4 py-3 {{ (int) $variantId === $variant->id ? 'border-black' : 'border-black/15' }} {{ ! $variant->is_active || $variant->stock < 1 ? 'opacity-40' : '' }}">
                            <span class="flex items-center gap-3 text-sm font-semibold">
                                <input type="radio" class="accent-black" wire:model.live="variantId" value="{{ $variant->id }}" @disabled(! $variant->is_active || $variant->stock < 1)>
                                {{ $label }}
                            </span>
                            <span class="text-sm">₹{{ number_format($variant->price > 0 ? $variant->price : $product->effectivePrice(), 0) }}</span>
                        </label>
                    @endforeach
                </div>
                @error('variantId') <p class="mb-3 text-sm text-red-600">{{ $message }}</p> @enderror
            @endif

            <div class="mb-4 flex items-center gap-3">
                <div class="flex border border-black">
                    <button type="button" wire:click="decrementQuantity" class="px-4 py-3">−</button>
                    <span class="min-w-10 px-4 py-3 text-center">{{ $quantity }}</span>
                    <button type="button" wire:click="incrementQuantity" class="px-4 py-3">+</button>
                </div>
                <button type="button" wire:click="toggleWishlist" class="border-b border-black pb-0.5 text-[12px] font-semibold uppercase tracking-[.12em]">{{ $inWishlist ? 'Saved' : 'Save' }}</button>
            </div>
            @error('quantity') <p class="mb-3 text-sm text-red-600">{{ $message }}</p> @enderror

            <button type="button" wire:click="addToCart" wire:loading.attr="disabled" class="btn-dark mb-3 w-full">Add to cart — ₹{{ number_format($product->effectivePrice(), 0) }}</button>
            <button type="button" wire:click="buyNow" wire:loading.attr="disabled" class="btn-light mb-3 w-full">Buy now</button>
            @if($cartMessage)<p class="mb-3 text-sm">{{ $cartMessage }}</p>@endif

            @if($related->isNotEmpty())
                @php $extra = $related->first(); @endphp
                <div class="mt-6 border border-black/10 p-4">
                    <p class="mb-3 text-[12px] font-semibold uppercase tracking-[.16em]">Add accessories</p>
                    <div class="grid grid-cols-[88px_minmax(0,1fr)] gap-3">
                        <a href="{{ route('products.show', $extra) }}" class="block bg-[#f6f6f6]">
                            <img src="{{ \App\Support\StoreMedia::url($extra->images->first()?->path) }}" alt="{{ $extra->name }}" class="aspect-square w-full object-contain">
                        </a>
                        <div>
                            @if($extra->isOnSale())
                                <span class="mb-1 inline-block bg-black px-1.5 py-0.5 text-[10px] font-bold uppercase text-white">Save</span>
                            @endif
                            <a href="{{ route('products.show', $extra) }}" class="block text-sm font-semibold">{{ $extra->name }}</a>
                            <p class="text-[12px] text-black/50">{{ $extra->category?->name }}</p>
                            <p class="mt-1 text-sm">
                                @if($extra->isOnSale())
                                    <span class="mr-1 text-[#e23b3b]/70 line-through">₹{{ number_format($extra->compare_at_price, 0) }}</span>
                                    <span class="font-semibold text-[#e23b3b]">₹{{ number_format($extra->effectivePrice(), 0) }}</span>
                                @else
                                    <span class="font-semibold">₹{{ number_format($extra->effectivePrice(), 0) }}</span>
                                @endif
                            </p>
                            @if($extra->short_description)
                                <p class="mt-1 line-clamp-2 text-[12px] text-black/60">{{ $extra->short_description }}</p>
                            @endif
                            <div class="mt-2">
                                @livewire('store.quick-add', ['productId' => $extra->id, 'presentation' => 'plus'], key('upsell-'.$extra->id))
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            <div class="mt-6 border-t border-black/10">
                @if($product->description)
                    <details class="group border-b border-black/10 py-4" open>
                        <summary class="flex cursor-pointer list-none items-center justify-between text-[12px] font-semibold uppercase tracking-[.14em]">
                            <span>Description</span><span class="text-lg font-normal group-open:hidden">+</span><span class="hidden text-lg font-normal group-open:inline">−</span>
                        </summary>
                        <div class="mt-3 text-sm leading-7 text-black/70">{!! nl2br(e($product->description)) !!}</div>
                    </details>
                @endif
                <details class="group border-b border-black/10 py-4">
                    <summary class="flex cursor-pointer list-none items-center justify-between text-[12px] font-semibold uppercase tracking-[.14em]">
                        <span class="flex items-center gap-2">Reviews
                            @if($product->rating_count)
                                <span class="text-[#1f9d4a]">★★★★★</span>
                                <span class="font-medium normal-case tracking-normal text-black/50">{{ $product->rating_count }}</span>
                            @endif
                        </span>
                        <span class="text-lg font-normal group-open:hidden">+</span><span class="hidden text-lg font-normal group-open:inline">−</span>
                    </summary>
                    <div class="mt-3 space-y-3 text-sm text-black/70">
                        @forelse($product->reviews->where('is_approved', true) as $review)
                            <div>
                                <p class="font-semibold text-black">{{ $review->title ?: $review->user?->name }}</p>
                                <p>{{ $review->body }}</p>
                            </div>
                        @empty
                            <p>No reviews yet.</p>
                        @endforelse
                    </div>
                </details>
                <details class="group border-b border-black/10 py-4">
                    <summary class="flex cursor-pointer list-none items-center justify-between text-[12px] font-semibold uppercase tracking-[.14em]">
                        <span>Shipping</span><span class="text-lg font-normal group-open:hidden">+</span><span class="hidden text-lg font-normal group-open:inline">−</span>
                    </summary>
                    <div class="mt-3 text-sm leading-7 text-black/70">{{ $product->shipping_info ?: 'Delivery across India. Free shipping on orders over ₹'.number_format(config('shop.free_shipping_threshold'), 0).'.' }}</div>
                </details>
                @if($product->specifications)
                    <details class="group border-b border-black/10 py-4">
                        <summary class="flex cursor-pointer list-none items-center justify-between text-[12px] font-semibold uppercase tracking-[.14em]">
                            <span>Product details</span><span class="text-lg font-normal group-open:hidden">+</span><span class="hidden text-lg font-normal group-open:inline">−</span>
                        </summary>
                        <div class="mt-3 whitespace-pre-line text-sm leading-7 text-black/70">{{ $product->specifications }}</div>
                    </details>
                @endif
                <details class="group border-b border-black/10 py-4">
                    <summary class="flex cursor-pointer list-none items-center justify-between text-[12px] font-semibold uppercase tracking-[.14em]">
                        <span>Returns & warranty</span><span class="text-lg font-normal group-open:hidden">+</span><span class="hidden text-lg font-normal group-open:inline">−</span>
                    </summary>
                    <div class="mt-3 text-sm leading-7 text-black/70">Returns are accepted in line with our store policy. Items must be unused and returned with their original packaging. Contact support before sending an item back.</div>
                </details>
            </div>

            @if($product->category)
                <p class="mt-6 bg-[#f6f6f6] px-4 py-5 text-center text-sm">Designed for <span class="font-semibold">{{ $product->category->name }}</span></p>
            @endif

            <div class="mt-6 border-t border-black/10">
                @foreach([
                    ['Precise fit', 'Shaped for the device you already carry, without extra bulk.'],
                    ['Protection with style', 'A finish made to be seen, with coverage that stays slim.'],
                    ['Ships across India', 'Free delivery on orders over ₹'.number_format(config('shop.free_shipping_threshold'), 0).'.'],
                ] as [$title, $copy])
                    <div class="border-b border-black/10 py-4">
                        <p class="text-[12px] font-semibold uppercase tracking-[.14em]">{{ $title }}</p>
                        <p class="mt-2 text-sm leading-6 text-black/70">{{ $copy }}</p>
                    </div>
                @endforeach
            </div>
        </div>

        @if($related->isNotEmpty())
            <section class="lg:col-start-1">
                <h2 class="mb-5 text-center text-[13px] font-semibold uppercase tracking-[.18em]">Recommended for you</h2>
                <div class="grid grid-cols-2 gap-3">
                    @foreach($related as $p)
                        <x-commerce-card :product="$p" />
                    @endforeach
                </div>
            </section>
        @endif
    </div>

    @if($recent->isNotEmpty())
        <section class="mx-auto max-w-[1200px] px-4 pb-16 sm:px-5">
            <h2 class="mb-5 text-[13px] font-semibold uppercase tracking-[.18em]">Recently viewed</h2>
            <div class="grid grid-cols-2 gap-3 lg:grid-cols-4">
                @foreach($recent as $p)
                    <x-product-card :product="$p" />
                @endforeach
            </div>
        </section>
    @endif

    @if($faqs->isNotEmpty())
        <section class="mx-auto max-w-3xl border-t border-black/10 px-4 py-14 sm:px-6">
            <p class="eyebrow text-center">Questions, answered</p>
            <h2 class="mt-3 text-center text-3xl font-semibold">Frequently asked questions</h2>
            <div class="mt-8 border-t border-black/10">
                @foreach($faqs as $faq)
                    <details class="group border-b border-black/10 py-5">
                        <summary class="flex cursor-pointer list-none items-center justify-between gap-4 text-sm font-semibold">
                            <span>{{ $faq->question }}</span><span class="text-xl font-normal group-open:rotate-45">+</span>
                        </summary>
                        <p class="mt-3 pr-8 text-sm leading-7 text-black/65">{{ $faq->answer }}</p>
                    </details>
                @endforeach
            </div>
        </section>
    @endif

    <div class="fixed inset-x-0 bottom-0 z-40 border-t border-black/10 bg-white p-3 lg:hidden">
        <button type="button" wire:click="addToCart" class="btn-dark w-full">Add to cart — ₹{{ number_format($product->effectivePrice(), 0) }}</button>
    </div>

    <div x-show="zoom" x-cloak @keydown.escape.window="zoom = false" class="fixed inset-0 z-[80] flex items-center justify-center bg-black/90 p-6" @click.self="zoom = false">
        <button type="button" @click="zoom = false" class="absolute right-6 top-6 text-4xl text-white">×</button>
        <img src="{{ \App\Support\StoreMedia::url($src ?? null) }}" class="max-h-full max-w-full object-contain" alt="{{ $product->name }}">
    </div>
</div>
