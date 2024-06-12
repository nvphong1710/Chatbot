<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nhuCauNangLuong extends Model
{
    public $timestamps = false;
    protected $fillable = ['tuoi_toi_da', 'tuoi_toi_thieu', 'nang_luong'];
    protected $primaryKey = 'id';
    protected $table = 'nhu_cau_nang_luong';
}
