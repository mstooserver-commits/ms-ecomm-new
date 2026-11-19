<div class="mx-auto max-w-[1200px] px-4 py-8 sm:px-5 lg:py-12" x-data="{ filters: false }">
    <div class="max-w-3xl">
        <h1 class="text-3xl font-semibold sm:text-5xl">{{ $sale ? 'Clearance' : ($currentCategory?->name ?? 'All products') }}</h1>
        <p class="mt-4 max-w-2xl text-[15px] leading-7 text-black/70">
            {{ $currentCategory?->description ?: 'Precise-fit cases, charging and matching accessories. '.$products->total().' pieces ready to ship across India.' }}
        </p>
    </div>

    <div class="mt-8 flex flex-wrap items-end justify-between gap-4 border-b border-black/10 pb-4">
        <p class="text-[12px] font-semibold uppercase tracking-[.14em]">Choose your piece</p>
        <div class="flex items-center gap-3">
            <label class="sr-only" for="shop-sort">Sort</label>
            <select id="shop-sort" wire:model.live="sort" class="border border-black/15 bg-transparent py-2 pl-3 pr-8 text-[12px] font-semibold uppercase tracking-[.08em]">
                <option value="featured">Featured</option>
                <option value="newest">Newest</option>
                <option value="popular">Most viewed</option>
                <option value="price_asc">Price: low to high</option>
                <option value="price_desc">Price: high to low</option>
            </select>
            <button type="button" @click="filters = true" class="border border-black px-4 py-2 text-[12px] font-semibold uppercase tracking-[.08em]">Filter</button>
        </div>
    </div>

    <div class="mt-4">
        <input wire:model.live.debounce.400ms="search" type="search" placeholder="Search" class="w-full border border-black/15 px-4 py-2.5 text-sm sm:max-w-xs">
    </div>

    @if($products->isEmpty())
        <div class="py-24 text-center">
            <p class="font-display mb-4 text-3xl">No pieces found</p>
            <button wire:click="clearFilters" class="btn-dark">Clear filters</button>
        </div>
    @else
        <div class="mt-8 grid grid-cols-2 gap-x-3 gap-y-9 md:grid-cols-3 lg:grid-cols-4">
            @foreach($products as $product)
                <x-product-card :product="$product" actions />
            @endforeach
        </div>
        <div class="mt-12">{{ $products->links() }}</div>
    @endif

    <div x-show="filters" x-cloak class="fixed inset-0 z-[75]" @keydown.escape.window="filters = false">
        <div class="absolute inset-0 bg-black/40" @click="filters = false"></div>
        <aside class="absolute inset-y-0 right-0 flex w-[min(100%,380px)] flex-col bg-white">
            <div class="flex h-[72px] items-center justify-between border-b border-black/10 px-5">
                <p class="text-[12px] font-semibold uppercase tracking-[.16em]">Filter</p>
                <button type="button" @click="filters = false" class="text-2xl leading-none" aria-label="Close filters">×</button>
            </div>
            <div class="flex-1 space-y-6 overflow-y-auto px-5 py-6">
                <div>
                    <p class="text-[12px] font-semibold uppercase tracking-[.14em]">Price</p>
                    <div class="mt-3 grid grid-cols-2 gap-3">
                        <input wire:model.live.debounce.400ms="min" type="number" min="0" placeholder="Min" class="border border-black/15 px-3 py-2 text-sm">
                        <input wire:model.live.debounce.400ms="max" type="number" min="0" placeholder="Max" class="border border-black/15 px-3 py-2 text-sm">
                    </div>
                </div>
                <label class="flex items-center gap-3 text-sm">
                    <input type="checkbox" wire:model.live="sale" class="accent-black">
                    On sale
                </label>
                <label class="flex items-center gap-3 text-sm">
                    <input type="checkbox" wire:model.live="stock" class="accent-black">
                    In stock
                </label>
                @if($collections->isNotEmpty())
                    <div>
                        <label for="collection-filter" class="text-[12px] font-semibold uppercase tracking-[.14em]">Collection</label>
                        <select id="collection-filter" wire:model.live="collection" class="mt-3 w-full border border-black/15 bg-white px-3 py-2.5 text-sm">
                            <option value="">All collections</option>
                            @foreach($collections as $item)
                                <option value="{{ $item->slug }}">{{ $item->name }}</option>
                            @endforeach
                        </select>
                    </div>
                @endif
                @if($devices->isNotEmpty())
                    <div>
                        <label for="device-filter" class="text-[12px] font-semibold uppercase tracking-[.14em]">Device model / size</label>
                        <select id="device-filter" wire:model.live="device" class="mt-3 w-full border border-black/15 bg-white px-3 py-2.5 text-sm">
                            <option value="">All models</option>
                            @foreach($devices as $item)
                                <option value="{{ $item }}">{{ $item }}</option>
                            @endforeach
                        </select>
                    </div>
                @endif
                @if($colors->isNotEmpty())
                    <div>
                        <p class="text-[12px] font-semibold uppercase tracking-[.14em]">Color</p>
                        <div class="mt-3 flex flex-wrap gap-2">
                            <button type="button" wire:click="$set('color', null)" class="border px-3 py-2 text-xs {{ $color ? 'border-black/15' : 'border-black bg-black text-white' }}">All</button>
                            @foreach($colors as $item)
                                <button type="button" wire:click="$set('color', '{{ $item }}')" class="border px-3 py-2 text-xs {{ $color === $item ? 'border-black bg-black text-white' : 'border-black/15' }}">{{ $item }}</button>
                            @endforeach
                        </div>
                    </div>
                @endif
                <div>
                    <p class="text-[12px] font-semibold uppercase tracking-[.14em]">Category</p>
                    <div class="mt-3 space-y-2 text-sm">
                        <button type="button" wire:click="$set('category', null)" class="block {{ $category ? '' : 'font-semibold' }}">All products</button>
                        @foreach($categories as $item)
                            <button type="button" wire:click="$set('category', '{{ $item->slug }}')" class="block {{ $category === $item->slug ? 'font-semibold' : '' }}">{{ $item->name }}</button>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="border-t border-black/10 p-5">
                <button type="button" wire:click="clearFilters" @click="filters = false" class="btn-light w-full">Clear filters</button>
            </div>
        </aside>
    </div>
</div>
