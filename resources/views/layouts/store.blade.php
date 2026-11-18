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
        .btn-dark { display: inline-flex; align-items: center; justify-content: center; gap: .6rem; background: #111; color: #fff; padding: .95rem 1.4rem; font-size: .72rem; letter-spacing: .14em; text-transform: uppercase; font-weight: 600; }
        .btn-dark:hover { background: #000; }
        .btn-light { display: inline-flex; align-items: center; justify-content: center; gap: .6rem; border: 1px solid #111; background: #fff; color: #111; padding: .9rem 1.3rem; font-size: .72rem; letter-spacing: .14em; text-transform: uppercase; font-weight: 600; }
        .btn-light:hover { background: #111; color: #fff; }
        .hide-scrollbar::-webkit-scrollbar { display: none; }
        .hide-scrollbar { scrollbar-width: none; }
        @keyframes marquee { to { transform: translateX(-50%); } }
        a, button { transition: color .2s, background-color .2s, border-color .2s, opacity .2s; }
        :focus-visible { outline: 2px solid #111; outline-offset: 3px; }
        ::selection { background: var(--lime); color: #111; }
        img, video, svg { max-width: 100%; }
        h1, h2, h3, p, a { overflow-wrap: break-word; }
    </style>
</head>
<body class="antialiased" x-data="{ mobileMenu: false, searchOpen: false }">
    <div class="bg-[#111] text-white">
        <div class="relative h-9 overflow-hidden">
            <div class="absolute inset-y-0 left-0 z-10 w-10 bg-gradient-to-r from-[#111] to-transparent"></div>
            <div class="absolute inset-y-0 right-0 z-10 w-10 bg-gradient-to-l from-[#111] to-transparent"></div>
            <div class="flex h-full items-center whitespace-nowrap animate-[marquee_28s_linear_infinite]">
                @foreach(range(1, 2) as $copy)
                    <span class="mx-8 text-[11px] uppercase tracking-[.14em]"><strong class="text-[#84FC10] font-semibold">{{ $storeSettings['announcement'] }}</strong></span>
                    <span class="text-white/40">•</span>
                    <span class="mx-8 text-[11px] uppercase tracking-[.14em]">Free delivery on orders over ₹{{ number_format(config('shop.free_shipping_threshold'), 0) }}</span>
                    <span class="text-white/40">•</span>
                    <span class="mx-8 text-[11px] uppercase tracking-[.14em]">Phone cases, charging and accessories</span>
                    <span class="text-white/40">•</span>
                @endforeach
            </div>
        </div>
    </div>

    <header class="sticky top-0 z-50 bg-white">
        <div class="h-[72px] px-4 sm:px-6 grid grid-cols-[1fr_auto_1fr] items-center">
            <div class="flex items-center gap-4 sm:gap-5">
                <button type="button" @click="mobileMenu = true" aria-label="Open Menu" class="p-1">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
                </button>
                <button type="button" @click="searchOpen = !searchOpen" aria-label="Search" class="p-1">
                    <svg class="w-[22px] h-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><circle cx="11" cy="11" r="6.5"/><path d="m16 16 4 4"/></svg>
                </button>
            </div>
            <a href="{{ route('home') }}" class="block" aria-label="Zorrusso home">
                <img src="{{ asset('images/brand/zorrusso-logo.png') }}" alt="Zorrusso" class="h-8 w-auto sm:h-9">
            </a>
            <div class="flex items-center justify-end gap-3 sm:gap-4">
                <span class="hidden md:inline text-[11px] font-semibold tracking-[.14em]">INR</span>
                @auth
                    <a href="{{ route('account') }}" aria-label="Account" class="hidden sm:inline-flex">
                @else
                    <a href="{{ route('login') }}" aria-label="Account" class="hidden sm:inline-flex">
                @endauth
                    <svg class="w-[22px] h-[22px]" fill="none" stroke="currentColor" stroke-width="1.6" viewBox="0 0 24 24"><circle cx="12" cy="8" r="3.2"/><path d="M5 19.2c1.4-3 3.8-4.4 7-4.4s5.6 1.4 7 4.4"/></svg>
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
    </header>

    <div x-show="mobileMenu" x-cloak class="fixed inset-0 z-[70]" @keydown.escape.window="mobileMenu = false">
        <div class="absolute inset-0 bg-black/40" @click="mobileMenu = false"></div>
        <aside class="absolute inset-y-0 left-0 w-[min(100%,420px)] bg-white overflow-y-auto" x-transition:enter="transition transform duration-300" x-transition:enter-start="-translate-x-full" x-transition:enter-end="translate-x-0">
            <div class="sticky top-0 bg-[#f6f6f6] px-5 py-4 flex items-center justify-between">
                <span class="text-sm font-medium">Shop tech</span>
                <button type="button" @click="mobileMenu = false" aria-label="Close" class="text-2xl leading-none">×</button>
            </div>
            <div class="px-6 pt-6 pb-10">
                <p class="text-[11px] font-semibold tracking-[.16em] mb-4">COLLECTIONS</p>
                <div class="grid grid-cols-2 gap-x-4 gap-y-3 mb-8">
                    @foreach($navCategories as $category)
                        <a href="{{ route('shop', ['category' => $category->slug]) }}" class="text-[13px] uppercase tracking-[.04em] hover:underline">{{ $category->name }}</a>
                    @endforeach
                </div>
                <div class="border-t border-black/10 pt-6 space-y-3 text-[13px] uppercase tracking-[.08em]">
                    <a class="block" href="{{ route('shop') }}">All products</a>
                    <a class="block" href="{{ route('shop', ['sort' => 'newest']) }}">New arrivals</a>
                    <a class="block" href="{{ route('materials') }}">Materials</a>
                    <a class="block" href="{{ route('custom-furniture') }}">Custom furniture</a>
                    <a class="block" href="{{ route('about') }}">About us</a>
                    <a class="block" href="{{ route('faq') }}">Help & delivery</a>
                    <a class="block" href="{{ route('contact') }}">Contact</a>
                    <a class="block" href="{{ route('blog.index') }}">Journal</a>
                </div>
            </div>
        </aside>
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
        <div class="max-w-[1440px] mx-auto px-6 lg:px-10 py-14 grid md:grid-cols-2 lg:grid-cols-4 gap-10">
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Products</p>
                <ul class="space-y-2.5 text-[13px]">
                    <li><a class="hover:underline" href="{{ route('shop') }}">All products</a></li>
                    @foreach($navCategories->take(8) as $category)
                        <li><a class="hover:underline" href="{{ route('shop', ['category' => $category->slug]) }}">{{ $category->name }}</a></li>
                    @endforeach
                </ul>
            </div>
            <div>
                <p class="text-[12px] font-semibold tracking-[.16em] uppercase mb-5">Contact & info</p>
                <ul class="space-y-2.5 text-[13px]">
                    <li><a class="hover:underline" href="{{ route('about') }}">About us</a></li>
                    <li><a class="hover:underline" href="{{ route('materials') }}">Materials</a></li>
                    <li><a class="hover:underline" href="{{ route('custom-furniture') }}">Custom furniture</a></li>
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
