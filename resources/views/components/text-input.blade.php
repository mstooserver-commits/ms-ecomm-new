@props(['disabled' => false])

<input @disabled($disabled) {{ $attributes->merge(['class' => 'border-black/20 bg-white text-[#111] focus:border-black focus:ring-black rounded-none shadow-none px-4 py-3']) }}>
