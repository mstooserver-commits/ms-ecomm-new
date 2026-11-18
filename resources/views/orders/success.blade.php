@extends('layouts.store')

@section('content')
<div class="max-w-3xl mx-auto px-4 py-16 text-center">
    <p class="text-[12px] font-semibold uppercase tracking-[.16em] mb-4">Order confirmed</p>
    <h1 class="font-display text-4xl mb-4">{{ $order->order_number }}</h1>
    <p class="text-sm text-black/60 mb-8">We have your order. You can review it or download the invoice.</p>
    <div class="flex flex-wrap justify-center gap-3">
        <a href="{{ route('orders.show', $order) }}" class="btn-dark">View order</a>
        <a href="{{ route('shop') }}" class="btn-light">Keep shopping</a>
    </div>
</div>
@endsection
