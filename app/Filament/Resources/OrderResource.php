<?php

namespace App\Filament\Resources;

use App\Enums\EOrderStatus;
use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Livewire\OrderOverview;
use App\Models\Order;
use App\Models\Product;
use Doctrine\DBAL\Types\StringType;
use Faker\Core\Number;
use Filament\Forms\Components\Section;
use Filament\Tables\Actions\ViewAction;
use Filament\Forms;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Carbon;
use Filament\Tables\Filters\SelectFilter;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make([
                    Section::make()->schema([
                        TextInput::make('fullname')
                            ->label('Name')
                            ->disabled(),
                        TextInput::make('phone')
                            ->disabled(),
                        TextInput::make('address')
                            ->disabled()    
                            ->columnSpanFull(),
                        Textarea::make('note')
                            ->disabled()
                            ->columnSpanFull(),
                    ])->columns(2),
                    Section::make()->schema([
                        Forms\Components\Section::make('Order items')
                            ->schema(static::getFormSchema('items')),
                    ])->columns(2)
                ])->columnSpan(['lg' => 2]),

                Group::make([
                    Section::make()->schema([
                        Select::make('status')
                            ->options(EOrderStatus::getAll()),
                        Placeholder::make('order_at')
                            ->label('Order at')
                            ->content(fn (Order $record): ?string => $record->order_at),
                    ]),
                    Section::make()->schema([
                        Placeholder::make('total_amount')
                            ->label('Amout')
                            ->content(fn (Order $record): ?string => $record->total_amount),   
                        Placeholder::make('shipping')
                            ->label('Ship')
                            ->content(fn (Order $record): ?string => $record->shipping),    
                    ])
                ])->columnSpan(['lg' => 1]),
                
            ])->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('User Name'),
                TextColumn::make('status')
                    ->label('Status')
                    ->getStateUsing(fn ($record) => EOrderStatus::getName($record->status))
                    ->badge()
                    ->color(fn ($record) => EOrderStatus::getColor($record->status)),
                TextColumn::make('shipping')
                    ->label('Shipment Amount'),
                TextColumn::make('total_amount')
                    ->label('Order Amount'),
                TextColumn::make('order_at')
                    ->label('Order Date')
                    ->date(),
                                  
            ])
            ->filters([
                SelectFilter::make('status')
                    ->label('Status')
                    ->options(EOrderStatus::getAll())
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                // ViewAction::make(),
            ])
            ->bulkActions([
                // Tables\Actions\BulkActionGroup::make([
                //     Tables\Actions\DeleteBulkAction::make(),
                // ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }
    
    public static function getWidgets(): array
    {
        return [
            OrderOverview::class
        ];
    }

    public static function getFormSchema(string $section = null): array
    {
        if ($section === 'items') {
            return [
                Forms\Components\Repeater::make('items')
                    ->relationship()
                    ->disableItemCreation()
                    ->disableItemDeletion()
                    ->schema([
                        Forms\Components\Select::make('product_id')
                            ->label('Product')
                            ->options(Product::query()->pluck('name','id'))
                            ->disabled()
                            ->columnSpan(5),

                        Forms\Components\TextInput::make('quantity')
                            ->label('Quantity')
                            ->disabled()
                            ->columnSpan(2),

                        Forms\Components\TextInput::make('amount')
                            ->label('Unit Price')
                            ->disabled()
                            ->columnSpan(3),
                    ])->columns(10)
                ];       
        };
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function canDelete(Model $record): bool
    {
        return false;  
    }

    public static function getRelations(): array
    {
        return [
            // RelationManagers\OrderDetailRelationManager::class,
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit')
            // 'view' => Pages\ViewOrder::route('/{record}'),
        ];
    }    
}
