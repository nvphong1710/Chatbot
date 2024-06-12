<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class message extends Model
{
    public $timestamps = false;
    protected $fillable = ['content', 'sender', 'timenow'];
    protected $primaryKey = 'message_id';
    protected $table = 'message';
}