<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('shop.name', 'Zorrusso') }} — {{ config('shop.tagline') }}</title>
        <link rel="icon" href="{{ asset('images/brand/favicon.png') }}">

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Scripts -->
   <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    </head>
    <body class="text-[#111] antialiased" style="font-family:Inter,sans-serif">
        <div class="min-h-screen grid lg:grid-cols-[.9fr_1.1fr] bg-white">
            <div class="hidden lg:block relative overflow-hidden">
                <img src="{{ asset('images/tech/phone-case.jpg') }}" alt="Zorrusso phone case" class="absolute inset-0 w-full h-full object-cover">
                <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/10 to-transparent"></div>
                <div class="absolute left-12 right-12 bottom-12 text-white">
                    <img src="{{ asset('images/brand/zorrusso-logo.png') }}" alt="Zorrusso" class="mb-5 h-8 w-auto bg-white px-3 py-1.5">
                    <p class="text-5xl font-bold uppercase leading-tight tracking-tight">Everyday tech,<br>dressed up.</p>
                </div>
            </div>
            <main class="min-h-screen flex flex-col">
                <div class="p-6 sm:p-9 flex justify-between items-center">
                    <a href="{{ route('home') }}" wire:navigate aria-label="Zorrusso home"><img src="{{ asset('images/brand/zorrusso-logo.png') }}" alt="Zorrusso" class="h-8 w-auto"></a>
                    <a href="{{ route('home') }}" class="text-[10px] uppercase tracking-[.18em] border-b border-black/30 pb-1">Back to store</a>
                </div>
                <div class="flex-1 flex items-center justify-center px-6 pb-20">
                    <div class="w-full max-w-[460px] bg-white border border-black/10 p-7 sm:p-10">
                        {{ $slot }}
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
