<div>
@php
    $bubbles = [
        ['Phone Cases', 'phone-cases', asset('images/tech/phone-case.jpg')],
        ['Charging', 'charging', asset('images/tech/power-bank.jpg')],
        ['Earbuds', 'earbuds-cases', asset('images/tech/earbuds-case.jpg')],
        ['Ring Holders', 'ring-holders', asset('images/tech/ring-holder.jpg')],
        ['Watch Bands', 'watch-bands', asset('images/tech/watch-band.jpg')],
        ['Laptop', 'laptop-protection', asset('images/tech/laptop-sleeve.jpg')],
        ['Tablets', 'tablet-cases', asset('images/tech/tablet-case.jpg')],
    ];

    $mosaic = [
        ['Phone Cases', 'phone-cases', asset('images/tech/phone-case.jpg'), true],
        ['Magnetic Power Banks', 'charging', asset('images/tech/power-bank.jpg'), true],
        ['Earbuds Cases', 'earbuds-cases', asset('images/tech/earbuds-case.jpg'), false],
        ['Ring Holders', 'ring-holders', asset('images/tech/ring-holder.jpg'), true],
        ['Watch Bands', 'watch-bands', asset('images/tech/watch-band.jpg'), false],
        ['Laptop Protection', 'laptop-protection', asset('images/tech/laptop-sleeve.jpg'), false],
        ['Tablet Cases', 'tablet-cases', asset('images/tech/tablet-case.jpg'), true],
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
            ['title' => "Case\nopen", 'subtitle' => 'Ready for a new finish?', 'image' => asset('images/tech/phone-case.jpg'), 'link' => route('shop'), 'button' => 'Shop now'],
            ['title' => "Case\nopen", 'subtitle' => 'Ready for a new finish?', 'image' => asset('images/tech/tablet-case.jpg'), 'link' => route('shop'), 'button' => 'Shop now'],
            ['title' => "Case\nopen", 'subtitle' => 'Ready for a new finish?', 'image' => asset('images/tech/earbuds-case.jpg'), 'link' => route('shop'), 'button' => 'Shop now'],
        ]);
    }

    $quote = $testimonials->first();
    $featuredProducts = $bestSellers->isNotEmpty() ? $bestSellers : ($trending->isNotEmpty() ? $trending : $newArrivals);
    $featuredCategories = $categories->isNotEmpty() ? $categories : collect();
@endphp

<section class="relative overflow-hidden bg-[#d5e4ef]"
    x-data="{ active: 0, total: {{ $heroSlides->count() }} }"
    @if($heroSlides->count() > 1) x-init="setInterval(() => active = (active + 1) % total, 5500)" @endif>
    @foreach($heroSlides as $index => $slide)
        @php
            $count = $heroSlides->count();
            $second = $count > 1 ? $heroSlides[($index + 1) % $count]['image'] : null;
            $third = $count > 2 ? $heroSlides[($index + 2) % $count]['image'] : null;
        @endphp
        <div x-show="active === {{ $index }}" @if($index > 0) x-cloak @endif class="mx-auto grid min-h-[560px] max-w-[1440px] items-center gap-6 px-6 py-12 lg:min-h-[680px] lg:grid-cols-2 lg:px-16 lg:py-0">
            <div class="max-w-xl">
                <h1 class="font-marker text-[64px] text-[#2a241c] sm:text-[88px] lg:text-[104px]">{!! nl2br(e($slide['title'])) !!}</h1>
                @if($slide['subtitle'])
                    <p class="mt-4 text-xl text-[#2a241c] sm:text-2xl">{{ $slide['subtitle'] }}</p>
                @endif
                <a href="{{ $slide['link'] }}" class="mt-8 inline-flex bg-white px-8 py-3.5 text-[13px] font-semibold uppercase tracking-[.16em] text-black shadow-sm">{{ $slide['button'] }}</a>
            </div>
            <div class="relative h-[380px] sm:h-[480px] lg:h-[620px]">
                @if($second)
                    <img src="{{ $second }}" alt="" class="absolute right-[8%] top-[8%] w-[46%] rotate-6 rounded-[28px] object-cover shadow-xl" style="aspect-ratio:3/4">
                @endif
                <img src="{{ $slide['image'] }}" alt="{{ $slide['title'] }}" class="absolute left-[6%] top-[18%] w-[48%] -rotate-6 rounded-[28px] object-cover shadow-2xl {{ $second ? '' : 'left-auto right-[12%] w-[70%]' }}" style="aspect-ratio:3/4">
                @if($third)
                    <img src="{{ $third }}" alt="" class="absolute bottom-[6%] right-[18%] w-[34%] rotate-3 rounded-[24px] object-cover shadow-xl" style="aspect-ratio:1/1">
                @endif
            </div>
        </div>
    @endforeach
    @if($heroSlides->count() > 1)
        <div class="absolute bottom-5 left-0 right-0 z-10 flex justify-center gap-2">
            @foreach($heroSlides as $index => $slide)
                <button type="button" @click="active = {{ $index }}" class="h-1.5 rounded-full bg-[#2a241c] transition-all" :class="active === {{ $index }} ? 'w-6' : 'w-1.5 opacity-40'" aria-label="Slide {{ $index + 1 }}"></button>
            @endforeach
        </div>
    @endif
