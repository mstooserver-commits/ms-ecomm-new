<?php

namespace App\Providers\Filament;

use Filament\Enums\ThemeMode;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationGroup;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\View\PanelsRenderHook;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->login()
            ->brandName('Zorrusso')
            ->brandLogo(asset('images/brand/zorrusso-logo.png'))
            ->brandLogoHeight('1.75rem')
            ->favicon(asset('images/brand/favicon.png'))
            ->colors([
                'primary' => [
                    50 => '#f7f7f7',
                    100 => '#eeff99',
                    200 => '#e7e7e7',
                    300 => '#d0d0d0',
                    400 => '#8d8d8d',
                    500 => '#111111',
                    600 => '#111111',
                    700 => '#000000',
                    800 => '#000000',
                    900 => '#000000',
                    950 => '#000000',
                ],
                'gray' => [
                    50 => '#fafafa',
                    100 => '#f4f4f4',
                    200 => '#e8e8e8',
                    300 => '#d4d4d4',
                    400 => '#8a8a8a',
                    500 => '#5c5c5c',
                    600 => '#3f3f3f',
                    700 => '#2a2a2a',
                    800 => '#171717',
                    900 => '#111111',
                    950 => '#0a0a0a',
                ],
            ])
            ->font('Inter')
            ->darkMode(false)
            ->defaultThemeMode(ThemeMode::Light)
            ->sidebarCollapsibleOnDesktop()
            ->renderHook(PanelsRenderHook::STYLES_AFTER, fn (): string => '<link rel="stylesheet" href="'.asset('css/admin-theme.css').'?v='.filemtime(public_path('css/admin-theme.css')).'">')
            ->renderHook(PanelsRenderHook::BODY_START, fn () => view('filament.hooks.announcement'))
            ->navigationGroups([
                NavigationGroup::make('Catalog')->icon('heroicon-o-shopping-bag'),
                NavigationGroup::make('Enquiries')->icon('heroicon-o-chat-bubble-left-right'),
                NavigationGroup::make('Marketing')->icon('heroicon-o-megaphone'),
                NavigationGroup::make('Content')->icon('heroicon-o-document-text'),
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Pages\Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
