<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class giaiPhap extends Model
{
    public $timestamps = false;
    protected $fillable = ['giai_phap', 'van_de'];
    protected $primaryKey = 'id';
    protected $table = 'giai_phap';
}