</section>

<div class="border-b border-black/5 bg-white">
    <div class="flex gap-2 overflow-x-auto hide-scrollbar px-4 py-5 sm:px-6">
        @foreach($bubbles as [$name, $category, $image])
            <a href="{{ route('shop', ['category' => $category]) }}" class="w-[92px] shrink-0 text-center sm:w-[108px]">
                <span class="mx-auto mb-2 grid h-[84px] w-[84px] place-items-center overflow-hidden rounded-full bg-[#f4f4f4] sm:h-[96px] sm:w-[96px]">
                    <img src="{{ $image }}" alt="{{ $name }}" class="h-full w-full object-cover" loading="lazy">
                </span>
                <span class="block text-[10px] font-semibold uppercase tracking-[.06em] sm:text-[11px]">{{ $name }}</span>
            </a>
        @endforeach
    </div>
</div>

<section class="mx-auto max-w-3xl px-6 py-12 text-center">
    <blockquote class="text-[15px] font-medium leading-relaxed sm:text-lg">“{{ $quote->content ?? 'A finish you actually want people to see.' }}”</blockquote>
    <p class="mt-3 text-[13px] tracking-[.2em] text-[#1f9d4a]">★★★★★</p>
    @if($quote)
        <p class="mt-2 text-[12px] uppercase tracking-[.14em] text-black/50">{{ $quote->name }}@if($quote->role) · {{ $quote->role }}@endif</p>
    @endif
</section>

<section class="px-3 pb-3 sm:px-4">
    <a href="{{ route('shop') }}" class="group relative block min-h-[320px] overflow-hidden bg-[#1a1714] sm:min-h-[460px]">
        <img src="{{ asset('images/tech/hero-tech.jpg') }}" alt="" class="absolute inset-0 h-full w-full object-cover opacity-80 transition duration-700 group-hover:scale-105">
        <span class="absolute inset-0 bg-black/35"></span>
        <span class="relative flex min-h-[320px] flex-col items-center justify-center px-6 text-center text-white sm:min-h-[460px]">
            <span class="text-[11px] font-semibold uppercase tracking-[.28em]">The new edit</span>
            <span class="font-display mt-3 text-4xl sm:text-6xl">Everyday tech</span>
            <span class="mt-6 bg-[#f3ead7] px-6 py-3 text-[12px] font-semibold uppercase tracking-[.16em] text-black">Shop now</span>
        </span>
    </a>
</section>

<section class="px-3 pb-4 sm:px-4">
    <ul class="grid grid-cols-2 gap-3 sm:gap-4">
        @foreach($mosaic as [$name, $category, $image, $sale])
            <li>
                <a href="{{ $category ? route('shop', ['category' => $category]) : route('shop') }}" class="group relative block min-h-[240px] overflow-hidden sm:min-h-[360px] lg:min-h-[460px]">
                    <img src="{{ $image }}" alt="{{ $name }}" class="absolute inset-0 h-full w-full object-cover transition duration-700 group-hover:scale-105" loading="lazy">
                    <span class="absolute inset-0 bg-black/25"></span>
                    @if($sale)
                        <span class="absolute left-3 top-3 grid h-12 w-12 place-items-center rounded-full bg-[#ffe14a] text-[10px] font-bold uppercase">Sale</span>
                    @endif
                    <span class="absolute inset-0 flex flex-col items-center justify-center px-4 text-center text-white">
                        <span class="mb-3 text-[13px] font-bold uppercase tracking-[.14em] sm:text-base">{{ $name }}</span>
                        <span class="bg-white px-4 py-2 text-[11px] font-semibold uppercase tracking-[.14em] text-black">View all</span>
                    </span>
                </a>
            </li>
        @endforeach
    </ul>
</section>

<section class="bg-[#f3f3f3] px-4 py-14">
    <div class="mx-auto max-w-3xl text-center">
        <p class="mb-4 text-[13px] font-semibold uppercase tracking-[.18em]">Want first look at the next drop?</p>
        @livewire('store.newsletter-signup', ['tone' => 'green'])
    </div>
</section>

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

@include('partials.trust-row')

<section class="bg-white py-10 text-center">
    <a href="{{ $storeSettings['instagram_url'] }}" class="inline-flex items-center gap-2 text-sm">
        <svg class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="4" y="4" width="16" height="16" rx="4"/><circle cx="12" cy="12" r="3.5"/><circle cx="17.5" cy="6.5" r=".8" fill="currentColor"/></svg>
        Join us on Instagram
    </a>
</section>
</div>
