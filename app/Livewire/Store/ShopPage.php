<?php

namespace App\Livewire\Store;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

class ShopPage extends Component
{
    use WithPagination;

    #[Url]
    public string $search = '';

    #[Url]
    public ?string $category = null;

    #[Url]
    public ?string $brand = null;

    #[Url]
    public string $sort = 'newest';

    #[Url]
    public string $view = 'grid';

    public function updatingSearch(): void
    {
        $this->resetPage();
    }

    public function clearFilters(): void
    {
        $this->reset(['search', 'category', 'brand', 'sort']);
        $this->resetPage();
    }

    public function render()
    {
        $query = Product::active()->with(['images', 'brand', 'category']);

        if ($this->search) {
            $query->where(function ($q) {
                $q->where('name', 'like', "%{$this->search}%")
                    ->orWhere('sku', 'like', "%{$this->search}%")
                    ->orWhere('short_description', 'like', "%{$this->search}%");
            });
        }

        if ($this->category) {
            $query->whereHas('category', fn ($q) => $q->where('slug', $this->category));
        }

        if ($this->brand) {
            $query->whereHas('brand', fn ($q) => $q->where('slug', $this->brand));
        }

        $query = match ($this->sort) {
            'popular' => $query->orderByDesc('views_count'),
            default => $query->latest(),
        };

        return view('livewire.store.shop-page', [
            'products' => $query->paginate(12),
            'categories' => Category::active()->orderBy('name')->get(),
            'brands' => Brand::where('is_active', true)->orderBy('name')->get(),
        ])->layout('layouts.store');
    }
}
