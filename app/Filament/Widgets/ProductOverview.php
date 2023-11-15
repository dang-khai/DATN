<?php

namespace App\Filament\Widgets;

use App\Models\Blog;
use App\Models\Order;
use App\Models\Product;
use App\Models\Category;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Widget;
use App\Enums\EOrderStatus;
use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
class ProductOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Người dùng', User::all()->count()),
            Stat::make('Danh mục', Category::all()->count()),
            Stat::make('Sản phẩm', Product::all()->count()),
            Stat::make('Bài viết', Blog::all()->count()),
            Stat::make('Tất cả đơn hàng', Order::all()->count()),
            Stat::make('Đơn hàng mới', Order::where('status', EOrderStatus::NEW)->count()),
            Stat::make('Đơn hàng thành công', Order::where('status', EOrderStatus::DELIVERIED)->count()),
        ];
    }
}
