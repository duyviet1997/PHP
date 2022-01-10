<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PromocodesModel extends Model
{
    protected $table = 'promocodes';
    public $timestamps = false;
    protected $fillable = [
        'code',
        'cash',
        'percent',
        'is_userd',
        'created_at',
        'expiration_date',
        'id_group'
    ];
    public function group()
    {
        return $this->belongsTo('App\PromocodesGroup', 'id_group', 'id');
    }
}
