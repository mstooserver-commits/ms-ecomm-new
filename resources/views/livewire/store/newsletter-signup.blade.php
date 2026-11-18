@if($subscribed)
    <p class="text-sm" role="status">You’re on the list.</p>
@else
    <form wire:submit="subscribe" class="flex flex-col gap-2">
        <label for="newsletter-email-{{ $this->getId() }}" class="sr-only">Email address</label>
        <input id="newsletter-email-{{ $this->getId() }}" wire:model="email" type="email" placeholder="Your@email.com" autocomplete="email" required
               class="w-full bg-white border border-black px-4 py-3 text-sm text-black outline-none {{ $tone === 'green' ? 'rounded-md text-center' : 'rounded-full' }}">
        <button type="submit" wire:loading.attr="disabled" class="w-full px-5 py-3.5 text-[12px] uppercase tracking-[.16em] font-semibold text-white disabled:opacity-60 {{ $tone === 'green' ? 'bg-[#1f9d4a] rounded-md' : 'bg-black rounded-full' }}">
            <span wire:loading.remove>Yes, please</span><span wire:loading>Joining…</span>
        </button>
    </form>
    @error('email') <p class="text-red-600 text-xs mt-1">{{ $message }}</p> @enderror
@endif
