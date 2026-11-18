<div>
    @if($presentation === 'plus')
        <button type="button" wire:click="addToCart" wire:loading.attr="disabled" class="shrink-0 border border-black px-3 py-2 text-[11px] font-semibold tracking-[.08em] disabled:opacity-50">
            <span wire:loading.remove wire:target="addToCart">+ ADD</span>
            <span wire:loading wire:target="addToCart">...</span>
        </button>
    @elseif($presentation === 'outline')
        <button type="button" wire:click="addToCart" wire:loading.attr="disabled" class="w-full border border-black py-3 text-[12px] font-semibold uppercase tracking-[.14em] hover:bg-black hover:text-white disabled:opacity-50">
            <span wire:loading.remove wire:target="addToCart">Add to cart</span>
            <span wire:loading wire:target="addToCart">Adding</span>
        </button>
    @else
        <div class="mt-3 grid grid-cols-2 gap-2">
            <button type="button" wire:click="addToCart" wire:loading.attr="disabled" class="bg-black text-white text-[10px] sm:text-[11px] font-semibold uppercase tracking-[.08em] py-2.5 disabled:opacity-50">
                <span wire:loading.remove wire:target="addToCart">Add to cart</span>
                <span wire:loading wire:target="addToCart">Adding</span>
            </button>
            <button type="button" wire:click="buyNow" wire:loading.attr="disabled" class="border border-black text-[10px] sm:text-[11px] font-semibold uppercase tracking-[.08em] py-2.5 disabled:opacity-50">
                <span wire:loading.remove wire:target="buyNow">Buy now</span>
                <span wire:loading wire:target="buyNow">Wait</span>
            </button>
        </div>
    @endif
    @if($notice)
        <p class="mt-2 text-[11px] uppercase tracking-[.08em]">{{ $notice }}</p>
    @endif
</div>
