<div>
@php
    $bubbles = $categories->map(fn ($category) => [
        $category->name,
        $category->slug,
        \App\Support\StoreMedia::url($category->image),
    ])->all();

    $mosaic = [
        ['Phone Cases', 'phone-cases', asset('images/tech/phone-case.jpg'), true],
        ['Magnetic Power Banks', 'charging', asset('images/tech/power-bank.jpg'), true],
        ['Earbuds Cases', 'earbuds-cases', asset('images/tech/earbuds-case.jpg'), false],
        ['Ring Holders', 'ring-holders', asset('images/tech/ring-holder.jpg'), true],
        ['Watch Bands', 'watch-bands', asset('images/tech/watch-band.jpg'), false],
        ['Laptop Protection', 'laptop-protection', asset('images/tech/laptop-sleeve.jpg'), false],
        ['Tablet Cases', 'tablet-cases', asset('images/tech/tablet-case.jpg'), true],
        ['Screen Guards', 'screen-guards', asset('images/tech/tempered-glass.jpg'), true],
        ['Cables', 'cables', asset('images/tech/braided-cable.jpg'), false],
        ['Shop All Tech', null, asset('images/tech/hero-tech.jpg'), false],
    ];

    $heroSlides = $banners->map(fn ($banner) => [
        'title' => $banner->title,
        'subtitle' => $banner->subtitle,
        'image' => \App\Support\StoreMedia::url($banner->image),
        'link' => $banner->link ?: route('shop'),
        'button' => $banner->button_text ?: 'Shop now',
    ])->values();

    if ($heroSlides->isEmpty()) {
        $heroSlides = collect([
            ['title' => "Everyday tech,\ndressed up", 'subtitle' => 'Phone cases, charging and accessories made to be seen.', 'image' => asset('images/tech/hero-tech.jpg'), 'link' => route('shop'), 'button' => 'Shop now'],
        ]);
    }

    $quote = $testimonials->first();
    $featuredProducts = $bestSellers->isNotEmpty() ? $bestSellers : ($trending->isNotEmpty() ? $trending : $newArrivals);
    $featuredCategories = $categories->isNotEmpty() ? $categories : collect();
@endphp

<section class="relative w-full overflow-hidden"
    x-data="{ active: 0, total: {{ $heroSlides->count() }} }"
    @if($heroSlides->count() > 1) x-init="setInterval(() => active = (active + 1) % total, 5500)" @endif>
    @foreach($heroSlides as $index => $slide)
        @php
            $count = $heroSlides->count();
            $second = $count > 1 ? $heroSlides[($index + 1) % $count]['image'] : null;
            $third = $count > 2 ? $heroSlides[($index + 2) % $count]['image'] : null;
        @endphp
        <div x-show="active === {{ $index }}" @if($index > 0) x-cloak @endif class="relative min-h-[500px] overflow-hidden bg-[#27201d] sm:min-h-[620px] lg:min-h-[690px]">
            <img src="{{ $slide['image'] }}" alt="{{ $slide['title'] }}" class="absolute inset-0 h-full w-full object-cover">
            <span class="absolute inset-0 bg-gradient-to-r from-black/55 via-black/15 to-transparent"></span>
            <div class="absolute inset-0 mx-auto flex w-full max-w-[1240px] flex-col items-start justify-center px-7 text-left text-white sm:px-12 lg:px-16">
                <p class="text-[11px] font-semibold uppercase tracking-[.28em] sm:text-xs">The Zorrusso edit</p>
                <h1 class="mt-4 max-w-[620px] text-4xl font-semibold uppercase leading-[.92] tracking-[-.03em] sm:text-6xl lg:text-7xl">{!! nl2br(e($slide['title'])) !!}</h1>
                @if($slide['subtitle'])<p class="mt-5 max-w-lg text-base leading-7 text-white/90 sm:text-lg">{{ $slide['subtitle'] }}</p>@endif
                <a href="{{ $slide['link'] }}" class="mt-7 inline-flex rounded-sm bg-white px-8 py-4 text-sm font-bold uppercase tracking-[.08em] text-black hover:bg-[#eaff78]">{{ $slide['button'] }}</a>
            </div>
        </div>
    @endforeach
    @if($heroSlides->count() > 1)
        <div class="absolute inset-x-0 bottom-6 z-10 flex justify-center gap-2">
            @foreach($heroSlides as $index => $slide)
                <button type="button" @click="active = {{ $index }}" class="h-0.5 bg-white transition-all" :class="active === {{ $index }} ? 'w-10' : 'w-7 opacity-45'" aria-label="Slide {{ $index + 1 }}"></button>
            @endforeach
        </div>
    @endif
</section>

<div class="bg-[#111] px-4 py-4 text-center text-[11px] text-white sm:text-[12px]">
    <span class="font-semibold text-[#eaff78]">New season offer: save up to 35%</span>
    <span class="mx-3 text-white/40">|</span>
    <span>Free delivery on qualifying orders</span>
</div>

