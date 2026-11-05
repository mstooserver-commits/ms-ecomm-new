<div class="max-w-[1440px] mx-auto px-5 lg:px-10 py-8 lg:py-14" x-data="{zoom:false}">
<nav class="text-[10px] uppercase tracking-[.16em] text-stone-400 mb-8"><a href="{{ route('home') }}">Home</a> <span class="mx-2">/</span> <a href="{{ route('shop') }}">Catalogue</a> <span class="mx-2">/</span> <span class="text-[#252620]">{{ $product->name }}</span></nav>
<div class="grid lg:grid-cols-[1.15fr_.85fr] gap-10 lg:gap-20">
<div>@php $images=$product->images;$mainImage=$images[$selectedImage]??null;$src=$mainImage?->path; @endphp
<button class="block w-full aspect-[5/6] bg-[#eee9df] overflow-hidden cursor-zoom-in" @click="zoom=true"><img src="{{ $src ? (str_starts_with($src,'http')?$src:asset('storage/'.$src)) : asset('images/product-placeholder.svg') }}" alt="{{ $product->name }}" class="w-full h-full object-cover hover:scale-[1.02] transition duration-700"></button>
@if($images->count()>1)<div class="flex gap-3 mt-3 overflow-x-auto">@foreach($images as $i=>$img)<button wire:click="$set('selectedImage',{{ $i }})" class="w-24 aspect-square border {{ $selectedImage===$i?'border-[#252620]':'border-transparent' }} overflow-hidden"><img src="{{ str_starts_with($img->path,'http')?$img->path:asset('storage/'.$img->path) }}" class="w-full h-full object-cover" alt=""></button>@endforeach</div>@endif</div>
<div class="lg:pt-8 lg:sticky lg:top-32 self-start"><p class="eyebrow text-[#75806a] mb-4">{{ $product->category?->name ?? 'MS Furniture' }}</p><h1 class="font-display text-4xl lg:text-6xl leading-tight mb-5">{{ $product->name }}</h1>
<p class="text-stone-600 leading-7 mb-8">{{ $product->short_description }}</p>
@if(!empty($product->available_sizes) || !empty($product->available_colors))<div class="mb-8 space-y-5">@if(!empty($product->available_sizes))<div><p class="eyebrow text-[#75806a] mb-3">Available sizes</p><div class="flex flex-wrap gap-2">@foreach($product->available_sizes as $size)<span class="px-5 py-3 border border-[#252620]/20 text-sm">{{ $size }}</span>@endforeach</div></div>@endif @if(!empty($product->available_colors))<div><p class="eyebrow text-[#75806a] mb-3">Available finishes</p><div class="flex flex-wrap gap-2">@foreach($product->available_colors as $finish)<span class="px-5 py-3 border border-[#252620]/20 text-sm">{{ $finish }}</span>@endforeach</div></div>@endif</div>@endif
@php
    $whatsapp = preg_replace('/\D+/', '', $whatsappNumber);
    $details = [
        'Hello, I am interested in this furniture:',
        'Product: '.$product->name,
        'Code: '.$product->sku,
        $product->category ? 'Category: '.$product->category->name : null,
        !empty($product->available_sizes) ? 'Sizes: '.implode(', ', $product->available_sizes) : null,
        !empty($product->available_colors) ? 'Finishes: '.implode(', ', $product->available_colors) : null,
        'Link: '.route('products.show', $product),
        '',
        'Please share more details.',
    ];
    $whatsappText = rawurlencode(implode("\n", array_filter($details, fn ($line) => $line !== null)));
@endphp
<div class="grid sm:grid-cols-2 gap-3 mb-7"><a href="https://wa.me/{{ $whatsapp }}?text={{ $whatsappText }}" target="_blank" rel="noopener" class="btn-dark">Enquire on WhatsApp <span>→</span></a><a href="#product-enquiry" class="btn-light">Request details</a></div>
<div class="grid grid-cols-2 gap-3 border-y border-[#252620]/15 py-5 mb-7 text-xs"><span>✓ Design consultation</span><span>✓ Delivery across India</span><span>✓ Custom sizes available</span><span>✓ Material guidance</span></div>
<div id="product-enquiry" class="bg-[#eef3e8] p-6 mb-7 scroll-mt-32"><p class="font-display text-3xl mb-2">Enquire about this piece</p><p class="text-sm text-stone-500 mb-5">Leave your details and our team will contact you.</p><form action="{{ route('inquiries.store') }}" method="post" class="space-y-3">@csrf<input type="hidden" name="type" value="product"><input type="hidden" name="product_id" value="{{ $product->id }}"><input name="name" required placeholder="Your name" class="w-full border border-[#17351d]/20 px-4 py-3 bg-white"><input name="phone" required placeholder="WhatsApp / phone" class="w-full border border-[#17351d]/20 px-4 py-3 bg-white"><input name="city" placeholder="City" class="w-full border border-[#17351d]/20 px-4 py-3 bg-white"><textarea name="message" rows="3" placeholder="Questions, size or finish requirements" class="w-full border border-[#17351d]/20 px-4 py-3 bg-white"></textarea><button class="btn-dark w-full" type="submit">Send product enquiry</button></form></div>
@foreach([['Details',$product->description],['Delivery & care',$product->shipping_info],['Dimensions & materials',$product->specifications]] as $detail) @if($detail[1])<details class="border-b border-[#252620]/15 py-5 group"><summary class="eyebrow cursor-pointer flex justify-between">{{ $detail[0] }} <span class="text-lg font-normal group-open:rotate-45 transition">+</span></summary><div class="mt-4 text-sm leading-7 text-stone-600">{!! nl2br(e($detail[1])) !!}</div></details>@endif @endforeach
</div></div>
@if($related->isNotEmpty())<section class="mt-24 lg:mt-32 border-t border-[#252620]/15 pt-16"><div class="text-center mb-10"><p class="eyebrow text-[#75806a] mb-3">Complete the room</p><h2 class="font-display text-4xl lg:text-5xl">You may also like</h2></div><div class="grid grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-7">@foreach($related as $p)<x-product-card :product="$p" />@endforeach</div></section>@endif
<div x-show="zoom" x-cloak @keydown.escape.window="zoom=false" class="fixed inset-0 z-[80] bg-[#252620]/95 p-6 lg:p-12 flex items-center justify-center" @click.self="zoom=false"><button @click="zoom=false" class="absolute top-6 right-6 text-white text-4xl">×</button><img src="{{ $src ? (str_starts_with($src,'http')?$src:asset('storage/'.$src)) : '' }}" class="max-w-full max-h-full object-contain" alt="{{ $product->name }}"></div>
</div>
