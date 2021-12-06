@extends('backend.layouts.master')
@section('content')
<div class="modal fade" id="modal-group-promocodes"  role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Thêm nhóm mã giảm giá</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.discountcode.addGroupPromocodes') }}" method="POST">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}" />
                       <div class="row">
                            <div class="form-group col-md-8">
                                <label class="required">Nhóm mã</label>
                                <input name="name" type="text" class="form-control" required="required" value="{!!old('name')!!}">
                               
                            </div>
                        </div>

                        <div class="text-right">
                            <button type="submit" class="btn btn-primary legitRipple">{{trans('base.submit')}} <i class="icon-arrow-right14 position-right"></i></button>
                        </div>
                </form>
            </div>

        </div>

    </div>
</div>
<div class="page-header">
    <div class="page-header-content">
        <div class="page-title">
            <h4><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">Thêm mã giảm giá</span></h4>
            <a class="heading-elements-toggle"><i class="icon-more"></i></a>
        </div>
    </div>
    <div class="breadcrumb-line breadcrumb-line-component"><a class="breadcrumb-elements-toggle"><i class="icon-menu-open"></i></a>
        <ul class="breadcrumb">
            <li><a href="{!!route('admin.index')!!}"><i class="icon-home2 position-left"></i>{{trans('base.system')}}</a></li>
            <li><a href="###">Mã giảm giá</a></li>

        </ul>
    </div>
</div>
<div class="content">
    <form action="{{ route('admin.discountcode.store') }}" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="_token" value="{!! csrf_token() !!}" />
        <div class="panel panel-body results">
            <div class="row">
                <div class="col-md-12">
                    <fieldset>
                        <legend class="text-semibold"><i class="icon-reading position-left"></i>Thêm mã giảm giá</legend>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label class="required">Số lượng mã</label>
                                <input name="qty" type="number" class="form-control" value="{!!old('qty')!!}">
                                {!! $errors->first('qty', '<span class="text-danger">:message</span>') !!}
                            </div>
                          
                            <div class="form-group col-md-4">
                                <label class="">Nhóm mã giảm giá</label>
                                <select name="id_group" class="form-control select2">
                                    @foreach($group as $gr)
                                    <option value="{{ $gr->id }}"  {{(old('id_type')==$gr->id)?'selected':''}}>{!!$gr->name!!}</option>
                                    @endforeach
                                </select>

                            </div>
                             <div class="col-md-1">
                              <a id="button-manufacturer" class="btn btn-link btn-float text-size-small has-text legitRipple text-slate" data-toggle="modal" data-target="#modal-group-promocodes" style="    bottom: -30px;">       
                                <i class="icon-plus-circle2 text-primary"></i><span></span>
                            </a>
                            </div>

                        </div>
                        <div class="row">
                             <div class="form-group col-md-2">
                              <label class="control-label">Loại</label>
                                <select name="type" class="form-control select2">
                                   
                                    <option value="0" >Tiền $</option>
                                    <option value="1" >Phần trăm %</option>
                                   
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label class="required">Giá trị</label>
                                <input name="value" type="number" min="0" class="form-control" value="{!!old('value')!!}">
                                {!! $errors->first('value', '<span class="text-danger">:message</span>') !!}
                            </div>
                            
                            <div class="col-md-4">
                            <label class="control-label required">Hạn sử dụng</label>

                               <input type="text" class="form-control datepicker" name="expiration_date">
                               {!! $errors->first('expiration_date', '<span class="text-danger">:message</span>') !!}
                          </div>
                        </div>
                     
                       
                    
                    </fieldset>
                </div>


            </div>
            <div class="text-right">
                <button type="submit" class="btn btn-primary legitRipple">{{trans('base.submit')}} <i class="icon-arrow-right14 position-right"></i></button>
            </div>


        </div>
    </form>


</div>
@stop
@section('script')
<script >$('.select2').select2({});</script>

<script>
    $(document).on('change', 'select[name=type]', function(){
       if ($('select[name=type]').val()==1) {

         $('input[name=value]').attr('max',"100");
       }
  });
</script>
@stop

