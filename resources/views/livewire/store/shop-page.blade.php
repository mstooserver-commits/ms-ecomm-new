<div class="max-w-[1440px] mx-auto px-4 sm:px-6 lg:px-8 py-8 lg:py-10">
    <div class="mb-6">
        <h1 class="font-display text-3xl sm:text-5xl">{{ $category ? str_replace('-', ' ', $category) : 'All tech' }}</h1>
        <p class="mt-3 max-w-2xl text-sm text-black/60 leading-6">{{ $products->total() }} pieces. Phone cases, charging and matching accessories.</p>
    </div>

    <div class="flex flex-wrap items-center gap-2 pb-5 mb-6 border-b border-black/10">
        <button type="button" wire:click="$set('category', null)" class="px-3 py-2 text-[12px] uppercase tracking-[.08em] border {{ !$category ? 'bg-black text-white border-black' : 'border-black/15' }}">All</button>
        @foreach($categories as $cat)
            <button type="button" wire:click="$set('category', '{{ $cat->slug }}')" class="px-3 py-2 text-[12px] uppercase tracking-[.08em] border {{ $category === $cat->slug ? 'bg-black text-white border-black' : 'border-black/15' }}">{{ $cat->name }}</button>
        @endforeach
        <div class="ml-auto flex items-center gap-3">
            <select wire:model.live="sort" class="bg-transparent border border-black/15 py-2 pl-3 pr-8 text-[12px] uppercase tracking-[.08em]">
                <option value="newest">Newest</option>
                <option value="popular">Most viewed</option>
            </select>
        </div>
    </div>

    <div class="mb-6">
        <input wire:model.live.debounce.400ms="search" type="search" placeholder="Search" class="w-full sm:max-w-xs border border-black/15 px-4 py-2.5 text-sm">
    </div>

    @if($products->isEmpty())
        <div class="text-center py-24">
            <p class="font-display text-3xl mb-4">No pieces found</p>
            <button wire:click="clearFilters" class="btn-dark">Clear filters</button>
        </div>
    @else
        <div class="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-x-3 gap-y-10">
            @foreach($products as $product)
                <x-product-card :product="$product" />
            @endforeach
        </div>
        <div class="mt-12">{{ $products->links() }}</div>
    @endif
</div>
