<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class hienTuong extends Model
{
    public $timestamps = false;
    protected $fillable = ['bieu_hien', 'muc_do_phu_hop', 'van_de'];
    protected $primaryKey = 'id';
    protected $table = 'hien_tuong';
}
