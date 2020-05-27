<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table="product";

    public function catdept()
    {
    	return $this->hasMany('App\Model\ProdDepdCat','product_id','id');
    }
}
