<?php
$pagename="category";
?>
@include('layouts.header')

<div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
        Categories Of Services
    </h2>
    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
        <button style="border:none;" type="button" class="button text-white bg-theme-42 shadow-md mr-2"><a
                class=" flex items-center " href="javascript:;" data-toggle="modal" data-target="#addmodal">
                +Add
                Categories </a>
        </button>
    </div>


    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">

    </div>
</div>
<!-- BEGIN: Datatable -->
<div class="intro-y datatable-wrapper box p-5 mt-5">
    <table class="table table-report table-report--bordered display datatable w-full">
        <thead>
            <tr>
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Sr.</th>
                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Category Name</th>

                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Image</th>

                <th class="border-b-2  whitespace-no-wrap whitespace-no-wrap">
                    Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php  $i = 0; ?>
            @foreach($category as $value)
            <?php $i++; ?>
            <tr>
                <th scope="row">{{ $i }}</th>
                <td>
                    {{ $value->category_name }}
                </td>
                <td>
                    <img src="{{asset('public/storage/'. $value->img)}}" width="50" height="50">
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
</div>
<!-- //======================Delete Category Modal================================= -->
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
            <form type="submit" action="{{route('category_delete')}}" method="post">
                @csrf
                @method('DELETE')
                <input type="hidden" name="delete_category_id" id="deleting_id"></input>
                <button type="button" data-dismiss="modal" class="button w-24 border text-gray-700 mr-1">Cancel</button>
                <button type="submit" class="button w-24 bg-theme-6 text-white p-3 pl-5 pr-5">Delete</button>
            </form>
        </div>
    </div>
</div>
<!-- ==============================ADD Category Modal============================================ -->
<div class="modal" id="addmodal">
    <div class="modal__content">
        <div class="p-5 text-center">
            <div class="text-3xl mt-5">Add Category</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('addCategory')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Category Name*</div>

                    <input type="text" class="input w-full border flex-1" name="category_name" required>
                    <span class="text-theme-6">
                        @error('category_name')
                        {{'Category Name is required'}}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3">Category Image*</div>
                    <input class="input w-full border flex-1" type="file" name="img" accept="image/*" required>
                    <span class="text-theme-6">
                        @error('img')
                        {{ 'Category Image is required' }}
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
<!-- ======================== Update Category Modal==================================== -->

<div class="modal" id="updatemodal">
    <div class="modal__content">
        <div class="p-5 text-center">
            <div class="text-3xl mt-5">Edit Category</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('category_update')}}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="query_id" id="query_id"></input>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Category Name*</div>

                    <input type="text" class="input w-full border flex-1" name="category_name" id="cat_name" required>
                    <span class="text-theme-6">
                        @error('category_name')
                        {{'Category Name is required'}}
                        @enderror
                    </span>
                </div>
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3">Category Image*</div>
                    <input class="input w-full border flex-1" type="file" name="img" accept="image/*">
                    <span class="text-theme-6">
                        @error('img')
                        {{ 'Category Image is required' }}
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

        //===================Script For Edit Category ====================================
        $(document).on('click', '.editbtn', function () {
            var query_id = $(this).val();
            console.log(query_id);


            $.ajax({
                type: "GET",
                url: "edit_category/" + query_id,
                success: function (response) {
                    console.log(response);
                    $('#query_id').val(query_id);
                    $('#cat_name').val(response.category.category_name);
                }
            });

        });

        $(document).ready(function () {
            $('#categorytbl').DataTable();
        });

        //================delete category ==========================
        $(document).on('click', '.deletebtn', function () {
            var query_id = $(this).val();
            $('#deleting_id').val(query_id);
        });
    });
</script>
@include('layouts.footer')