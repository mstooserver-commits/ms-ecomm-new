<section class="border-t border-black/10 bg-white">
    <div class="max-w-[1100px] mx-auto px-6 py-10 grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
        <div>
            <svg class="mx-auto mb-3 h-7 w-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.4"><path d="M12 3.5 14.6 9l6 .6-4.6 3.9 1.4 5.9L12 16.8 6.6 19.4 8 13.5 3.4 9.6 9.4 9 12 3.5Z"/></svg>
            <p class="text-[12px] leading-5">Premium<br>quality</p>
        </div>
        <div>
            <svg class="mx-auto mb-3 h-7 w-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.4"><path d="M3 12h13l-2-2m2 2-2 2"/><path d="M14 7h4l3 4v4h-3"/><circle cx="7" cy="18" r="1.6"/><circle cx="17" cy="18" r="1.6"/><path d="M3 16V8h8"/></svg>
            <p class="text-[12px] leading-5">Free shipping<br>from ₹{{ number_format(config('shop.free_shipping_threshold'), 0) }}</p>
        </div>
        <div>
            <svg class="mx-auto mb-3 h-7 w-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.4"><rect x="5" y="10" width="14" height="10" rx="1.5"/><path d="M8 10V7.5a4 4 0 0 1 8 0V10"/></svg>
            <p class="text-[12px] leading-5">100% secure<br>checkout</p>
        </div>
        <div>
            <svg class="mx-auto mb-3 h-7 w-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.4"><circle cx="12" cy="12" r="8"/><path d="M12 8v4l2.5 2"/></svg>
            <p class="text-[12px] leading-5">Delivery<br>across India</p>
        </div>
    </div>
</section>
