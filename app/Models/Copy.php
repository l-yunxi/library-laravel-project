<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Copy extends Model
{
    protected $table = "copies";

    protected $fillable = [
        'inventory',
        'status',
        'condition',
        'position',
        'buy_date',
        'fk_book'
    ];

    public function book()
    {
        return $this->belongsTo(Book::class, 'fk_book');
    }
}
