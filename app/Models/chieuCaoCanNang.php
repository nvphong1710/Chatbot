<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class chieuCaoCanNang extends Model
{
    public $timestamps = false;
    protected $fillable = ['gioi_tinh', 'tuoi', 'can_nang_toi_thieu', 'can_nang_toi_da', 'chieu_cao_toi_thieu', 'chieu_cao_toi_da'];
    protected $primaryKey = 'id';
    protected $table = 'chieu_cao_can_nang';
}
