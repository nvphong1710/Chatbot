<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class dinhDuong extends Model
{
    public $timestamps = false;
    protected $fillable = ['nhom', 'ten'];
    protected $primaryKey = 'id';
    protected $table = 'dinh_duong';
}