<div class="border-b border-black/5 bg-[#f7f7f7]">
    <div class="mx-auto flex max-w-[1240px] gap-4 overflow-x-auto hide-scrollbar px-4 py-4 sm:px-6">
        @foreach($bubbles as [$name, $category, $image])
            <a href="{{ route('shop', ['category' => $category]) }}" class="w-[94px] shrink-0 text-center sm:w-[108px]">
                <span class="mx-auto mb-2 grid h-14 w-14 place-items-center overflow-hidden rounded-full bg-white sm:h-16 sm:w-16">
                    <img src="{{ $image }}" alt="{{ $name }}" class="h-full w-full object-cover transition duration-300 hover:scale-105" loading="lazy">
                </span>
                <span class="block text-[10px] font-semibold uppercase leading-3 tracking-[-.01em]">{{ $name }}</span>
            </a>
        @endforeach
    </div>
</div>

<section class="mx-auto max-w-3xl px-6 py-9 text-center">
    <blockquote class="text-[15px] font-medium leading-relaxed sm:text-lg">“{{ $quote->content ?? 'A finish you actually want people to see.' }}”</blockquote>
    <p class="mt-3 text-[13px] tracking-[.2em] text-[#1f9d4a]">★★★★★</p>
    @if($quote)
        <p class="mt-2 text-[12px] uppercase tracking-[.14em] text-black/50">{{ $quote->name }}@if($quote->role) · {{ $quote->role }}@endif</p>
    @endif
</section>

<section class="mx-auto max-w-[1200px] px-3 pb-3 sm:px-5">
    <a href="{{ route('shop') }}" class="group relative block min-h-[280px] overflow-hidden rounded-[4px] bg-[#1a1714] sm:min-h-[360px]">
        <img src="{{ asset('images/tech/hero-tech.jpg') }}" alt="" class="absolute inset-0 h-full w-full object-cover opacity-80 transition duration-700 group-hover:scale-105">
        <span class="absolute inset-0 bg-black/35"></span>
        <span class="relative flex min-h-[280px] flex-col items-center justify-center px-6 text-center text-white sm:min-h-[360px]">
            <span class="text-[11px] font-semibold uppercase tracking-[.28em]">The new edit</span>
            <span class="font-display mt-3 text-4xl sm:text-6xl">Everyday tech</span>
            <span class="mt-6 bg-[#f3ead7] px-6 py-3 text-[12px] font-semibold uppercase tracking-[.16em] text-black">Shop now</span>
        </span>
    </a>
</section>

<section class="mx-auto max-w-[1200px] px-3 pb-8 sm:px-5">
    <ul class="grid grid-cols-2 gap-2 sm:grid-cols-4">
        @foreach($mosaic as [$name, $category, $image, $sale])
            <li class="{{ $loop->index < 2 ? 'sm:col-span-2' : '' }}">
                <a href="{{ $category ? route('shop', ['category' => $category]) : route('shop') }}" class="group relative block min-h-[250px] overflow-hidden rounded-[4px] {{ $loop->index < 2 ? 'sm:min-h-[420px]' : 'sm:min-h-[390px]' }}">
                    <img src="{{ $image }}" alt="{{ $name }}" class="absolute inset-0 h-full w-full object-cover transition duration-700 group-hover:scale-105" loading="lazy">
                    <span class="absolute inset-0 bg-black/25"></span>
                    @if($sale)
                        <span class="absolute left-2 top-2 rounded-sm bg-[#ecff75] px-3 py-2 text-[9px] font-bold uppercase text-black">Up to 35% off</span>
                    @endif
                    <span class="absolute inset-0 flex flex-col items-center justify-center px-4 text-center text-white">
                        <span class="mb-3 text-[13px] font-bold uppercase tracking-[.14em] sm:text-base">{{ $name }}</span>
                        <span class="border border-white px-4 py-2 text-[10px] font-semibold uppercase tracking-[.08em] text-white">View all</span>
                    </span>
                </a>
            </li>
        @endforeach
    </ul>
</section>

{{-- <section class="bg-[#f3f3f3] px-4 py-14">
    <div class="mx-auto max-w-3xl text-center">
        <p class="mb-4 text-[13px] font-semibold uppercase tracking-[.18em]">Want first look at the next drop?</p>
        @livewire('store.newsletter-signup', ['tone' => 'green'])
    </div>
</section> --}}

@if($featuredCategories->isNotEmpty())
<section class="mx-auto max-w-[1200px] px-5 py-14 lg:px-8">
    <h2 class="text-[13px] font-semibold uppercase tracking-[.18em]">Featured</h2>
    <p class="mt-1 text-sm text-black/55">Shop the latest favourites</p>
    <ul class="mt-8 flex gap-4 overflow-x-auto hide-scrollbar pb-2">
        @foreach($featuredCategories as $category)
            <li class="w-[150px] shrink-0 sm:w-[170px]">
                <a href="{{ route('shop', ['category' => $category->slug]) }}" class="block text-center">
                    <span class="mb-3 grid aspect-[3/4] place-items-center bg-white">
                        <img src="{{ \App\Support\StoreMedia::url($category->image) }}" alt="{{ $category->name }}" class="h-[82%] w-[82%] object-contain" loading="lazy">
                    </span>
                    <span class="block text-[11px] font-semibold uppercase tracking-[.06em]">{{ $category->name }}</span>
                </a>
            </li>
        @endforeach
    </ul>
