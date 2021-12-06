@extends('backend.layouts.master')
@section('content')
<!-- Dashboard content -->




   <div class="page-header">

    <div style="margin: 15px 0;" class="breadcrumb-line breadcrumb-line-component"><a class="breadcrumb-elements-toggle"><i class="icon-menu-open"></i></a>
            <ul class="breadcrumb">
                <li><a href="{!!route('admin.index')!!}"><i class="icon-home2 position-left"></i>{{trans('base.system')}}</a></li>
                <li><a href="">Báo cáo tồn kho</a></li>

            </ul>
        </div>
   </div>
   <div class="panel panel-flat">
            <div class="panel-heading">
                <div class="heading-elements">
                    <ul class="icons-list">
                        <li><a data-action="collapse"></a></li>
                        <li><a data-action="reload"></a></li>
                        
                    </ul>
                </div>
            </div>
         
        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
          <div id="app" class="chart ">
            {!! $chart->container() !!}
          </div>
          </div>

        </div>
</div>
 <div class="panel panel-flat">
  
            <div class="panel-heading "> 
                <h5 class="panel-title col-md-6">Danh sách sản phẩm</h5>
                   <div class="form-group col-md-6 text-right">
                    <form class="form-show col-md-5" action="{{ route('admin.report.inventory') }}" method="GET"> 
                      <div class=" ">
                      <select name="id_store" id="load" class="form-control select-search">
                          @foreach($store as $sto)
                           @if ($id_store==$sto->id)
                          <option value="{{ $sto->id }}" {{"selected= 'selected'"}}>{!!$sto->name!!}</option>
                          @else <option value="{{$sto->id}}" >{{$sto->name}}</option>
                          @endif
                          @endforeach
                      </select>
                    </div>
                    </form>
                  </div> 
            </div>   

            <table class="table datatable-basic">
                <thead>
                    <tr>
                    
                        <th width="5%">Mã Sản phẩm</th>
                        <th>Tên sản phẩm</th>
                       {{--  <th>Giới tính</th>
                        <th>Loại sản phẩm</th> --}}
                        <th>Số lượng tồn</th>
                        <th>Số lượng đang giao</th>
                        <th>Số lượng lỗi</th>
                        <th>Ảnh</th>
                        <th>Tình trạng</th>


                    </tr>
                </thead>

                <tbody>
                 @foreach($products as $key=>$value)
                    <tr>

                       
                       <th>{!!$value->id_product!!}</th>                     
                       <th><a href="#">{!!$value->name!!}</a></th>

                      @foreach ($pro_store as $pr_st)
                        @if ($id_store==$pr_st->id_store && $pr_st->id_product==$value->id_product)
                         <th>{!!$pr_st->number!!}</th>
                        @endif
                      @endforeach
                
                      
                       <th>{!!$value->number_tranf!!}</th>
                       <th>{!!$value->number_error!!}</th>
                       <th><img id="img_load" src="/{{$value->image}}" style="height: 50px; width: 50px;"> </th>
                       <th>
                        <a href="{{route('admin.products.changeStatus',['id'=>$value->id_product,'name'=>'new'])}}"> 
                       @if($value->new == 1)
                          <span class="label success" style="margin: 3px auto;">New</span>
                          @else
                          <span class="label label-default" style="margin: 3px auto;">New</span>
                       @endif
                     </a>
                     <a href="{{route('admin.products.changeStatus',['id'=>$value->id_product,'name'=>'hot'])}}"> 
                        @if($value->hot == 1)
                          <span class="label success">Hot</span>
                          @else
                          <span class="label label-default">Hot</span>
                       @endif
                     </a>
                       </th>
                     
 
                    </tr>
                    @endforeach
                </tbody>
            </table>

        </div>

@stop
@section('script')
@parent
<script src="{{ asset('assets/js/chart/chart.min.js') }}"></script>
        {!! $chart->script() !!}
<script>
      
 $('.select2').select2({});


</script>
<script>
    $('#load').change(function () {
        $('.form-show').submit();
    });





      $(document).on('change', '.product', function () {
  
        var id = $(this).val();
        var id_store = $('input[name=id_store1]').val();
        var i = $('.list-size-color').length;

            $(this).addClass('changed');
        $.ajax({
            url: '{{ asset('/api/getSizeAndColor') }}',
            method: 'POST',
            data: {
               id: id,
               i: i,
               id_store: id_store
            },
            success: function (html) {

              $('.content-add').each(function () {
                    if($(this).find('.changed').length>0){
                      $(this).find('.cont').remove();
                       $(this).find('.changed').removeClass('changed');
                       $(this).find('.list-size-color').append(html);
                    }
                    
                });
              
            }
        });
    });




  $(document).on('click', '.add', function () {
    var id_store = $('input[name=id_store1]').val();
       $.ajax({
            url: '{{ asset('/api/addSP') }}',
            method: 'POST',
            data: {
                id_store: id_store
            },
            success: function (html) {
               $('.list-add').append(html);
                $('.select').select2({});
            }
        });
  

    });

       

     
   
</script>

@stop