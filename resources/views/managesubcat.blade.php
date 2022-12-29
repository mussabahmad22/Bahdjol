<?php
$pagename="category";
?>
@include('layouts.header')

<div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
        Sub-categories of Services
    </h2>
    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
        <button style="border:none;" type="button" class="button text-white bg-theme-42 shadow-md mr-2"><a
                class=" flex items-center " href="javascript:;" data-toggle="modal" data-target="#addmodal">
                +Add
                Sub-Categories </a>
        </button>
    </div>

    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">

    </div>
</div>
<!-- BEGIN: Datatable -->
<div class="intro-y datatable-wrapper box p-5 mt-1">
    <table id="categorytbl" class="table table-report  table-report--bordered display w-full">
        <thead>
            <tr>
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Sr.</th>
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Sub-Category Name</th>

                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Image</th>

                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Price $</th>
                {{-- <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Retail Price $</th> --}}
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Subscription Fees $</th>
                    
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Description </th>


                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php  $i = 0; ?>
            @foreach($sub_categories as $value)
            <?php $i++; ?>
            <tr>
                <th scope="row">{{ $i }}</th>
                <td>
                    {{ $value->subcategory_name }}
                </td>
                <td>
                    <img src="{{asset('public/storage/'. $value->img)}}" width="50" height="50">
                </td>
                <td>
                    {{ $value->price }} $
                </td>
                <td>
                    {{ $value->subscription_fee }} $
                </td>
                <td>
                    {{ $value->sub_desc }}
                </td>
                <td>
                    <button style="border:none;" type="button" value="{{$value->id}}" class="editbtn btn"><a
                            class="flex items-center text-theme-1 mr-3  " data-toggle="modal" data-target="#updatemodal"
                            href="javascript:;"><i data-feather="edit" class="w-4 h-4 mr-1"></i>
                            Edit </a></button>
                    <button style="border:none;" type="button" value="{{$value->id}}" class="deletebtn btn"><a
                            class=" flex items-center text-theme-6" href="javascript:;" data-toggle="modal"
                            data-target="#delete-modal-preview"> <i data-feather="trash-2" class="w-4 h-4 mr-1"></i>
                            Delete </a>
                    </button>
                </td>
            </tr>
            @endforeach

        </tbody>
    </table>
</div>
<!-- //======================Delete Sub-Category Modal================================= -->
<div class="modal" id="delete-modal-preview">
    <div class="modal__content">
        <div class="p-5 text-center">
            <i data-feather="x-circle" class="w-16 h-16 text-theme-6 mx-auto mt-3"></i>
            <div class="text-3xl mt-5">Are you sure?</div>
            <div class="text-gray-600 mt-2">Do you really want to delete these records? This process cannot be
                undone.
            </div>
        </div>
        <div class="px-5 pb-8 text-center">
            <form type="submit" action="{{route('sub_category_delete')}}" method="post">
                @csrf
                @method('DELETE')
                <input type="hidden" name="delete_sub_category_id" id="deleting_id"></input>
                <button type="button" data-dismiss="modal" class="button w-24 border text-gray-700 mr-1">Cancel</button>
                <button type="submit" class="button w-24 bg-theme-6 text-white p-3 pl-5 pr-5">Delete</button>
            </form>
        </div>
    </div>
</div>
<!-- ==============================ADD Sub-Category Modal============================================ -->

