<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InquiryResource\Pages;
use App\Models\Inquiry;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class InquiryResource extends Resource
{
    protected static ?string $model = Inquiry::class;
    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-left-right';
    protected static ?string $navigationGroup = 'Enquiries';
    protected static ?int $navigationSort = 1;

    public static function canCreate(): bool { return false; }

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\Section::make('Customer enquiry')->columns(2)->schema([
                Forms\Components\TextInput::make('name')->disabled(),
                Forms\Components\TextInput::make('phone')->disabled(),
                Forms\Components\TextInput::make('email')->disabled(),
                Forms\Components\TextInput::make('city')->disabled(),
                Forms\Components\TextInput::make('type')->disabled(),
                Forms\Components\Select::make('status')->options(['new'=>'New','contacted'=>'Contacted','quoted'=>'Quoted','closed'=>'Closed'])->required(),
                Forms\Components\TextInput::make('furniture_type')->disabled(),
                Forms\Components\TextInput::make('dimensions')->disabled(),
                Forms\Components\TextInput::make('budget')->disabled(),
                Forms\Components\TextInput::make('product.name')->label('Product')->disabled(),
                Forms\Components\Textarea::make('message')->rows(5)->disabled()->columnSpanFull(),
                Forms\Components\FileUpload::make('reference_image')->disk('public')->image()->disabled()->columnSpanFull(),
            ]),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([
            Tables\Columns\TextColumn::make('name')->searchable(),
            Tables\Columns\TextColumn::make('phone')->copyable(),
            Tables\Columns\TextColumn::make('type')->badge(),
            Tables\Columns\TextColumn::make('product.name')->placeholder('General'),
            Tables\Columns\TextColumn::make('status')->badge(),
            Tables\Columns\TextColumn::make('created_at')->dateTime()->sortable(),
        ])->defaultSort('created_at', 'desc')->actions([Tables\Actions\EditAction::make()]);
    }

    public static function getPages(): array
    {
        return ['index'=>Pages\ListInquiries::route('/'), 'edit'=>Pages\EditInquiry::route('/{record}/edit')];
    }
}
