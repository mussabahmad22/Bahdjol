<?php
$pagename="admin_dashboard";
?>
@include('layouts.header')

<div class="grid grid-cols-12 gap-6">
    <div class="col-span-12 xxl:col-span-9 grid grid-cols-12 gap-6">
        <!-- BEGIN: General Report -->
        <div class="col-span-12 mt-8">
            <div class="intro-y flex items-center h-10">
                <h2 class="text-lg font-medium truncate mr-5">
                    General Report
                </h2>
                <a href="" class="ml-auto flex text-theme-1 dark:text-theme-10"> <i data-feather="refresh-ccw"
                        class="w-4 h-4 mr-3"></i> Reload Data </a>
            </div>
            <div class="grid grid-cols-12 gap-6 mt-5">
                <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y" onclick="window.location.href='users'">
                    <div class="report-box zoom-in">
                        <div class="box p-5">
                            <div class="flex">
                                <i data-feather="users" class="report-box__icon text-theme-10"></i>
                            </div>
                            <div class="text-3xl font-bold leading-8 mt-6">{{$users}}</div>
                            <div class="text-base text-gray-600 mt-1">Users</div>
                        </div>
                    </div>
                </div>
                <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y" onclick="window.location.href='agents'">
                    <div class="report-box zoom-in">
                        <div class="box p-5">
                            <div class="flex">
                                <i data-feather="users" class="report-box__icon text-theme-12"></i>

                            </div>
                            <div class="text-3xl font-bold leading-8 mt-6">{{$agent}}</div>
                            <div class="text-base text-gray-600 mt-1">Agents</div>
                        </div>
                    </div>
                </div>
                <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y"
                    onclick="window.location.href='categories'">
                    <div class="report-box zoom-in">
                        <div class="box p-5">
                            <div class="flex">
                                <i data-feather="layers" class="report-box__icon text-theme-11"></i>

                            </div>
                            <div class="text-3xl font-bold leading-8 mt-6">{{$cat}}</div>
                            <div class="text-base text-gray-600 mt-1">Service Categories</div>
                        </div>
                    </div>
                </div>
                <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y" onclick="window.location.href='booking'">
                    <div class="report-box zoom-in">
                        <div class="box p-5">
                            <div class="flex">
                                <i data-feather="box" class="report-box__icon text-theme-12"></i>

                            </div>
                            <div class="text-3xl font-bold leading-8 mt-6">{{$booking}}</div>
                            <div class="text-base text-gray-600 mt-1">Total Bookings</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>

</div>
</div>
<!-- END: Content -->
</div>
<script
    src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=[" your-google-map-api"]&libraries=places"></script>
<script src="dist/js/app.js"></script>
<!-- END: JS Assets-->
</body>

@include('layouts.footer')