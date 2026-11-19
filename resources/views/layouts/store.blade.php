<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="scroll-smooth">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $title ?? config('shop.name') }} — {{ config('shop.tagline') }}</title>
    <meta name="description" content="Zorrusso phone cases, charging and accessories.">
    <link rel="icon" href="{{ asset('images/brand/favicon.png') }}">
    <link rel="canonical" href="{{ url()->current() }}">
    <meta property="og:title" content="{{ $title ?? config('shop.name') }}">
    <meta property="og:description" content="Zorrusso phone cases, charging and accessories.">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{{ url()->current() }}">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    @livewireStyles
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Permanent+Marker&display=swap" rel="stylesheet">
    <style>
        :root { --ink:#111; --lime:#eeff99; --grey:#f4f4f4; --muted:#6b6b6b; }
        * { box-sizing: border-box; }
        [x-cloak] { display: none !important; }
        body { font-family: Inter, sans-serif; background: #fff; color: var(--ink); overflow-x: hidden; }
        .font-display { font-family: Inter, sans-serif; font-weight: 700; letter-spacing: -0.03em; text-transform: uppercase; }
        .font-marker { font-family: "Permanent Marker", cursive; font-weight: 400; letter-spacing: 0; text-transform: none; line-height: .9; }
        .eyebrow { font-size: .68rem; letter-spacing: .16em; text-transform: uppercase; font-weight: 600; }
        .glass { background: #fff; border: 1px solid #e8e8e8; }
        .btn-dark { display: inline-flex; align-items: center; justify-content: center; gap: .6rem; border:1px solid #111; border-radius:2px; background: #111; color: #fff; padding: .85rem 1.35rem; font-size: .68rem; letter-spacing: .1em; text-transform: uppercase; font-weight: 700; }
        .btn-dark:hover { background: #292929; }
        .btn-light { display: inline-flex; align-items: center; justify-content: center; gap: .6rem; border: 1px solid #111; border-radius:2px; background: #fff; color: #111; padding: .8rem 1.3rem; font-size: .68rem; letter-spacing: .1em; text-transform: uppercase; font-weight: 700; }
        .btn-light:hover { background: #111; color: #fff; }
        .hide-scrollbar::-webkit-scrollbar { display: none; }
        .hide-scrollbar { scrollbar-width: none; }
        @keyframes marquee { to { transform: translateX(-50%); } }
        .promo-marquee { animation: marquee 24s linear infinite; }
        @media (prefers-reduced-motion: reduce) { .promo-marquee { animation: none; } }
        a, button { transition: color .2s, background-color .2s, border-color .2s, opacity .2s; }
        :focus-visible { outline: 2px solid #111; outline-offset: 3px; }
        ::selection { background: var(--lime); color: #111; }
        img, video, svg { max-width: 100%; }
        h1, h2, h3, p, a { overflow-wrap: break-word; }
    </style>
</head>
<body class="antialiased" x-data="{ mobileMenu: false, searchOpen: false, drops: false, locale: false, menu: null, menuMode: 'shop', newsletterOpen: false }"
      x-init="if (!sessionStorage.getItem('zorrusso-offer-seen')) setTimeout(() => newsletterOpen = true, 3500)"
      :class="(mobileMenu || drops || newsletterOpen) ? 'overflow-hidden' : ''">
    @php
        $announcements = [
            $storeSettings['announcement'],
            'Free delivery on orders over ₹'.number_format(config('shop.free_shipping_threshold'), 0),
            'Phone cases, charging and accessories',
        ];
    @endphp
    <div class="bg-[#111] text-white" x-data="{ i: 0, notes: @js($announcements) }" x-init="setInterval(() => i = (i + 1) % notes.length, 4500)">
        <div class="mx-auto grid h-10 max-w-[1240px] grid-cols-[36px_minmax(0,1fr)_36px] items-center sm:h-11">
            <button type="button" class="text-lg lg:invisible" @click="i = (i + notes.length - 1) % notes.length" aria-label="Previous announcement">‹</button>
            <div class="flex items-center justify-center gap-4 overflow-hidden text-center text-[11px] sm:text-[12px]">
                <p class="truncate font-semibold text-[#e9ff79]" x-text="notes[i]"></p>
                <span class="hidden text-white/60 lg:inline">|</span>
                <span class="hidden lg:inline">Free standard shipping on orders over ₹1,500</span>
                <span class="hidden text-white/60 xl:inline">|</span>
                <span class="hidden xl:inline">Zorrusso special: Buy 2 cases—save 20%</span>
            </div>
            <button type="button" class="text-lg lg:invisible" @click="i = (i + 1) % notes.length" aria-label="Next announcement">›</button>
        </div>
    </div>

    <header class="sticky top-0 z-50 border-b border-black/5 bg-white">
        <div class="mx-auto grid h-[76px] max-w-[1240px] grid-cols-[1fr_auto_1fr] items-center px-4 sm:h-[92px] sm:px-7">
            <div class="flex items-center gap-4 sm:gap-5">
                <button type="button" @click="mobileMenu = true" aria-label="Open Menu" class="p-1">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
                </button>
                <button type="button" @click="searchOpen = !searchOpen" aria-label="Search" class="p-1">
                    <svg class="w-[22px] h-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><circle cx="11" cy="11" r="6.5"/><path d="m16 16 4 4"/></svg>
                </button>
                <div class="hidden items-center gap-7 md:flex">
                    <a href="{{ route('shop', ['edit' => 'women']) }}" class="border-b-2 border-black px-2 pb-3 text-sm font-bold uppercase">Women</a>
                    <a href="{{ route('shop', ['edit' => 'men']) }}" class="px-2 pb-3 text-sm font-bold uppercase">Men</a>
                </div>
            </div>
            <a href="{{ route('home') }}" class="block" aria-label="Zorrusso home">
                <img src="{{ asset('images/brand/zorrusso-logo.png') }}" alt="Zorrusso" class="h-6 w-auto sm:h-8">
            </a>
            <div class="relative flex items-center justify-end gap-3 sm:gap-4">
                <button type="button" @click="locale = !locale" class="hidden rounded-lg border border-black/15 px-4 py-3 text-[12px] font-medium md:inline" aria-label="Shipping and currency">🌍&nbsp; INR&nbsp; ⌄</button>
                <div x-show="locale" x-cloak @click.outside="locale = false" class="absolute right-0 top-12 z-50 w-64 border border-black bg-white p-4 text-left text-[13px] text-black">
                    <p class="text-[11px] font-semibold uppercase tracking-[.14em]">Ships to</p>
                    <p class="mt-2">India</p>
                    <p class="mt-3 text-[11px] font-semibold uppercase tracking-[.14em]">Currency</p>
                    <p class="mt-2">INR ₹</p>
                </div>
                <a href="{{ route('shop') }}" class="hidden min-w-[190px] items-center justify-between rounded-lg border border-black/15 px-4 py-3 text-[12px] lg:flex">
                    <span>Shop all devices</span><span aria-hidden="true">⌄</span>
                </a>
                <button type="button" @click="drops = true" aria-label="Open notifications" class="relative p-1">
                    <svg class="h-[22px] w-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M6 16V10a6 6 0 1 1 12 0v6l1.2 2H4.8L6 16Z"/><path d="M10 19a2 2 0 0 0 4 0"/></svg>
                    <span class="absolute -right-1 -top-1 grid h-4 min-w-4 place-items-center rounded-full bg-[#149447] px-1 text-[9px] font-bold text-white">3</span>
                </button>
                @auth
                    <a href="{{ route('account') }}" aria-label="Account" class="hidden sm:inline-flex">
                @else
                    <a href="{{ route('login') }}" aria-label="Account" class="hidden sm:inline-flex">
                @endauth
                    <svg class="w-[22px] h-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><circle cx="12" cy="8" r="3.2"/><path d="M5 19.2c1.4-3 3.8-4.4 7-4.4s5.6 1.4 7 4.4"/></svg>
                </a>
                @auth
                    <a href="{{ route('wishlist') }}" aria-label="Wishlist" class="hidden sm:inline-flex">
                @else
                    <a href="{{ route('login') }}" aria-label="Wishlist" class="hidden sm:inline-flex">
                @endauth
                    <svg class="h-[22px] w-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M12 20s-7-4.4-7-9a4 4 0 0 1 7-2 4 4 0 0 1 7 2c0 4.6-7 9-7 9Z"/></svg>
                </a>
                <button type="button" aria-label="Open Cart" class="inline-flex items-center gap-1.5" x-on:click="Livewire.dispatch('open-cart')">
                    <svg class="w-[22px] h-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M6.5 8h11l-.8 11.2a1 1 0 0 1-1 .8H8.3a1 1 0 0 1-1-.8L6.5 8Z"/><path d="M9 8V6.8A3 3 0 0 1 12 3.8 3 3 0 0 1 15 6.8V8"/></svg>
                    @livewire('store.cart-count')
                </button>
            </div>
        </div>
        <div x-show="searchOpen" x-cloak x-transition class="border-t border-black/10 px-4 sm:px-6 py-4">
            <form action="{{ route('shop') }}" class="max-w-2xl mx-auto flex gap-3 border-b border-black">
                <input name="search" autofocus placeholder="Search tech" class="min-w-0 flex-1 bg-transparent border-0 focus:ring-0 px-0 py-3 text-sm">
                <button class="eyebrow shrink-0">Search</button>
            </form>
        </div>
        @if($navCategories->isNotEmpty() && !request()->routeIs('home'))
            <nav class="relative border-t border-black/5 bg-[#f7f7f7]" aria-label="Collections" @mouseleave="menu = null">
                <div class="hide-scrollbar overflow-x-auto">
                    <ul class="mx-auto flex w-max min-w-full max-w-[1200px] items-end justify-center gap-4 px-4">
                        @foreach($navCategories as $category)
                            <li @mouseenter="menu = '{{ $category->slug }}'">
                                <a href="{{ route('shop', ['category' => $category->slug]) }}" class="flex min-w-[68px] flex-col items-center whitespace-nowrap border-b-2 py-1.5 text-[9px] font-semibold uppercase leading-3 {{ request('category') === $category->slug ? 'border-black' : 'border-transparent text-black/80' }}">
                                    <img src="{{ \App\Support\StoreMedia::url($category->image) }}" alt="" class="mb-1 h-8 w-8 rounded-full bg-white object-cover">
                                    {{ $category->name }}
                                </a>
                            </li>
                        @endforeach
                        <li><a href="{{ route('shop', ['sale' => 1]) }}" class="flex min-w-[68px] flex-col items-center whitespace-nowrap border-b-2 py-1.5 text-[9px] font-semibold uppercase leading-3 {{ request()->boolean('sale') ? 'border-black' : 'border-transparent' }}"><span class="mb-1 grid h-8 w-8 place-items-center rounded-full bg-[#ecff75] text-[8px] font-bold">SALE</span>Clearance</a></li>
                    </ul>
                </div>
                @foreach($navCategories as $category)
                    <div x-cloak class="absolute inset-x-0 top-full z-40 border-t border-black/10 bg-white shadow-sm" :class="menu === '{{ $category->slug }}' ? 'hidden lg:block' : 'hidden'">
                        <div class="mx-auto grid max-w-[1100px] grid-cols-[240px_1fr] gap-8 px-8 py-8">
                            <a href="{{ route('shop', ['category' => $category->slug]) }}" class="block bg-[#f6f6f6]">
                                <img src="{{ \App\Support\StoreMedia::url($category->image) }}" alt="" class="aspect-[4/5] w-full object-contain">
                            </a>
                            <div class="flex flex-col justify-center">
                                <p class="text-[12px] font-semibold uppercase tracking-[.16em]">{{ $category->name }}</p>
                                <p class="mt-3 max-w-md text-sm leading-6 text-black/70">{{ $category->description ?: 'Shop the '.$category->name.' edit.' }}</p>
                                <a href="{{ route('shop', ['category' => $category->slug]) }}" class="mt-5 inline-block w-fit border-b border-black text-[12px] font-semibold uppercase tracking-[.12em]">Shop {{ $category->name }}</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </nav>
        @endif
    </header>

    @if(request()->routeIs('home'))
        <div class="overflow-hidden bg-[#eaff78] py-2.5 text-[#4a1022]" aria-label="Current offers">
            <div class="promo-marquee flex w-max whitespace-nowrap text-[12px] font-semibold uppercase sm:text-sm">
                @for($i = 0; $i < 2; $i++)
                    <div class="flex items-center" aria-hidden="{{ $i ? 'true' : 'false' }}">
                        @foreach(['Buy 2 phone cases, save 20%', 'New season accessories', 'Free delivery over ₹1,500', 'Fresh tech, made personal'] as $offer)
                            <span class="px-7">{{ $offer }}</span><span aria-hidden="true">•</span>
                        @endforeach
                    </div>
                @endfor
            </div>
        </div>
    @endif

    <div x-show="mobileMenu" x-cloak class="fixed inset-0 z-[70]" @keydown.escape.window="mobileMenu = false">
        <div class="absolute inset-0 bg-black/45" @click="mobileMenu = false"></div>
        <aside class="absolute inset-y-0 left-0 w-[min(100%,520px)] overflow-y-auto bg-white" x-transition:enter="transition transform duration-300" x-transition:enter-start="-translate-x-full" x-transition:enter-end="translate-x-0">
            <div class="sticky top-0 z-10 border-b border-black/10 bg-[#f6f6f6] p-5">
                <div class="flex items-center gap-4">
                    <a href="{{ route('shop') }}" class="flex-1 rounded-lg border border-black/15 bg-white px-4 py-3 text-sm">Shop all devices</a>
                    <button type="button" @click="mobileMenu = false" aria-label="Close menu" class="grid h-10 w-10 place-items-center text-3xl font-light">×</button>
                </div>
                <div class="mt-5 grid grid-cols-2 text-center text-sm font-bold uppercase">
                    <button type="button" @click="menuMode = 'shop'" class="border-b-2 py-3" :class="menuMode === 'shop' ? 'border-black' : 'border-transparent'">Shop</button>
                    <button type="button" @click="menuMode = 'info'" class="border-b-2 py-3" :class="menuMode === 'info' ? 'border-black' : 'border-transparent'">Explore</button>
                </div>
            </div>
            <div x-show="menuMode === 'shop'" class="px-5 py-7">
                <div class="mb-7 flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase">Collections</p>
                    <a href="{{ route('shop') }}" class="text-xs font-semibold uppercase underline underline-offset-4">View all</a>
                </div>
                <div class="grid grid-cols-2 gap-3">
                    @foreach($navCategories->take(4) as $category)
                        <a href="{{ route('shop', ['category' => $category->slug]) }}" class="group">
                            <span class="block aspect-square overflow-hidden rounded-md bg-[#f4f4f4]"><img src="{{ \App\Support\StoreMedia::url($category->image) }}" alt="" class="h-full w-full object-cover transition duration-300 group-hover:scale-105"></span>
                            <span class="mt-2 block text-center text-sm font-medium">{{ $category->name }}</span>
                        </a>
                    @endforeach
                </div>
                <div class="mt-8 divide-y divide-black/10 border-y border-black/10">
                    @foreach($navCategories as $category)
                        <a href="{{ route('shop', ['category' => $category->slug]) }}" class="flex items-center gap-4 py-4">
                            <img src="{{ \App\Support\StoreMedia::url($category->image) }}" alt="" class="h-14 w-14 rounded-full bg-[#f4f4f4] object-cover">
                            <span class="flex-1 text-sm font-semibold uppercase">{{ $category->name }}</span>
                            <span class="rounded bg-black px-2 py-1 text-[10px] font-semibold text-[#eaff78]">UP TO 35% OFF</span>
                            <span aria-hidden="true">›</span>
                        </a>
                    @endforeach
                    <a href="{{ route('shop', ['sale' => 1]) }}" class="flex items-center gap-4 py-4 font-semibold uppercase"><span class="grid h-14 w-14 place-items-center rounded-full bg-[#eaff78] text-[10px]">SALE</span><span class="flex-1 text-sm">Clearance</span><span aria-hidden="true">›</span></a>
                </div>
            </div>
            <nav x-show="menuMode === 'info'" class="divide-y divide-black/10 px-5 py-5 text-[15px]" aria-label="Information">
                <a class="block py-5" href="{{ route('account') }}">Track order</a>
                <a class="block py-5" href="{{ route('about') }}">About us</a>
                <a class="block py-5" href="{{ route('faq') }}">Help center</a>
                <a class="block py-5" href="{{ route('contact') }}">Contact us</a>
                <a class="block py-5" href="{{ route('blog.index') }}">Blog & inspiration</a>
                <a class="block py-5" href="{{ route('faq') }}">Shipping, delivery & returns</a>
                <a class="block py-5" href="{{ route('about') }}">Careers & partnerships</a>
            </nav>
        </aside>
    </div>

    <div x-show="drops" x-cloak class="fixed inset-0 z-[75]" @keydown.escape.window="drops = false">
        <div class="absolute inset-0 bg-black/45" @click="drops = false"></div>
        <aside class="absolute inset-y-0 right-0 w-[min(100%,560px)] overflow-y-auto bg-white p-6 sm:p-9" x-transition:enter="transition transform duration-300" x-transition:enter-start="translate-x-full" x-transition:enter-end="translate-x-0">
            <div class="mb-8 flex items-center justify-between"><h2 class="text-2xl font-semibold">Notifications</h2><button type="button" @click="drops = false" class="text-3xl font-light" aria-label="Close notifications">×</button></div>
            @foreach([
                ['The Zorrusso sale is a big deal', 'Save on phone cases, charging, bundles and everyday accessories.', asset('images/tech/phone-case.jpg')],
                ['New collection: everyday tech', 'Fresh finishes and new shapes are available now.', asset('images/tech/night-glass-phone-case.jpg')],
                ['New in: charging essentials', 'Portable power and cables designed to travel well.', asset('images/tech/power-bank.jpg')],
                ['Gifts, sorted', 'Find useful gifts for everyone on your list.', asset('images/tech/earbuds-case.jpg')],
            ] as [$heading, $copy, $image])
                <a href="{{ route('shop', ['sort' => 'newest']) }}" class="grid grid-cols-[88px_1fr] gap-5 border-b border-black/15 py-6">
                    <img src="{{ $image }}" alt="" class="h-[88px] w-[88px] rounded-md object-cover">
                    <span><strong class="block text-sm uppercase">{{ $heading }}</strong><span class="mt-2 block text-sm leading-6 text-black/55">{{ $copy }}</span><span class="mt-2 block text-xs">Recently</span></span>
                </a>
            @endforeach
        </aside>
    </div>

    <div x-show="newsletterOpen" x-cloak class="fixed inset-0 z-[80] grid place-items-center p-4" @keydown.escape.window="newsletterOpen = false; sessionStorage.setItem('zorrusso-offer-seen','1')">
        <div class="absolute inset-0 bg-black/55" @click="newsletterOpen = false; sessionStorage.setItem('zorrusso-offer-seen','1')"></div>
        <section class="relative w-full max-w-[500px] overflow-hidden rounded-[28px] bg-[#321016] p-8 text-center text-white shadow-2xl sm:p-12" role="dialog" aria-modal="true" aria-labelledby="offer-title">
            <button type="button" @click="newsletterOpen = false; sessionStorage.setItem('zorrusso-offer-seen','1')" class="absolute right-5 top-4 text-3xl text-white/70" aria-label="Close offer">×</button>
            <span class="inline-block -rotate-6 rounded-lg bg-[#eaff78] px-5 py-3 text-lg font-black uppercase text-[#6e1530]">Up to 35% off</span>
            <h2 id="offer-title" class="mt-7 text-4xl font-black uppercase leading-none text-[#f03f77] sm:text-5xl">Welcome offer</h2>
            <p class="mx-auto mt-4 max-w-sm text-sm leading-6 text-white/75">Join the Zorrusso list for new drops, private offers and a discount on your first order.</p>
            <div class="mx-auto mt-7 max-w-sm">@livewire('store.newsletter-signup')</div>
            <p class="mt-5 text-[11px] leading-5 text-white/40">By entering your email address, you agree to receive occasional promotional emails. You can unsubscribe at any time.</p>
        </section>
    </div>

    <main class="min-h-screen">
        @if(session('success'))<div class="fixed top-24 right-5 z-[60] bg-white border border-black px-5 py-4 text-sm">{{ session('success') }}</div>@endif
        @if(session('error'))<div class="fixed top-24 right-5 z-[60] bg-white border border-red-600 px-5 py-4 text-sm text-red-700">{{ session('error') }}</div>@endif
        @hasSection('content')
            @yield('content')
        @else
            {{ $slot ?? '' }}
        @endif
    </main>

    @unless(request()->routeIs('home'))
        @include('partials.trust-row')
    @endunless

    <footer class="border-t border-black/10 bg-white">
        <div class="mx-auto grid max-w-[1200px] gap-10 px-6 py-14 md:grid-cols-2 lg:grid-cols-4">
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Products</p>
                <ul class="space-y-2.5 text-[13px]">
                    <li><a class="hover:underline" href="{{ route('shop') }}">All products</a></li>
                    @foreach($navCategories as $category)
                        <li><a class="hover:underline" href="{{ route('shop', ['category' => $category->slug]) }}">{{ $category->name }}</a></li>
                    @endforeach
                </ul>
            </div>
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Contact & info</p>
                <ul class="space-y-2.5 text-[13px]">
                    <li><a class="hover:underline" href="{{ route('about') }}">About us</a></li>
                    <li><a class="hover:underline" href="{{ route('faq') }}">Shipping and delivery</a></li>
                    <li><a class="hover:underline" href="{{ route('contact') }}">Contact us</a></li>
                    <li><a class="hover:underline" href="{{ route('blog.index') }}">Journal</a></li>
                    <li><a class="hover:underline" href="{{ route('account') }}">Account</a></li>
                </ul>
            </div>
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Visit</p>
                <ul class="space-y-2.5 text-[13px] leading-6">
                    <li>{{ $storeSettings['footer_address'] }}</li>
                    <li><a class="hover:underline" href="mailto:{{ $storeSettings['footer_email'] }}">{{ $storeSettings['footer_email'] }}</a></li>
                    <li><a class="hover:underline" href="tel:{{ preg_replace('/\s+/', '', $storeSettings['footer_phone']) }}">{{ $storeSettings['footer_phone'] }}</a></li>
                    <li><a class="hover:underline" href="https://wa.me/{{ preg_replace('/\D+/', '', $storeSettings['whatsapp_number']) }}" target="_blank" rel="noopener">WhatsApp</a></li>
                </ul>
            </div>
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Socials</p>
                <ul class="space-y-2.5 text-[13px] mb-8">
                    <li><a class="hover:underline" href="{{ $storeSettings['instagram_url'] }}">Instagram</a></li>
                    <li><a class="hover:underline" href="{{ $storeSettings['facebook_url'] }}">Facebook</a></li>
                    <li><a class="hover:underline" href="{{ $storeSettings['pinterest_url'] }}">Pinterest</a></li>
                </ul>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-3">The edit</p>
                @livewire('store.newsletter-signup')
            </div>
        </div>
        <div class="border-t border-black/10 px-6 py-5 flex flex-col sm:flex-row justify-between gap-3 text-[11px] uppercase tracking-[.12em] text-black/50">
            <span>© {{ date('Y') }} {{ config('shop.name') }}</span>
            <span>Tech accessories</span>
        </div>
    </footer>
    @livewire('store.cart-drawer')
    @livewireScripts
</body>
</html>
