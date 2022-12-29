<?php
$pagename="category";
?>
@include('layouts.header')
<div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
     Sub-Categories of Services
    </h2>
    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
        <button class="button text-white bg-theme-42 shadow-md mr-2"><a href="{{route('showsubCategory',['id' =>$cat->id])}}">Manage Service
                Sub-Category</a></button>
    </div>
    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">

    </div>
</div>

<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 xxl:col-span-9 grid grid-cols-12 gap-6">
        <!-- BEGIN: General Report -->
        <div class="col-span-12 mt-2">

            <div class="grid grid-cols-12 gap-6 mt-5">
                @foreach($sub_categories as $cat)
                <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y" >
                    <div class="report-box zoom-in">
                        <div class="box p-5">
                            <div class="flex">
                                <i data-feather="list" class="report-box__icon text-theme-12"></i>

                            </div>
                            <div class="text-3xl font-bold leading-8 mt-6">{{$cat->subcategory_name}}</div>
                            <div class="text-base text-gray-600 mt-1">Sub-Category</div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>

    </div>
</div>
</div>
@include('layouts.footer')