<div class="modal" id="addmodal">
    <div class="modal__content">
        <div class="p-5 text-center">
            <div class="text-3xl mt-5">Add Sub-Category</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('addSubCategory')}}" method="post" enctype="multipart/form-data">
                @csrf
                <input type="hidden" class="form-control" id="cat_id" name="cat_id" value="{{ $cat->id }}">
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Sub-Category Name*</div>

                    <input type="text" class="input w-full border flex-1" name="subcategory_name" required>
                    <span class="text-theme-6">
                        @error('subcategory_name')
                        {{'Category Name is required'}}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Image*</div>
                    <input class="input w-full border flex-1" type="file" name="img" accept="image/*" required>
                    <span class="text-theme-6">
                        @error('img')
                        {{ 'Sub-Category Image is required' }}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Price*</div>
                    <input class="input w-full border flex-1" type="number" name="price" step="any" required>
                    <span class="text-theme-6">
                        @error('price')
                        {{ 'Sub-Category Price is required' }}
                        @enderror
                    </span>
                </div>
                {{-- <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Retail Price*</div>
                    <input class="input w-full border flex-1" type="number" name="retail_price" step="any" required>
                    <span class="text-theme-6">
                        @error('retail_price')
                        {{ 'Sub-Category retail_price is required' }}
                        @enderror
                    </span>
                </div> --}}
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Subscription Fee</div>
                    <input class="input w-full border flex-1" type="number" name="subscription_fee" step="any" required>
                    <span class="text-theme-6">
                        @error('subscription_fee')
                        {{ 'Sub-Category subscription_fee is required' }}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Description*</div>
                    <textarea class="input w-full border flex-1" type="text" name="sub_desc" step="any"
                        required></textarea>
                    <span class="text-theme-6">
                        @error('sub_desc')
                        {{ 'Sub-Category Price is required' }}
                        @enderror
                    </span>
                </div>


                <div class="text-center">
                    <button type="button" data-dismiss="modal"
                        class="button w-24 border text-gray-700 mr-1 mt-6">Cancel</button>
                    <button type="submit" class="button w-24 bg-theme-42 text-white  pl-5 pr-5">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- ======================== Update Sub-Category Modal==================================== -->
<div class="modal" id="updatemodal">
    <div class="modal__content">
        <div class="p-5 text-center">
            <div class="text-3xl mt-5">Edit Sub-Category</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('sub_category_update')}}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="query_id" id="query_id"></input>
                <input type="hidden" class="form-control" id="cat_id" name="cat_id" value="{{ $cat->id }}">
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Sub-Category Name*</div>

                    <input type="text" class="input w-full border flex-1" name="sub_category_name" id="sub_cat_name"
                        required>
                    <span class="text-theme-6">
                        @error('sub_category_name')
                        {{'Category Name is required'}}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Image*</div>
                    <input class="input w-full border flex-1" type="file" name="img" accept="image/*">
                    <span class="text-theme-6">
                        @error('img')
                        {{ 'Sub-Category Image is required' }}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Price*</div>
                    <input class="input w-full border flex-1" type="number" name="price" id="price" step="any" required>
                    <span class="text-theme-6">
                        @error('price')
                        {{ 'Sub-Category Price is required' }}
                        @enderror
                    </span>
                </div>
                {{-- <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Retail Price*</div>
                    <input class="input w-full border flex-1" type="number" name="retail_price" id="retail_price"
                        step="any" required>
                    <span class="text-theme-6">
                        @error('retail_price')
                        {{ 'Sub-Category retail_price is required' }}
                        @enderror
                    </span>
                </div> --}}
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Subscription Fee</div>
                    <input class="input w-full border flex-1" type="number" name="subscription_fee" id="fees" required>
                    <span class="text-theme-6">
                        @error('subscription_fee')
                        {{ 'Sub-Category subscription_fee is required' }}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Sub-Category Description*</div>
                    <textarea class="input w-full border flex-1" type="text" name="sub_desc" id="desc"
                        required></textarea>
                    <span class="text-theme-6">
                        @error('sub_desc')
                        {{ 'Sub-Category Price is required' }}
                        @enderror
                    </span>
                </div>
                <div class="text-center">
                    <button type="button" data-dismiss="modal"
                        class="button w-24 border text-gray-700 mr-1 mt-6">Cancel</button>
                    <button type="submit" class="button w-24 bg-theme-42 text-white  pl-5 pr-5">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        $(document).ready(function () {
            $('#categorytbl').DataTable();
        });

        //===================Script For Delete Sub-Category ====================================
        $(document).on('click', '.deletebtn', function () {
            var query_id = $(this).val();
            $('#deleting_id').val(query_id);
        });

        //===================Script For Edit Sub-Category ====================================
        $(document).on('click', '.editbtn', function () {
            var query_id = $(this).val();
            console.log(query_id);


            $.ajax({
                type: "GET",
                url: "edit_sub_category/" + query_id,
                success: function (response) {
                    console.log(response);
                    $('#query_id').val(query_id);
                    $('#sub_cat_name').val(response.subcategory.subcategory_name);
                    $('#price').val(response.subcategory.price);
                    // $('#retail_price').val(response.subcategory.retail_price);
                    $('#fees').val(response.subcategory.subscription_fee);
                    $('#desc').val(response.subcategory.sub_desc);
                }
            });

        });
    });
</script>

@include('layouts.footer')