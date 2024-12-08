<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Publishers extends Model
{
    protected $table = "publishers";

    protected $fillable = [  
        'name',
        'address',
        'website',
        'email'
    ];
}
