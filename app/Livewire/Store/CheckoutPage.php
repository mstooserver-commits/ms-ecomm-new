<?php

namespace App\Livewire\Store;

use App\Enums\PaymentGateway;
use App\Services\CartService;
use App\Services\CheckoutService;
use App\Services\PaymentService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Livewire\Component;

class CheckoutPage extends Component
{
    public array $shipping = [];

    public string $paymentMethod = 'cod';

    public bool $useWallet = false;

    public ?string $guestEmail = null;

    public string $notes = '';

    public ?int $pendingOrderId = null;

    public function mount(): void
    {
        $this->shipping = [
            'first_name' => Auth::user()?->name ? explode(' ', Auth::user()->name)[0] : '',
            'last_name' => '',
            'phone' => Auth::user()?->phone ?? '',
            'address_line_1' => '',
            'city' => '',
            'state' => '',
            'postal_code' => '',
            'country' => 'IN',
        ];
    }

    public function placeOrder(CheckoutService $checkout, PaymentService $payment, CartService $cart): void
    {
        $allowedPayments = ['cod'];
        if (filled(config('shop.stripe_secret'))) $allowedPayments[] = PaymentGateway::Stripe->value;
        if (filled(config('shop.razorpay_key')) && filled(config('shop.razorpay_secret'))) $allowedPayments[] = PaymentGateway::Razorpay->value;

        $this->validate([
            'shipping.first_name' => 'required|string|max:100',
            'shipping.last_name' => 'required|string|max:100',
            'shipping.address_line_1' => 'required|string|max:255',
            'shipping.city' => 'required|string|max:100',
            'shipping.state' => 'required|string|max:100',
            'shipping.postal_code' => 'required|string|max:20',
            'shipping.phone' => 'required|string|max:20',
            'guestEmail' => Auth::check() ? 'nullable' : 'required|email',
            'paymentMethod' => ['required', Rule::in($allowedPayments)],
        ]);

        $order = $checkout->placeOrder([
            'shipping_address' => $this->shipping,
            'billing_address' => $this->shipping,
            'payment_method' => $this->paymentMethod,
            'guest_email' => $this->guestEmail,
            'notes' => $this->notes,
            'use_wallet' => $this->useWallet,
        ]);

        if ($this->paymentMethod === PaymentGateway::Stripe->value) {
            $session = $payment->createStripeSession(
                $order,
                route('checkout.success', $order),
                route('checkout')
            );
            $this->redirect($session->url);

            return;
        }

        if ($this->paymentMethod === PaymentGateway::Razorpay->value) {
            $payload = $payment->createRazorpayOrder($order);
            $this->pendingOrderId = $order->id;
            $this->dispatch('razorpay-checkout', payload: $payload + [
                'store_order_id' => $order->id,
                'name' => config('shop.name'),
                'email' => $order->guest_email ?: Auth::user()?->email,
                'phone' => $this->shipping['phone'],
            ]);

            return;
        }

        session()->flash('success', 'Order '.$order->order_number.' is placed.');
        $this->redirect(route('orders.show', $order), navigate: true);
    }

    public function confirmRazorpay(string $paymentId, string $gatewayOrderId, string $signature, PaymentService $payment): void
    {
        abort_unless($this->pendingOrderId, 422);
        $order = \App\Models\Order::findOrFail($this->pendingOrderId);
        $expected = hash_hmac('sha256', $gatewayOrderId.'|'.$paymentId, (string) config('shop.razorpay_secret'));
        abort_unless(hash_equals($expected, $signature), 422, 'Payment verification failed.');

        $payment->markPaid($order, PaymentGateway::Razorpay, $paymentId);
        $this->redirect(route('checkout.success', $order), navigate: true);
    }

    public function render(CheckoutService $checkout)
    {
        $totals = $checkout->calculateTotals();

        return view('livewire.store.checkout-page', [
            'totals' => $totals,
            'stripeEnabled' => filled(config('shop.stripe_secret')),
            'razorpayEnabled' => filled(config('shop.razorpay_key')) && filled(config('shop.razorpay_secret')),
        ])->layout('layouts.store');
    }
}
