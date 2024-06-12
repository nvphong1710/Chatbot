<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vaiTro extends Model
{
    public $timestamps = false;
    protected $fillable = ['vai_tro', 'dinh_duong_id'];
    protected $primaryKey = 'id';
    protected $table = 'vai_tro';
}
