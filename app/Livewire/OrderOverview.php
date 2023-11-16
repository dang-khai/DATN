<?php

namespace App\Livewire;

use App\Enums\EOrderStatus;
use App\Filament\Resources\OrderResource\Pages\ListOrders;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageTable;

class OrderOverview extends BaseWidget
{
    use InteractsWithPageTable;

    protected function getTablePage()
    {
        return ListOrders::class;
    }
    protected function getStats(): array
    {
        return [
            Stat::make('Total Order', $this->getPageTableQuery()->count()),
            Stat::make('New Order', $this->getPageTableQuery()->where('status', EOrderStatus::NEW)->count()),
            Stat::make('Delivered Order', $this->getPageTableQuery()->where('status', EOrderStatus::DELIVERIED)->count()),
        ];
    }
}
