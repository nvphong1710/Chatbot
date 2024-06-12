<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nhuCauVitamin extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'tuoi_toi_da',	
        'tuoi_toi_thieu',	
        'vitamin_a',
        'vitamin_b1',	
        'vitamin_b12',	
        'vitamin_b2',	
        'vitamin_b3',	
        'vitamin_b6',	
        'vitamin_b9',	
        'vitamin_c',	
        'vitamin_d',	
        'vitamin_e',	
        'vitamin_k'];
    protected $primaryKey = 'id';
    protected $table = 'nhu_cau_vitamin';
}
