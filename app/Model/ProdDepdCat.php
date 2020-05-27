<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProdDepdCat extends Model
{
    protected $table = "product_depend_category";

    public function cat()
    {
    	return $this->hasOne('App\Model\Category','id','cat_id');
    }
}
