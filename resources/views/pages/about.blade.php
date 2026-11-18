@extends('layouts.store')

@section('content')
<section class="relative overflow-hidden bg-[#111] text-white">
    <div class="absolute inset-0 opacity-25 bg-[radial-gradient(circle_at_80%_20%,#eeff99_0,transparent_34%)]"></div>
    <div class="relative max-w-[1440px] mx-auto px-6 lg:px-10 py-24 lg:py-36 grid lg:grid-cols-[1.2fr_.8fr] gap-16 items-end">
        <div>
            <p class="eyebrow text-[#eeff99] mb-6">Our story</p>
            <h1 class="font-display text-5xl sm:text-7xl lg:text-[86px] leading-[.98]">Tech, dressed<br><em>for every day.</em></h1>
        </div>
        <p class="text-white/70 leading-8 max-w-lg">Zorrusso makes phone cases, charging and matching accessories with a precise fit and a finish made to be seen.</p>
    </div>
</section>

<section class="max-w-[1440px] mx-auto px-6 lg:px-10 py-20 lg:py-28">
    <div class="grid lg:grid-cols-2 gap-14 lg:gap-24 items-center">
        <div class="aspect-[4/3] bg-[#e7eee0] overflow-hidden">
            <img src="{{ asset('images/tech/hero-tech.jpg') }}" alt="Zorrusso accessories" class="w-full h-full object-cover">
        </div>
        <div class="max-w-xl">
            <p class="eyebrow text-[#111] mb-4">The Zorrusso approach</p>
            <h2 class="font-display text-4xl lg:text-6xl leading-tight mb-7">Good design should feel effortless.</h2>
            <div class="space-y-5 text-stone-600 leading-7">
                <p>Cases, power and small accessories that fit the device you already carry, with finishes you actually want people to see.</p>
                <p>The collection stays focused: precise fit, honest materials, and pieces that work together.</p>
            </div>
            <a href="{{ route('shop') }}" class="btn-dark mt-9">Explore our collection <span>→</span></a>
        </div>
    </div>
</section>

<section class="bg-[#f6f6f6] py-20 lg:py-24">
    <div class="max-w-[1440px] mx-auto px-6 lg:px-10">
        <div class="grid md:grid-cols-3 gap-px bg-[#111]/10">
            @foreach([
                ['01', 'Precise fit', 'Cases and accessories shaped for the device in your hand.'],
                ['02', 'Made to last', 'Finishes and materials chosen to stay looking sharp.'],
                ['03', 'Here to help', 'A note away if you need a size, an order, or a match.'],
            ] as [$number, $title, $copy])
                <article class="bg-[#f6f6f6] p-8 lg:p-12">
                    <span class="eyebrow text-[#111]">{{ $number }}</span>
                    <h3 class="font-display text-3xl mt-10 mb-4">{{ $title }}</h3>
                    <p class="text-sm text-stone-600 leading-6">{{ $copy }}</p>
                </article>
            @endforeach
        </div>
    </div>
</section>
@endsection
