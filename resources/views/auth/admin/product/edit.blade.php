@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header"> Product Upload</div>

                <div class="card-body">
                  @if ($message = Session::get('success'))
                      <div class="alert alert-success alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button> 
                              <strong>{{ $message }}</strong>
                      </div>
                      @endif


                      @if ($message = Session::get('error'))
                      <div class="alert alert-danger alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button> 
                              <strong>{{ $message }}</strong>
                      </div>
                      @endif
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                   @if($errors->any())
                      <div class="alert alert-danger" role="alert">
                        {!! implode('', $errors->all('<span class="alert-danger">:message</span></br>')) !!}
                      </div>
                    @endif
                    <form enctype="multipart/form-data" method="POST" action="{{route('product.update',$product->id)}}">
                      <div class="form-group">@csrf
                         @method('PUT')
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="enter title" name="title" value="{{$product->title}}">
                        
                      </div>
                      <div class="form-group">
                        <label for="price">Price</label>
                        <input type="number" class="form-control" id="price" placeholder="price" name="price" value="{{$product->price}}">
                      </div>
                      <div class="form-group">
                        <label for="title">Price description</label>
                        <textarea class="form-control" name="description">{{$product->description}} </textarea>
                      </div>
                      <?php 
                        
                      $array = json_decode($product->cat_id);
                      $image = json_decode($product->image);
                      ?>
                      <div class="form-group">
                        @foreach($image as $img)
                         <img src="{{url('/')}}/product/{{$img}}" alt="Italian Trulli" height="20%" width="20%">
                        @endforeach
                      </div>

                      <div class="form-group">
                        <input  type="file" class="form-control" name="images[]" placeholder="address" multiple accept="image/x-png,image/gif,image/jpeg" />
                      </div>
                     
                      <div class="form-group">
                        <select class="form-control" name="cat[]" multiple="multiple"> 
                            <option value="">Selected</option>
                            @foreach($cat as $data)
                              <option value="{{$data->id}}" {{(in_array($data->id,$array)) ? "selected" : " "}} > {{$data->name}}</option>
                            @endforeach
                        </select>
                      </div>
                      
                      <button type="submit" class="btn btn-primary">Submit</button>
                    </form>

                </div>
          </div>
        </div>
    </div>
</div>
@endsection