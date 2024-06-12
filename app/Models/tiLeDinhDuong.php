<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tiLeDinhDuong extends Model
{
    public $timestamps = false;
    protected $fillable = ['canxi', 'chat_beo', 'protein', 'tinh_bot', 'tong_kcal', 'tuoi_toi_da', 'tuoi_toi_thieu', 'vitamin_a', 
    'vitamin_b', 'vitamin_b12', 'vitamin_b2', 'vitamin_c', 'vitamin_d'];
    protected $primaryKey = 'id';
    protected $table = 'ti_le_dinh_duong';
}