</section>
@endif

@if($collections->isNotEmpty())
<section class="mx-auto max-w-[1440px] px-4 pb-16 sm:px-6">
    <div class="mb-7 flex items-end justify-between gap-4">
        <div>
            <p class="eyebrow">Curated edits</p>
            <h2 class="mt-2 text-3xl font-semibold sm:text-4xl">Shop the collections</h2>
        </div>
        <a href="{{ route('shop') }}" class="hidden border-b border-black text-xs font-semibold uppercase tracking-[.12em] sm:block">View all</a>
    </div>
    <div class="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        @foreach($collections as $collection)
            <a href="{{ route('collections.show', $collection) }}" class="group relative aspect-[4/5] overflow-hidden bg-[#f4f4f4]">
                <img src="{{ \App\Support\StoreMedia::url($collection->image) }}" alt="{{ $collection->name }}" class="h-full w-full object-cover transition duration-700 group-hover:scale-105" loading="lazy">
                <span class="absolute inset-0 bg-gradient-to-t from-black/55 via-transparent to-transparent"></span>
                <span class="absolute inset-x-0 bottom-0 p-5 text-white">
                    <span class="block text-lg font-semibold">{{ $collection->name }}</span>
                    @if($collection->description)<span class="mt-1 line-clamp-2 block text-sm text-white/80">{{ $collection->description }}</span>@endif
                </span>
            </a>
        @endforeach
    </div>
</section>
@endif

@foreach([['Trending', $trending], ['New arrivals', $newArrivals], ['Best sellers', $bestSellers]] as [$label, $list])
    @if($list->isNotEmpty())
        <section class="mx-auto max-w-[1440px] px-4 pb-14 sm:px-6">
            <h2 class="mb-6 text-[13px] font-semibold uppercase tracking-[.18em]">{{ $label }}</h2>
            <div class="grid grid-cols-2 gap-3 lg:grid-cols-4">
                @foreach($list->take(4) as $product)
                    <x-commerce-card :product="$product" />
                @endforeach
            </div>
        </section>
    @endif
@endforeach

@if($featuredProducts->isNotEmpty())
<section class="mx-auto max-w-[1440px] px-4 pb-16 sm:px-6">
    <h2 class="mb-6 text-[13px] font-semibold uppercase tracking-[.18em]">Recommended for you</h2>
    <div class="grid grid-cols-2 gap-3 lg:grid-cols-4">
        @foreach($featuredProducts->take(4) as $product)
            <x-commerce-card :product="$product" />
        @endforeach
    </div>
</section>
@endif

@if($testimonials->isNotEmpty())
<section class="bg-[#111] px-4 py-16 text-white sm:px-6">
    <div class="mx-auto max-w-[1200px]">
        <p class="eyebrow text-center text-white/60">Loved in the everyday</p>
        <h2 class="mt-3 text-center text-3xl font-semibold sm:text-4xl">What customers carry with them</h2>
        <div class="mt-9 grid gap-px bg-white/15 md:grid-cols-3">
            @foreach($testimonials->take(3) as $testimonial)
                <figure class="bg-[#111] p-7 sm:p-9">
                    <div class="text-sm tracking-[.18em] text-[#84FC10]">{{ str_repeat('★', $testimonial->rating) }}</div>
                    <blockquote class="mt-5 text-lg leading-8">“{{ $testimonial->content }}”</blockquote>
                    <figcaption class="mt-6 text-xs uppercase tracking-[.14em] text-white/55">{{ $testimonial->name }}@if($testimonial->role) · {{ $testimonial->role }}@endif</figcaption>
                </figure>
            @endforeach
        </div>
    </div>
</section>
@endif

@include('partials.trust-row')

@if($instagram->isNotEmpty())
<section class="bg-white px-3 py-12 sm:px-4">
    <div class="mb-7 text-center">
        <p class="eyebrow">Follow the edit</p>
        <h2 class="mt-2 text-3xl font-semibold">@zorrusso</h2>
    </div>
    <div class="grid grid-cols-2 gap-2 sm:grid-cols-4 lg:grid-cols-8">
        @foreach($instagram as $post)
            <a href="{{ $post->link ?: $storeSettings['instagram_url'] }}" target="_blank" rel="noopener" class="group aspect-square overflow-hidden bg-[#f4f4f4]">
                <img src="{{ \App\Support\StoreMedia::url($post->image) }}" alt="Zorrusso on Instagram" class="h-full w-full object-cover transition duration-500 group-hover:scale-105" loading="lazy">
            </a>
        @endforeach
    </div>
</section>
@endif

<section class="bg-white py-10 text-center">
    <a href="{{ $storeSettings['instagram_url'] }}" class="inline-flex items-center gap-2 text-sm">
        <svg class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="4" y="4" width="16" height="16" rx="4"/><circle cx="12" cy="12" r="3.5"/><circle cx="17.5" cy="6.5" r=".8" fill="currentColor"/></svg>
        Join us on Instagram
    </a>
</section>
</div>
