@extends('layouts.store')

@section('content')
<section class="bg-black text-white">
    <div class="max-w-[1440px] mx-auto px-6 lg:px-10 py-20 lg:py-32 grid lg:grid-cols-2 gap-14 items-center">
        <div><p class="eyebrow text-[#eeff99] mb-5">Made for your space</p><h1 class="font-display text-5xl lg:text-7xl leading-[.95] mb-7">Custom furniture,<br><em>made personal.</em></h1><p class="text-white/70 leading-7 max-w-xl">Share your dimensions, preferred material, reference image and budget. Our team will help turn your idea into a practical piece for your home.</p></div>
        <div class="bg-[#FAF9F6] text-[#222822] p-7 sm:p-10">
            <form action="{{ route('inquiries.store') }}" method="post" enctype="multipart/form-data" class="grid sm:grid-cols-2 gap-5">
                @csrf<input type="hidden" name="type" value="custom">
                <div><label class="eyebrow block mb-2">Name *</label><input name="name" value="{{ old('name') }}" required class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">WhatsApp / Phone *</label><input name="phone" value="{{ old('phone') }}" required class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">Email</label><input name="email" type="email" value="{{ old('email') }}" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">City</label><input name="city" value="{{ old('city') }}" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">Furniture type</label><input name="furniture_type" value="{{ old('furniture_type') }}" placeholder="Sofa, bed, dining table…" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">Dimensions</label><input name="dimensions" value="{{ old('dimensions') }}" placeholder="Length × width × height" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">Approx. budget</label><input name="budget" value="{{ old('budget') }}" placeholder="₹" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent"></div>
                <div><label class="eyebrow block mb-2">Reference image</label><input name="reference_image" type="file" accept="image/*" class="w-full text-sm border border-[#111]/20 px-3 py-2.5"></div>
                <div class="sm:col-span-2"><label class="eyebrow block mb-2">Tell us about your idea</label><textarea name="message" rows="5" class="w-full border border-[#111]/20 px-4 py-3 bg-transparent">{{ old('message') }}</textarea></div>
                @if($errors->any())<div class="sm:col-span-2 text-sm text-red-700">{{ $errors->first() }}</div>@endif
                <div class="sm:col-span-2"><button class="btn-dark" type="submit">Request a consultation <span>→</span></button></div>
            </form>
        </div>
    </div>
</section>
@endsection
