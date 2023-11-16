<?php

namespace App\Filament\Resources;

use App\Enums\EMedia;
use App\Filament\Resources\BlogResource\Pages;
use App\Filament\Resources\BlogResource\RelationManagers;
use App\Models\Blog;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\SpatieMediaLibraryFileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;

class BlogResource extends Resource
{
    protected static ?string $model = Blog::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    public static function form(Form $form): Form
    {
        return $form
        ->schema([
            Group::make()
                ->schema([
                    Section::make()->schema([
                        TextInput::make('title')
                            ->required()
                            ->live(onBlur:true)
                            ->afterStateUpdated(
                                fn (Set $set, ?string $state) => $set('slug', Str::slug($state))),
                        TextInput::make('slug')
                            ->disabled()
                            ->dehydrated(),
                        MarkdownEditor::make('description')
                            ->columnSpan('full'),
                    ])->columns(2),
                    Section::make()->schema([
                        SpatieMediaLibraryFileUpload::make('url')
                            ->label('Image')
                            ->collection(EMedia::getName(3))
                            ->multiple(),
                    ])
                ])
                ->columnSpan(['lg' => 2]),
            Group::make()
                ->schema([
                    Section::make('Status')->schema([
                        DatePicker::make('published_at')
                            ->label('Published Date')
                            ->required(),
                        Toggle::make('visibility')
                            ->label('Visible')
                            ->hidden()
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
                TextColumn::make('title'),
                TextColumn::make('visibility')
                    ->getStateUsing(fn ($record) => is_null($record->visibility) ? 'Draft' : 'Published')
                    ->badge()
                    ->color(fn ($state) => match ($state) {
                        'Draft' => 'warning',
                        'Published' => 'success',
                    }),
                TextColumn::make('published_at')
                    ->label('Publish Date')
                    ->date(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBlogs::route('/'),
            'create' => Pages\CreateBlog::route('/create'),
            'edit' => Pages\EditBlog::route('/{record}/edit'),
        ];
    }    
}
