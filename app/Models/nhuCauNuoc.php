<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nhuCauNuoc extends Model
{
    public $timestamps = false;
    protected $fillable = ['tuoi', 'can_nang', 'dung_luong_toi_thieu', 'dung_luong_toi_da'];
    protected $primaryKey = 'id';
    protected $table = 'nhu_cau_nuoc';
}
