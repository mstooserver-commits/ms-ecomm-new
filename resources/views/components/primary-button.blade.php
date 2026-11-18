<button {{ $attributes->merge(['type' => 'submit', 'class' => 'inline-flex items-center px-6 py-3.5 bg-black border border-transparent rounded-none font-semibold text-[10px] text-white uppercase tracking-[.2em] hover:bg-black focus:outline-none focus:ring-2 focus:ring-black focus:ring-offset-2 transition ease-in-out duration-150']) }}>
    {{ $slot }}
</button>
