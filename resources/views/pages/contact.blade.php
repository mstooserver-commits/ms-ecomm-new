@extends('layouts.store')

@section('content')
<section class="bg-[#f6f6f6]">
    <div class="max-w-[1440px] mx-auto px-6 lg:px-10 py-20 lg:py-28 grid lg:grid-cols-2 gap-14 lg:gap-24">
        <div>
            <p class="eyebrow text-[#111] mb-5">Contact MS Furniture</p>
            <h1 class="font-display text-5xl lg:text-7xl leading-tight mb-7">Let’s find the right piece.</h1>
            <p class="text-stone-600 leading-7 max-w-lg">Need product details, pricing, availability or design advice? Send an enquiry and our furniture consultant will contact you.</p>
        </div>
        <div class="bg-white p-7 sm:p-10 shadow-[0_20px_60px_rgba(23,53,29,.08)]">
            <form action="{{ route('inquiries.store') }}" method="post" class="space-y-6">
                @csrf<input type="hidden" name="type" value="general">
                <div><label class="eyebrow block mb-2" for="name">Name</label><input id="name" name="name" required class="w-full border border-[#111]/20 px-4 py-3 bg-transparent focus:border-[#111] focus:ring-0"></div>
                <div><label class="eyebrow block mb-2" for="phone">WhatsApp / Phone</label><input id="phone" name="phone" required class="w-full border border-[#111]/20 px-4 py-3 bg-transparent focus:border-[#111] focus:ring-0"></div>
                <div><label class="eyebrow block mb-2" for="email">Email</label><input id="email" name="email" type="email" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent focus:border-[#111] focus:ring-0"></div>
                <div><label class="eyebrow block mb-2" for="message">How can we help?</label><textarea id="message" name="message" required rows="5" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent focus:border-[#111] focus:ring-0"></textarea></div>
                @if($errors->any())<p class="text-sm text-red-700">{{ $errors->first() }}</p>@endif
                <button class="btn-dark" type="submit">Send enquiry <span>→</span></button>
            </form>
        </div>
    </div>
</section>
<section class="max-w-[1440px] mx-auto px-6 lg:px-10 py-16 lg:py-24">
    <div class="grid md:grid-cols-3 gap-px bg-[#111]/15">
        <article class="bg-white p-8 lg:p-10"><p class="eyebrow text-[#111] mb-5">Showroom</p><h2 class="font-display text-3xl mb-4">Mohali, Punjab</h2><p class="text-sm text-stone-600 leading-7">Shop No. 5 & 6<br>Sector 74-A, Mohali<br>Punjab 160055</p></article>
        <article class="bg-white p-8 lg:p-10"><p class="eyebrow text-[#111] mb-5">Call us</p><div class="space-y-3 text-sm"><a class="block hover:text-[#111]" href="tel:+919888673566">+91 98886 73566</a><a class="block hover:text-[#111]" href="tel:+919779696006">+91 97796 96006</a><a class="block hover:text-[#111]" href="tel:+918837582556">+91 88375 82556</a></div></article>
        <article class="bg-white p-8 lg:p-10"><p class="eyebrow text-[#111] mb-5">Working hours</p><h2 class="font-display text-3xl mb-4">Open daily</h2><p class="text-sm text-stone-600 leading-7 mb-5">10:00 AM – 8:00 PM</p><a href="https://wa.me/919779696006" target="_blank" rel="noopener" class="eyebrow border-b border-[#222822] pb-1">Chat on WhatsApp →</a></article>
    </div>
</section>
@endsection
