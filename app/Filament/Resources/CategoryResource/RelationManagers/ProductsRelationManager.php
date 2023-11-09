<?php

namespace App\Filament\Resources\CategoryResource\RelationManagers;

use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use IbrahimBougaoua\FilamentRatingStar\Actions\RatingStar;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;

class ProductsRelationManager extends RelationManager
{
    protected static string $relationship = 'products';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make()
                    ->schema([
                        Section::make()->schema([
                            TextInput::make('name')
                                ->live()
                                ->afterStateUpdated(
                                    fn (Set $set, ?string $state) => $set('slug', Str::slug($state))),
                            TextInput::make('slug')
                                ->disabled()
                                ->dehydrated(),
                            TextInput::make('price'),
                            TextInput::make('quantity'),
                            TextInput::make('content')->columnSpanFull(),
                            MarkdownEditor::make('description')
                                ->columnSpan('full'),
                        ])->columns(2),
                        Section::make()->schema([
                            SpatieMediaLibraryFileUpload::make('url')
                                ->label('Image')
                                ->collection('product-urls')
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
                            RatingStar::make('rating')
                                ->helperText('Rating star of this product'),
                        ])
                    ])
                    ->columnSpan(['lg' => 1]),
            ])
            ->columns(3);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('products')
            ->columns([
                TextColumn::make('name')
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('price')
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('quantity'),
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
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
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
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }
}