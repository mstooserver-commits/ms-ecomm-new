@extends('layouts.store')

@section('content')
@php
    $woods = [
        ['Teak Wood', 'The gold standard of furniture craftsmanship. Naturally durable and resistant to moisture and pests, teak brings warm golden-brown tones, a straight grain and generational longevity.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/teak-wood.png?width=1200'],
        ['Shisham Wood', 'Rich heritage and unyielding strength. Its distinctive dark marbling and dense grain make it ideal for carved luxury beds, substantial dining tables and classic designs.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/shisham-wood.png?width=1200'],
        ['Pine Wood', 'Versatile, sustainable and modern. Pine provides a lighter, smooth canvas that works beautifully with contemporary forms, paint and custom finishes.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/pine-wood.png?width=1200'],
        ['Meranti Wood', 'Valued for its smooth, uniform texture and structural stability. Meranti resists warping and is an excellent choice for consoles, panelling and internal framing.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/miranti-wood.png?width=1200'],
    ];
    $finishes = [
        ['Natural Teak & Walnut Polish', 'Timeless elegance that protects the timber while revealing the organic grain of teak and shisham.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/comparison-of-teak-wood-polish-walnut-polish-on-a-wooden-plan-without-text.png?v=1770486929&width=1200'],
        ['Duco Colour Polish', 'A sleek, opaque and exceptionally smooth finish available in custom colours, matte or high gloss.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/white-cream-are-ok-colors-change-rest-of-the-colors.png?v=1770487104&width=1200'],
        ['Metallic Polish', 'Hand-applied antique gold, champagne and silver finishes made to highlight detailed carvings.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/make-background-white.png?v=1770487283&width=1200'],
        ['Distressed Polish', 'A carefully weathered finish that gives new furniture the character and warmth of a treasured antique.', 'https://4zgwrv-td.myshopify.com/cdn/shop/files/done-on-furniture.png?v=1772343905&width=1200'],
    ];
@endphp

<section class="relative overflow-hidden bg-[#0b2818] text-white">
    <div class="absolute inset-0 opacity-30 bg-[radial-gradient(circle_at_75%_15%,#9ddc68_0,transparent_35%)]"></div>
    <div class="relative max-w-[1440px] mx-auto px-6 lg:px-10 py-24 lg:py-36 grid lg:grid-cols-[1.2fr_.8fr] gap-12 items-end">
        <div><p class="eyebrow text-[#9ddc68] mb-5">Materials & craftsmanship</p><h1 class="font-display text-5xl sm:text-7xl lg:text-[88px] leading-[.94]">Quality begins<br><em>beneath the surface.</em></h1></div>
        <p class="text-white/70 leading-8 max-w-lg">Every bespoke piece combines carefully selected timber, master-applied finishes and premium comfort materials. Explore the foundations that make our furniture beautiful, dependable and made to last.</p>
    </div>
</section>

<section class="max-w-[1440px] mx-auto px-6 lg:px-10 py-20 lg:py-28">
    <div class="max-w-3xl mb-12 lg:mb-16"><p class="eyebrow text-[#668657] mb-4">The foundation</p><h2 class="font-display text-4xl lg:text-6xl mb-6">Our premium woods</h2><p class="text-stone-600 leading-7">We select kiln-dried, furniture-grade timber for structural integrity, reliable performance and timeless character.</p></div>
    <div class="grid md:grid-cols-2 gap-6 lg:gap-8">
        @foreach($woods as [$name, $description, $image])
            <article class="group bg-[#f2efe8] overflow-hidden"><div class="aspect-[16/10] bg-white overflow-hidden"><img src="{{ $image }}" alt="{{ $name }} sample" class="w-full h-full object-cover group-hover:scale-[1.03] transition duration-700" loading="lazy"></div><div class="p-7 lg:p-9"><p class="eyebrow text-[#668657] mb-3">Selected timber</p><h3 class="font-display text-3xl lg:text-4xl mb-4">{{ $name }}</h3><p class="text-sm text-stone-600 leading-7">{{ $description }}</p></div></article>
        @endforeach
    </div>
</section>

<section class="bg-[#173b25] text-white py-20 lg:py-28">
    <div class="max-w-[1440px] mx-auto px-6 lg:px-10">
        <div class="max-w-3xl mb-12 lg:mb-16"><p class="eyebrow text-[#9ddc68] mb-4">The artistry</p><h2 class="font-display text-4xl lg:text-6xl mb-6">Premium polish & finishes</h2><p class="text-white/65 leading-7">Our craftsmen apply each finish to protect the wood and reveal the depth, detail and personality of the design.</p></div>
        <div class="grid md:grid-cols-2 gap-px bg-white/15">
            @foreach($finishes as [$name, $description, $image])
                <article class="bg-[#173b25] p-5 sm:p-8 lg:p-10"><div class="aspect-[4/3] bg-white overflow-hidden mb-7"><img src="{{ $image }}" alt="{{ $name }} example" class="w-full h-full object-cover" loading="lazy"></div><h3 class="font-display text-3xl lg:text-4xl mb-4">{{ $name }}</h3><p class="text-sm text-white/65 leading-7">{{ $description }}</p></article>
            @endforeach
        </div>
    </div>
</section>

<section class="max-w-[1440px] mx-auto px-6 lg:px-10 py-20 lg:py-28">
    <div class="grid lg:grid-cols-2 gap-10 lg:gap-20 items-center">
        <div class="aspect-[4/3] bg-[#f2efe8] overflow-hidden"><img src="https://4zgwrv-td.myshopify.com/cdn/shop/files/foam-used-in-chairs-or-sofa.png?v=1772344111&width=1400" alt="High-resilience foam used in MS Furniture seating" class="w-full h-full object-cover" loading="lazy"></div>
        <div><p class="eyebrow text-[#668657] mb-4">The comfort</p><h2 class="font-display text-4xl lg:text-6xl mb-7">Luxury cushioning & upholstery</h2><div class="space-y-7 text-stone-600 leading-7"><div><h3 class="font-display text-3xl text-[#222822] mb-2">High-resilience foam</h3><p>Premium high-density HR foam contours to the body while retaining its shape for years, providing durable support without premature sagging.</p></div><div><h3 class="font-display text-3xl text-[#222822] mb-2">Premium upholstery</h3><p>Choose from ultra-soft velvets, breathable linens, performance fabrics and genuine bespoke leathers to complete your piece.</p></div></div><a href="{{ route('custom-furniture') }}" class="btn-dark mt-9">Discuss your material palette <span>→</span></a></div>
    </div>
</section>

<section class="bg-[#eef3e8] py-16 lg:py-20 text-center px-6"><p class="eyebrow text-[#668657] mb-4">See it in person</p><h2 class="font-display text-4xl lg:text-6xl mb-5">Visit our Mohali showroom</h2><p class="text-stone-600 leading-7 max-w-2xl mx-auto mb-8">Compare timber, polish, fabric and leather samples with our design team at Shop No. 5 & 6, Sector 74-A, Mohali, Punjab 160055.</p><a href="{{ route('contact') }}" class="btn-dark">Plan your visit <span>→</span></a></section>
@endsection
