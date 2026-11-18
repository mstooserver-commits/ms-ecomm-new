<div class="mx-auto max-w-[1440px] px-4 py-6 sm:px-6 lg:px-8 lg:py-10" x-data="{ zoom: false }">
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
            <div class="mb-3 flex flex-wrap gap-1.5">
                @if($product->isOnSale())<span class="bg-[#ffe14a] px-2 py-1 text-[10px] font-bold uppercase">Sale</span>@endif
                @if($product->is_new_arrival)<span class="bg-black px-2 py-1 text-[10px] font-bold uppercase text-white">New</span>@endif
            </div>
            <h1 class="mb-2 text-[28px] font-semibold leading-tight">{{ $product->name }}</h1>
            <p class="mb-4 text-[13px] text-black/50">{{ $product->category?->name }}</p>
            <p class="mb-5 text-lg">
                @if($product->isOnSale())
                    <span class="mr-2 font-normal text-[#e23b3b]/70 line-through">₹{{ number_format($product->compare_at_price, 0) }}</span>
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
                <label class="mb-4 block">
                    <span class="sr-only">Finish</span>
                    <select wire:model.live="variantId" class="w-full rounded-full border border-black/20 bg-white px-4 py-3 text-sm">
                        @foreach($product->variants as $variant)
                            <option value="{{ $variant->id }}" @disabled(! $variant->is_active || $variant->stock < 1)>
                                {{ trim(($variant->color ?: '').' '.($variant->size ?: '')) ?: 'Standard' }}
                            </option>
                        @endforeach
                    </select>
                </label>
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

            <div class="mb-3 grid gap-3 sm:grid-cols-2">
                <button type="button" wire:click="addToCart" wire:loading.attr="disabled" class="btn-dark w-full">Add to cart</button>
                <button type="button" wire:click="buyNow" wire:loading.attr="disabled" class="btn-light w-full">Buy now</button>
            </div>
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
            </div>

            @if($product->category)
                <p class="mt-6 bg-[#f6f6f6] px-4 py-5 text-center text-sm">Designed for <span class="font-semibold">{{ $product->category->name }}</span></p>
            @endif
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

    <div x-show="zoom" x-cloak @keydown.escape.window="zoom = false" class="fixed inset-0 z-[80] flex items-center justify-center bg-black/90 p-6" @click.self="zoom = false">
        <button type="button" @click="zoom = false" class="absolute right-6 top-6 text-4xl text-white">×</button>
        <img src="{{ \App\Support\StoreMedia::url($src ?? null) }}" class="max-h-full max-w-full object-contain" alt="{{ $product->name }}">
    </div>
</div>
