<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BannerResource\Pages;
use App\Models\Banner;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class BannerResource extends Resource
{
    protected static ?string $model = Banner::class;

    protected static ?string $navigationIcon = 'heroicon-o-photo';

    protected static ?string $navigationLabel = 'Slider';

    protected static ?string $modelLabel = 'Slide';

    protected static ?string $pluralModelLabel = 'Slider';

    protected static ?string $navigationGroup = 'Marketing';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Homepage slide')->description('Each slide is one photo on the homepage hero. Drag the list to change the order. The first slide is the front image.')->schema([
                    Forms\Components\Textarea::make('title')->required()->rows(2)->maxLength(255)->helperText('Use a new line for a two-line headline, for example Case / open.'),
                    Forms\Components\TextInput::make('subtitle')->maxLength(255),
                    Forms\Components\FileUpload::make('image')
                        ->image()
                        ->directory('banners')
                        ->disk('public')
                        ->required()
                        ->helperText('Square or portrait photo. JPG or WebP. This is the slider image.'),
                    Forms\Components\TextInput::make('link')->placeholder('/shop')->helperText('Where the button goes. /shop is fine.'),
                    Forms\Components\TextInput::make('button_text')->default('Shop now'),
                ]),
                Forms\Components\Section::make('Settings')->columns(3)->schema([
                    Forms\Components\Select::make('placement')
                        ->options(['hero' => 'Homepage Hero', 'promo' => 'Promo Strip'])
                        ->default('hero')
                        ->required(),
                    Forms\Components\Toggle::make('is_active')->default(true),
                    Forms\Components\TextInput::make('sort_order')->numeric()->default(0),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->getStateUsing(fn (Banner $record): string => \App\Support\StoreMedia::url($record->image))
                    ->height(56),
                Tables\Columns\TextColumn::make('title')->searchable(),
                Tables\Columns\TextColumn::make('placement')->badge(),
                Tables\Columns\IconColumn::make('is_active')->boolean(),
                Tables\Columns\TextColumn::make('sort_order')->sortable(),
            ])
            ->reorderable('sort_order')
            ->defaultSort('sort_order')
            ->actions([Tables\Actions\EditAction::make(), Tables\Actions\DeleteAction::make()]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBanners::route('/'),
            'create' => Pages\CreateBanner::route('/create'),
            'edit' => Pages\EditBanner::route('/{record}/edit'),
        ];
    }
}
