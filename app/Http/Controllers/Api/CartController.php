<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Cart;
use Validator;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request->all();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function show(Cart $cart)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function edit(Cart $cart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cart $cart)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cart $cart)
    {
        //
    }


    public function addtocart(Request $request)
    {
         $validator = Validator::make($request->all(),[
            'product_id' => 'required|integer',
            'cat_id' => 'required|integer',
            'qty' => 'required|integer',
            'user_id' => 'required|integer',
        ]);

        if($validator->fails()){
            return response()->json(["error" => $validator->errors()],401);
        }
       $data = Cart::where(['user_id'=>$request->user_id,'product_id'=>$request->product_id,'cat_id'=>$request->cat_id])->first();
       if(empty($data))
       {
        $cart = new Cart;
        $cart->user_id = $request->user_id;
        $cart->product_id = $request->product_id;
        $cart->quntity   = $request->qty;
        $cart->cat_id = $request->cat_id;
        $cart->save();
        return response()->json(["message"=>"Your Product Added into Cart"],200);
        }else{
        return response()->json(["message"=>"Your Product is Alredy Exist into Cart"],200);

        }
    }
        //change Perticular Item's Quantity
    public function changeQty(Request $request)
    {

        $validator = Validator::make($request->all(),[
            'qty' => 'required|integer',
            'cart_id' => 'required|integer',
        ]);
        if($validator->fails()){
            return response()->json(["error" => $validator->errors()],401);
        }

        $cart = Cart::where('id',$request->cart_id)->first();
        if($cart == null){
            return response()->json(['error'=>'Please Enter Valid cart id']);
        }
        $cart->quntity=$request->qty;
        $cart->save();
        return response()->json(['message'=>'Quantity Change Successfully','data'=>$cart]);
    }

    //Remove Perticular Item From cart
    public function removeCart(Request $request)
    {
        
        $validator = Validator::make($request->all(),[
            'cart_id' => 'required|integer',
        ]);

        if($validator->fails()){
            return response()->json(["error" => $validator->errors()],401);
        }

        $cart = Cart::where('id',$request->cart_id)->first();
        if($cart == null){
            return response()->json(['error'=>'Please Enter Valid cart id']);
        }
        $cart->delete();
        return response()->json(['message'=>'Item Deleted Successfully']);
    }

    //remove all items from cart
    public function clearCart(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'user_id' => 'required|integer',
        ]);

        if($validator->fails()){
            return response()->json(["error" => $validator->errors()],401);
        }

        $cart = Cart::where('user_id',$request->user_id);
        $cart->delete();
        return response()->json(['message'=>'All items are deleted from cart is Successfully']);
    }
      //cart details of perticular user
    public function cartDetails(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'user_id' => 'required|integer',
        ]);

        if($validator->fails()){
            return response()->json(["error" => $validator->errors()],401);
        }
        $cart = Cart::with('product.catdept.cat')->where('user_id',$request->user_id)->get();
        
        if(!$cart->isEmpty()) {
            return response()->json(['data'=>$cart]);
        } else {
            return response()->json(['message'=>'No Items in cart']);
        }
    }
}
