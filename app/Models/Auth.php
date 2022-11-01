<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Auth extends Model
{
    use HasFactory;
    protected $fillable = [
        'patient_id',
        'auth_name',
        'auth_info',
    ];
}
