@extends('layouts.app')
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header"> Admin Dashboard <a href="{{route('product.create')}}">Create</a>
                </div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Sr no</th>
                            <th>Title</th>
                            <th>price</th>
                            <th>Category</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($product as $key=>$value)
                        <tr>
                            <td>{{++$key}}</td>
                            <td>{{$value->title}}</td>
                            <td>{{$value->price}}</td>
                            <td>
                                @foreach($value->catdept as $data)
                                    {{$data->cat->name}},
                                @endforeach
                                
                            </td>
                            <td>{{date("d/m/Y",strtotime($value->created_at))}}</td>
                            <td>
                                <a class="btn btn-success" href="{{route('product.edit',$value->id)}}">Edit</a>
                                <form action="{{ route('product.destroy',$value->id) }}" method="POST">
                                   @csrf
                                 @method('DELETE')
                                <button type="submit" class="btn btn-danger">Delete</button>
                                </form>

                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                    </table>
                        
               </div>
            </div>
        </div>
    </div>
</div>
@endsection
<script>
    $(document).ready(function() {
    $('#example').DataTable();
} );
</script>