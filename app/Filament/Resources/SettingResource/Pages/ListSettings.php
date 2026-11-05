<?php
namespace App\Filament\Resources\SettingResource\Pages;
use App\Filament\Resources\SettingResource;
use App\Models\Setting;
use Filament\Actions;
use Filament\Forms;
use Filament\Resources\Pages\ListRecords;
class ListSettings extends ListRecords
{
    protected static string $resource = SettingResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\Action::make('whatsapp')
                ->label('Set WhatsApp number')
                ->icon('heroicon-o-chat-bubble-left-right')
                ->color('success')
                ->fillForm(fn (): array => [
                    'number' => Setting::valueFor('whatsapp_number', config('shop.whatsapp_number')),
                ])
                ->form([
                    Forms\Components\TextInput::make('number')
                        ->label('WhatsApp number')
                        ->tel()
                        ->required()
                        ->placeholder('919876543210')
                        ->helperText('Include country code. Example: 91 followed by the 10-digit mobile number.'),
                ])
                ->action(function (array $data): void {
                    $number = preg_replace('/\D+/', '', $data['number']);

                    Setting::updateOrCreate(
                        ['key' => 'whatsapp_number'],
                        ['group' => 'contact', 'type' => 'string', 'value' => $number],
                    );
                })
                ->successNotificationTitle('WhatsApp number updated'),
            Actions\CreateAction::make(),
        ];
    }
}
