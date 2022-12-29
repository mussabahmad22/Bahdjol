<?php
$pagename="subscription";
?>
@include('layouts.header')

{{-- <div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
        Subscription Packages
    </h2>
</div> --}}
<div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
        Subscription Packages
    </h2>

    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
        <button style="border:none;" type="button" class="button text-white bg-theme-42 shadow-md mr-2"><a
                class=" flex items-center " href="javascript:;" data-toggle="modal" data-target="#addmodal">
                +Add
                Plans </a>
        </button>
    </div>


    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">

    </div>
</div>

<div class="w-full sm:w-auto flex mt-4 sm:mt-0">

</div>
<br>
<div class="table-responsive p-0">

   <!-- BEGIN: Datatable -->
<div class="intro-y datatable-wrapper box p-5 mt-1">
    <table id="categorytbl" class="table table-report  table-report--bordered display w-full">
        <thead>
                <tr>
                    <th class="border-b-2  whitespace-no-wrap">
                        Sr.</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Package Name*</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Package Price*</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Number Of Orders*</th> 

                    <th class="border-b-2  whitespace-no-wrap">
                        Duration*</th>   

                    <th class="border-b-2  whitespace-no-wrap">
                        Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php  $i = 0; ?>
                @foreach($query as $que)
                <?php $i++; ?>
                <tr>
                    <th scope="row">{{ $i }}</th>
                    <td>
                        <?= $que->package_name ?>
                    </td>
                    <td>
                       $ <?= $que->package_price?>
                    </td>
                    <td>
                        <?= $que->total_orders?>
                    </td>
                    <td>
                        <?= $que->duration?> Month
                    </td>
                    <td>
                        <button style="border:none;" type="button" value="{{$que->id}}" class="editbtn btn"><a
                                class="flex items-center text-theme-1 mr-3  " data-toggle="modal" data-target="#updatemodal"
                                href="javascript:;"><i data-feather="edit" class="w-4 h-4 mr-1"></i>
                                Edit </a></button>
                        <button style="border:none;" type="button" value="{{$que->id}}" class="deletebtn btn"><a
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
            <form type="submit" action="{{route('subscription_delete')}}" method="post">
                @csrf
                @method('DELETE')
                <input type="hidden" name="delete_sub_category_id" id="deleting_id"></input>
                <button type="button" data-dismiss="modal" class="button w-24 border text-gray-700 mr-1">Cancel</button>
                <button type="submit" class="button w-24 bg-theme-6 text-white p-3 pl-5 pr-5">Delete</button>
            </form>
        </div>
    </div>
</div>
<!-- ==============================ADD Subscriptions Modal============================================ -->

<div class="modal" id="addmodal">
    <div class="modal__content">
        <div class="p-5 text-center">
            <div class="text-3xl mt-5">Add Subscriptions Package</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('addpkg')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Package Name*</div>

                    <input type="text" class="input w-full border flex-1" name="package_name" required>
                    <span class="text-theme-6">
                        @error('package_name')
                        {{'Package Name is required'}}
                        @enderror
                    </span>
                </div>
           
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Package Price*</div>
                    <input class="input w-full border flex-1" type="number" name="price" step="any" required>
                    <span class="text-theme-6">
                        @error('price')
                        {{ 'Package Price is required' }}
                        @enderror
                    </span>
                </div>

                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Number Of Orders*</div>
                    <input class="input w-full border flex-1" type="number" name="total_orders" step="any" required>
                    <span class="text-theme-6">
                        @error('total_orders')
                        {{ 'This Feild is required' }}
                        @enderror
                    </span>
                </div>

                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Duration*</div>
                    <input class="input w-full border flex-1" type="number" name="duration" step="any" required>
                    <span class="text-theme-6">
                        @error('duration')
                        {{ 'This Feild is required' }}
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
            <div class="text-3xl mt-5">Edit Subscriptions Plan</div>

        </div>
        <div class="px-5 pb-8 ">
            <form type="submit" action="{{route('updatepkg')}}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="query_id" id="query_id"></input>
               
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2">Package Name*</div>

                    <input type="text" class="input w-full border flex-1" name="package_name" id="package_name" required>
                    <span class="text-theme-6">
                        @error('package_name')
                        {{'Package Name is required'}}
                        @enderror
                    </span>
                </div>
           
                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Package Price*</div>
                    <input class="input w-full border flex-1" type="number" name="price" id="price" step="any" required>
                    <span class="text-theme-6">
                        @error('price')
                        {{ 'Package Price is required' }}
                        @enderror
                    </span>
                </div>

                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Number Of Orders*</div>
                    <input class="input w-full border flex-1" type="number" name="total_orders" id="total_orders" step="any"  required>
                    <span class="text-theme-6">
                        @error('total_orders')
                        {{ 'This Feild is required' }}
                        @enderror
                    </span>
                </div>

                <div class="intro-y col-span-12 sm:col-span-6 px-2">
                    <div class="mb-2 mt-3 ">Duration*</div>
                    <input class="input w-full border flex-1" type="number" name="duration" id="duration" step="any"  required>
                    <span class="text-theme-6">
                        @error('duration')
                        {{ 'This Feild is required' }}
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
                url: "edit_subscription/" + query_id,
                success: function (response) {
                    console.log(response);
                    $('#query_id').val(query_id);
                    $('#package_name').val(response.subs.package_name);
                    $('#price').val(response.subs.package_price);
                    $('#total_orders').val(response.subs.total_orders);
                    $('#duration').val(response.subs.duration);
                }
            });

        });
    });
</script>
    @include('layouts.footer')