 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
<style>
.product_view .modal-dialog{max-width: 800px; width: 100%;}
.pre-cost{text-decoration: line-through; color: #a5a5a5;}
.space-ten{padding: 10px 0;}


.image {
  width: 100%;
  height: 200px;
}


</style>
 
<!------ Include the above in your HEAD tag ---------->
 <div class="container">
    <div class="row">
        @foreach($product as $data)
        <?php $img = json_decode($data->image);
        ?>
        <div class="col-md-4">
              <div class="thumbnail">
                <img src="{{url('/')}}/product/{{$img[0]}}" alt="" class="img-responsive">
                <div class="caption">
                  <h4 class="pull-right">{{$data->price}}</h4>
                  <h4><a href="#">{{$data->title}}</a></h4>
                  <p> {{$data->description}}</p>
                </div>
                <div class="ratings">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                     (15 reviews)
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                    <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view_{{$data->id}}"><i class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
        </div>

        <div class="modal fade product_view_{{$data->id}}" id="product_view_{{$data->id}}">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                        <h3 class="modal-title">{{$data->title}}</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 ">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        @foreach($img as $key => $dataimg)
            @if($key == 0 )
            <div class="item active">
                <img src="{{url('/')}}/product/{{$dataimg}}" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>India</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
            </div>
            @else
            <div class="item">
                <img src="{{url('/')}}/product/{{$dataimg}}" alt="Chania" width="460" height="345">
            </div>  
            @endif
        @endforeach
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> 
                                
                            </div>
                            <div class="col-md-6 product_content">
                                <h4>Product Id: <span>51526</span></h4>
                                <div class="rating">
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    (10 reviews)
                                </div>
                                <p>{{$data->description}}</p>
                                <h3 class="cost"><span class="glyphicon glyphicon-usd"></span> <span id="span-{{$data->id}}">{{$data->price}} </span> </h3>
                                <div class="row">
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <select class="form-control" name="select" onchange="getval('{{$data->id}}','{{$data->price}}',this)">
                                            <option value="" selected="">Catergory</option>
                                                @foreach($data->catdept as $catdata)
                                            <option value="{{$catdata->cat->price}}">{{$catdata->cat->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <!-- end col -->
                                   
                                </div>
                                <div class="space-ten"></div>
                                <div class="btn-ground">
                                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</button>
                                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-heart"></span> Add To Wishlist</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        @endforeach

        {{ $product->links() }}
    </div>
</div>

 <script>
    function getval(id,price,ele)
    {
       var catval = ele.value;
       var totalamount =  parseInt(catval) + parseInt(price); 
       $('#span-'+id).text(totalamount);
    }


 </script>