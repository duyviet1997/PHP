<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PromocodesGroup extends Model
{
		
    	protected $table='promocodes_group';
     	public $timestamps = false;
      	protected $fillable = ['id','name'];
      	const CODE_REGISTER = 1;
}
