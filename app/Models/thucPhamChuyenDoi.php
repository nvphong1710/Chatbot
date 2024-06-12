<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class thucPhamChuyenDoi extends Model
{
    public $timestamps = false;
    protected $fillable = ['chat_beo_bao_hoa', 'kcal', 'nhom', 'protein', 'ten', 'tinh_bot', 'xo'];
    protected $primaryKey = 'id';
    protected $table = 'thuc_pham_chuyen_doi';
}
