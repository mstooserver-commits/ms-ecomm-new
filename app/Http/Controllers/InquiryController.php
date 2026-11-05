<?php

namespace App\Http\Controllers;

use App\Models\Inquiry;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class InquiryController extends Controller
{
    public function store(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'product_id' => ['nullable', 'exists:products,id'],
            'type' => ['required', 'in:general,product,custom'],
            'name' => ['required', 'string', 'max:120'],
            'phone' => ['required', 'string', 'max:30'],
            'email' => ['nullable', 'email', 'max:160'],
            'city' => ['nullable', 'string', 'max:120'],
            'furniture_type' => ['nullable', 'string', 'max:120'],
            'dimensions' => ['nullable', 'string', 'max:160'],
            'budget' => ['nullable', 'string', 'max:100'],
            'message' => ['nullable', 'string', 'max:3000'],
            'reference_image' => ['nullable', 'image', 'max:5120'],
        ]);

        if ($request->hasFile('reference_image')) {
            $data['reference_image'] = $request->file('reference_image')->store('inquiries', 'public');
        }

        Inquiry::create($data);

        return back()->with('success', 'Thank you. Our furniture consultant will contact you shortly.');
    }
}
