<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Category;
use App\Model\ProdDepdCat;
use Illuminate\Http\Request;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $product = Product::with('catdept.cat')->get();
        return view('auth.admin.product.index',compact('product'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
         $cat = Category::get();
        return view('auth.admin.product.create',compact('cat'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
          // return  $request->all();
          $this->validate($request, [
            'title' => 'required|max:100',
            'price' => 'required|max:4',
            'description' => 'required',
            'images' => 'required',
            'images.*' => 'mimes:jpeg,png,jpg,gif,svg|max:2048',
            'cat'=>'required',
            ]);

            $product = new Product;
            $product->title=$request->title;
            $product->price= $request->price;
            $product->cat_id=json_encode($request->cat);
            $product->description= $request->description;
          


                $images=array();
                if($request->hasfile('images'))
                 {
                    foreach($request->file('images') as $file)
                    {
                        $name = time().'.'.$file->extension();
                        $file->move(public_path().'/product/', $name);  
                        $data[] = $name;  
                    }
                 }


          
            $product->image=json_encode($data);
            $product->save();
            foreach ($request->cat as $key => $value) {
                $cat = new ProdDepdCat;
                $cat->cat_id=$value;
                $cat->product_id=$product->id;
                $cat->save();
            }

        return redirect()->route('product.index')->with('status', 'Product has been successfully added');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $product->with('catdept.cat')->get();
        $cat = Category::get();
        return view('auth.admin.product.edit',compact('product','cat'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->validate($request, [
            'title' => 'required|max:100',
            'price' => 'required',
            'description' => 'required',
            'cat'=>'required',
            ]);

            $product = Product::find($product->id);
            $product->title=$request->title;
            $product->price= $request->price;
            $product->cat_id=json_encode($request->cat);
            $product->description= $request->description;
       
                $images=array();
                $data = array();
                if($request->hasfile('images'))
                 {  
                    foreach($request->file('images') as $file)
                    {
                        $images =json_decode($product->image);
                        foreach (  $images as $key => $value) {
                            $source = public_path().'/product/'.$value;
                            if (file_exists($source)) {
                                unlink($source);
                            }
                        }
                        $name = uniqid().time().'.'.$file->extension();
                        $file->move(public_path().'/product/', $name);  
                        $data[] = $name;  
                    }
                    $product->image=json_encode($data);

                 }
 

          
            $product->update();
            ProdDepdCat::where('product_id',$product->id)->delete();
            foreach ($request->cat as $key => $value) {
                $cat = new ProdDepdCat;
                $cat->cat_id=$value;
                $cat->product_id=$product->id;
                $cat->save();
            }

        return back()->with('success', 'Product has been updated successfully ');
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        Product::where('id',$product->id)->delete();
        return back()->with('status', $product->title.'  Product has been delete successfully ');
    }

    public function productlist()
    {
          $product = Product::with('catdept.cat')->paginate(3);
        return view('productlist',compact('product'));
    }
}
