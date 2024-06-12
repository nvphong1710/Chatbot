<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nhuCauGlucid extends Model
{
    public $timestamps = false;
    protected $fillable = ['khoi_luong', 'tuoi_toi_thieu', 'tuoi_toi_da'];
    protected $primaryKey = 'id';
    protected $table = 'nhu_cau_glucid';
}
