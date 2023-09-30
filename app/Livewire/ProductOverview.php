<?php

namespace App\Livewire;

use App\Filament\Resources\ProductResource\Pages\ListProducts;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageTable;

class ProductOverview extends BaseWidget
{
    use InteractsWithPageTable;

    protected function getTablePage()
    {
        return ListProducts::class;
    }
    protected function getStats(): array
    {
        return [
            Stat::make('Total Products', $this->getPageTableQuery()->count()),
        ];
    }
}
