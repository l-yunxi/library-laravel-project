<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PersonalData extends Model
{
    protected $table = "personal_data";

    protected $fillable = [
        'name',
        'surname',
        'email',
        'phone',
        'address',
        'birth_date'
    ];
}
