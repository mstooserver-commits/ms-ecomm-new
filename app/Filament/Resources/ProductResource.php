<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';

    protected static ?string $navigationGroup = 'Catalog';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Tabs::make('Product')
                    ->tabs([
                        Forms\Components\Tabs\Tab::make('General')
                            ->icon('heroicon-o-information-circle')
                            ->schema([
                                Forms\Components\Section::make('Basic info')
                                    ->schema([
                                        Forms\Components\Grid::make(2)->schema([
                                            Forms\Components\TextInput::make('name')
                                                ->required()
                                                ->maxLength(255)
                                                ->live(onBlur: true)
                                                ->afterStateUpdated(function (Set $set, ?string $state, string $operation) {
                                                    if ($operation === 'create' && filled($state)) {
                                                        $set('slug', Str::slug($state));
                                                    }
                                                }),
                                            Forms\Components\TextInput::make('slug')
                                                ->required()
                                                ->maxLength(255)
                                                ->unique(ignoreRecord: true)
                                                ->helperText('URL-friendly name'),
                                            Forms\Components\TextInput::make('sku')
                                                ->label('SKU')
                                                ->required()
                                                ->unique(ignoreRecord: true)
                                                ->maxLength(255),
                                            Forms\Components\Select::make('brand_id')
                                                ->relationship('brand', 'name')
                                                ->searchable()
                                                ->preload()
                                                ->createOptionForm([
                                                    Forms\Components\TextInput::make('name')->required(),
                                                    Forms\Components\TextInput::make('slug')->required(),
                                                ]),
                                        ]),
                                        Forms\Components\Grid::make(1)->schema([
                                            Forms\Components\Select::make('category_id')
                                                ->relationship('category', 'name')
                                                ->searchable()
                                                ->preload(),
                                        ]),
                                        Forms\Components\Textarea::make('short_description')
                                            ->rows(2)
                                            ->maxLength(500)
                                            ->columnSpanFull(),
                                        Forms\Components\Hidden::make('price')->default(0),
                                        Forms\Components\Hidden::make('stock')->default(0),
                                        Forms\Components\Hidden::make('low_stock_threshold')->default(0),
                                    ]),
                                Forms\Components\Section::make('Visibility')
                                    ->columns(3)
                                    ->schema([
                                        Forms\Components\Toggle::make('is_active')
                                            ->label('Published')
                                            ->default(true)
                                            ->helperText('Show on storefront'),
                                        Forms\Components\Toggle::make('is_featured')
                                            ->label('Featured'),
                                        Forms\Components\Toggle::make('is_trending')
                                            ->label('Trending'),
                                        Forms\Components\Toggle::make('is_new_arrival')
                                            ->label('New arrival'),
                                    ]),
                            ]),

                        Forms\Components\Tabs\Tab::make('Content')
                            ->icon('heroicon-o-document-text')
                            ->schema([
                                Forms\Components\RichEditor::make('description')
                                    ->columnSpanFull()
                                    ->toolbarButtons([
                                        'bold', 'italic', 'link', 'bulletList', 'orderedList', 'h2', 'h3', 'blockquote',
                                    ]),
                                Forms\Components\Textarea::make('specifications')
                                    ->rows(4)
                                    ->columnSpanFull(),
                                Forms\Components\Textarea::make('size_guide')
                                    ->rows(4)
                                    ->columnSpanFull(),
                                Forms\Components\Textarea::make('shipping_info')
                                    ->rows(3)
                                    ->columnSpanFull(),
                            ]),

                        Forms\Components\Tabs\Tab::make('Options')
                            ->icon('heroicon-o-swatch')
                            ->schema([
                                Forms\Components\Section::make('Furniture options')
                                    ->description('Add the sizes and finishes visitors can enquire about.')
                                    ->schema([
                                        Forms\Components\TagsInput::make('available_sizes')
                                            ->placeholder('6 ft, 8 seater, King size'),
                                        Forms\Components\TagsInput::make('available_colors')
                                            ->label('Available finishes / colours')
                                            ->placeholder('Walnut, Natural Oak, Beige'),
                                    ]),
                            ]),

                        Forms\Components\Tabs\Tab::make('SEO')
                            ->icon('heroicon-o-magnifying-glass')
                            ->schema([
                                Forms\Components\TextInput::make('meta_title')
                                    ->maxLength(70)
                                    ->helperText('Recommended max 60 characters'),
                                Forms\Components\Textarea::make('meta_description')
                                    ->rows(3)
                                    ->maxLength(160)
                                    ->helperText('Recommended max 155 characters')
                                    ->columnSpanFull(),
                            ]),
                    ])
                    ->columnSpanFull()
                    ->persistTabInQueryString(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('cover')
                    ->label('Image')
                    ->getStateUsing(function (Product $record): ?string {
                        $path = $record->images->first()?->path;
                        if (! $path) {
                            return null;
                        }

                        return str_starts_with($path, 'http') ? $path : asset('storage/'.$path);
                    })
                    ->checkFileExistence(false)
                    ->height(56)
                    ->defaultImageUrl('https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=100&q=80'),
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->sortable()
                    ->description(fn (Product $record): string => $record->sku),
                Tables\Columns\TextColumn::make('brand.name')
                    ->badge()
                    ->color('gray')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('category.name')
                    ->toggleable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->label('Live')
                    ->boolean(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                Tables\Filters\TernaryFilter::make('is_active')->label('Published'),
                Tables\Filters\SelectFilter::make('brand_id')
                    ->relationship('brand', 'name')
                    ->searchable()
                    ->preload(),
                Tables\Filters\SelectFilter::make('category_id')
                    ->relationship('category', 'name')
                    ->searchable()
                    ->preload(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->emptyStateHeading('No products yet')
            ->emptyStateDescription('Create your first furniture catalogue item.')
            ->emptyStateIcon('heroicon-o-shopping-bag');
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\ImagesRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }

    public static function getGloballySearchableAttributes(): array
    {
        return ['name', 'sku', 'slug'];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->with(['images', 'brand', 'category']);
    }
}
