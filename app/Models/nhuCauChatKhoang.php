<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nhuCauChatKhoang extends Model
{
    public $timestamps = false;
    protected $fillable = ['canxi', 'dong', 'iot', 'kem', 'maggie', 'phospho', 'sat', 'seleni', 'tuoi_toi_da', 'tuoi_toi_thieu'];
    protected $primaryKey = 'id';
    protected $table = 'nhu_cau_chat_khoang';
}
