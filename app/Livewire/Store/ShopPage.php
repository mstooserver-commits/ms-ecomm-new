<?php

namespace App\Livewire\Store;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Collection;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Auth;
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
    public string $sort = 'featured';

    #[Url]
    public string $view = 'grid';

    #[Url]
    public ?int $min = null;

    #[Url]
    public ?int $max = null;

    #[Url]
    public bool $stock = false;

    #[Url]
    public bool $sale = false;

    #[Url]
    public ?string $collection = null;

    #[Url]
    public ?string $color = null;

    #[Url]
    public ?string $device = null;

    public function mount(?Collection $collection = null): void
    {
        if ($collection) {
            $this->collection = $collection->slug;
        }
    }

    public function updatingSearch(): void
    {
        $this->resetPage();
    }

    public function updatingMin(): void
    {
        $this->resetPage();
    }

    public function updatingMax(): void
    {
        $this->resetPage();
    }

    public function updatingStock(): void
    {
        $this->resetPage();
    }

    public function updatingSale(): void
    {
        $this->resetPage();
    }

    public function clearFilters(): void
    {
        $this->reset(['search', 'category', 'brand', 'sort', 'min', 'max', 'stock', 'sale', 'collection', 'color', 'device']);
        $this->resetPage();
    }

    public function toggleWishlist(int $productId): void
    {
        if (! Auth::check()) {
            $this->redirect(route('login'), navigate: true);

            return;
        }

        $existing = Wishlist::where('user_id', Auth::id())->where('product_id', $productId);
        if ($existing->exists()) {
            $existing->delete();

            return;
        }

        Wishlist::create(['user_id' => Auth::id(), 'product_id' => $productId]);
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

        if ($this->min) {
            $query->where('price', '>=', $this->min);
        }

        if ($this->max) {
            $query->where('price', '<=', $this->max);
        }

        if ($this->stock) {
            $query->where('stock', '>', 0);
        }

        if ($this->sale) {
            $query->whereNotNull('compare_at_price')->whereColumn('compare_at_price', '>', 'price');
        }

        if ($this->collection) {
            $query->whereHas('collections', fn ($q) => $q->where('slug', $this->collection));
        }

        if ($this->color) {
            $query->whereHas('variants', fn ($q) => $q->where('color', $this->color)->where('is_active', true));
        }

        if ($this->device) {
            $query->whereHas('variants', fn ($q) => $q->where('size', $this->device)->where('is_active', true));
        }

        $query = match ($this->sort) {
            'popular' => $query->orderByDesc('views_count'),
            'price_asc' => $query->orderBy('price'),
            'price_desc' => $query->orderByDesc('price'),
            'featured' => $query->orderByDesc('is_best_seller')->orderByDesc('is_featured')->latest(),
            default => $query->latest(),
        };

        return view('livewire.store.shop-page', [
            'products' => $query->paginate(12),
            'categories' => Category::active()->orderBy('name')->get(),
            'brands' => Brand::where('is_active', true)->orderBy('name')->get(),
            'collections' => Collection::where('is_active', true)->orderBy('sort_order')->get(),
            'colors' => \App\Models\ProductVariant::query()->where('is_active', true)->whereNotNull('color')->distinct()->orderBy('color')->pluck('color'),
            'devices' => \App\Models\ProductVariant::query()->where('is_active', true)->whereNotNull('size')->distinct()->orderBy('size')->pluck('size'),
            'currentCategory' => $this->category
                ? Category::active()->where('slug', $this->category)->first()
                : null,
        ])->layout('layouts.store');
    }
}
