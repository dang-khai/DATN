<?php

namespace App\Filament\Resources;

use App\Enums\EMedia;
use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Livewire\ProductOverview;
use App\Models\Category;
use App\Models\Product;
use Filament\Forms\Set;
use Filament\Tables\Actions\CreateAction;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Infolists\Components\SpatieMediaLibraryImageEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\TextInputColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use IbrahimBougaoua\FilamentRatingStar\Actions\RatingStar;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;
    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make()
                    ->schema([
                        Section::make()->schema([
                            Select::make('category_id')
                                ->required()
                                ->label('Category')
                                ->options(Category::pluck('name', 'id'))
                                ->columnSpanFull(),
                            TextInput::make('name')
                                ->required()
                                ->live(onBlur:true)
                                ->afterStateUpdated(
                                    fn (Set $set, ?string $state) => $set('slug', Str::slug($state))),
                            TextInput::make('slug')
                                ->disabled()
                                ->dehydrated(),
                            TextInput::make('price')->required(),
                            TextInput::make('quantity')->required(),
                            TextInput::make('content')->columnSpanFull(),
                            MarkdownEditor::make('description')
                                ->columnSpan('full'),
                        ])->columns(2),
                        Section::make()->schema([
                            SpatieMediaLibraryFileUpload::make('url')
                                ->label('Image')
                                ->collection(EMedia::getName(2))
                                ->multiple(),
                        ])
                    ])
                    ->columnSpan(['lg' => 2]),
                Group::make()
                    ->schema([
                        Section::make('Status')->schema([
                            Toggle::make('visibility')
                                ->label('Visible')
                                ->helperText('This product will be hidden from all sales channels.')
                                ->default(true),
                        ])
                    ])
                    ->columnSpan(['lg' => 1]),
            ])
            ->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('category.name')
                    ->label('Category')
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('name')
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('price')
                    ->sortable()
                    ->toggleable(),
                TextInputColumn::make('quantity'),
                ToggleColumn::make('visibility'),
                TextColumn::make('description')
                    ->toggleable()
                    ->toggledHiddenByDefault(),
                TextColumn::make('created_at')
                    ->toggleable()
                    ->toggledHiddenByDefault(),
                TextColumn::make('updated_at')
                    ->toggleable()
                    ->toggledHiddenByDefault(),
            ])
            ->filters([
                SelectFilter::make('category_id')
                    ->label('Category')
                    ->options(Category::pluck('name', 'id'))
            ])
            ->filtersTriggerAction(fn($action) => $action->button()->label('Filter'))
            ->actions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\ReviewsRelationManager::class,
        ];
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist->schema([
            TextEntry::make('category.name')
                ->badge(),
            TextEntry::make('name'),
            TextEntry::make('description'),
            SpatieMediaLibraryImageEntry::make('product-url')
                ->label('Image')
                ->collection('product-urls'),
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
            // 'view' => Pages\ViewProduct::route('/{record}'),
        ];
    }
    public static function getWidgets(): array
    {
        return [
            ProductOverview::class
        ];
    }
    public static function getNavigationBadge(): ?string
{
    return static::getModel()::count();
}
}