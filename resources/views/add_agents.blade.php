<?php
$pagename="agents";
?>
@include('layouts.header')
<style>
    /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
    #map {
        height: 300%;
        /* margin-left: 20%;
        margin-right: 20%; */
    }

    /* Optional: Makes the sample page fill the window. */
    /* html,
    body {
        height: 100%;
        margin: 0;
        padding: 0;
    } */

    .custom-map-control-button {

   
        background-color: #fff;
        border: 0;
        border-radius: 2px;
        box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
        margin: 35px;
        margin-left: 320px;
        margin-top: 10px;
        padding: 8px;
        font: 400 20px Roboto, Arial, sans-serif;
        overflow: hidden;
        height: 40px;
        cursor: pointer;
    }

    .custom-map-control-button:hover {
    
        background: #ebebeb;
    }
</style>

<div class="intro-y flex items-center mt-8">
    <h2 class="text-lg font-medium ml-3">
        {{$title}}
    </h2>
</div>

<div class="intro-y box pb-10">
    <div class="px-5 sm:px-20 mt-10 pt-10 border-t border-gray-200">
        <form action="{{$url}}" class="validate-form" method="post" enctype="multipart/form-data">
            @csrf
            <div class="intro-y box col-span-12 lg:col-span-8 p-5">
                <div class="grid grid-cols-12 gap-4 row-gap-5 mt-5">
                    <input type="hidden" class="form-control" id="query_id" name="agent_id"
                        value="{{ isset($agent->id)?$agent->id: ''  }}">
                    <div class="intro-y col-span-12 sm:col-span-6 px-2">
                        <div class="mb-2">Agent Name</div>
                        <input type="text" name="name" class="input w-full border flex-1"
                            value="{{ isset($agent->agent_name)?$agent->agent_name:'' }}"
                            placeholder="Enter the name..." required>
                        <span class="text-theme-6">
                            @error('name')
                            {{'Agent Name is required'}}
                            @enderror
                        </span>
                    </div>
                    <div class="intro-y col-span-12 sm:col-span-6 px-2">
                        <div class="mb-2">Address</div>


                        <!------------------- Google Map through google Api Key ---------------------->

                        <input id="pac-input" class="input border flex-1" type="text" placeholder="Search Box" />
                        <div class="container">
                            <div class="row">

                                <td>
                                    <label for="latitude">
                                        Latitude:
                                    </label>
                                    <input id="txtLat" name="lat" class="input border " size="14" type="text"
                                        style="color:rgb(89, 60, 255)"
                                        value="{{ isset($agent->lat)?$agent->lat:'' }}" />
                                    <label for="longitude" class="ml-6">
                                        Longitude:
                                    </label>
                                    <input id="txtLng" name="long" class="input border " size="15" type="text"
                                        style="color:rgb(89, 60, 255)"
                                        value="{{ isset($agent->longitude)?$agent->longitude:'' }}" />
                                    <div id="map_canvas" style="width: auto; height: 10px;">
                                    </div>
                                </td>

                            </div>
                        </div>
                        <!-- ---------------------------------Google Map Div-------------------------------------- -->

                        <div id="map"></div>

                    </div>

                    <div class="intro-y col-span-12 sm:col-span-6 px-2">
                        <div class="mb-2">Phone Number</div>
                        <input type="text" name="phone" class="input w-full border flex-1"
                            value="{{ isset($agent->agent_phone)?$agent->agent_phone:'' }}"
                            placeholder="Enter Number..." required>
                        <span class="text-theme-6">
                            @error('phone')
                            {{'Agent phone is required'}}
                            @enderror
                        </span>
                    </div>
                    <div class="intro-y col-span-12 sm:col-span-12 px-2">
                        <div class="mb-2">Email</div>
                        <input type="email" name="email" class="input  border flex-1" size="59"
                            value="{{ isset($agent->agent_email)?$agent->agent_email:'' }}" placeholder="Enter Email..."
                            required>
                        <span class="text-theme-6">
                            @error('email')
                            {{$message}}
                            @enderror
                        </span>
                    </div>
                    <div class="intro-y col-span-12 sm:col-span-12 px-2">
                        <div class="mb-2">Password</div>
                        <input type="password" name="password" id="password" class="input  border flex-1" size="59"
                            value="{{ isset($agent->password)?$agent->password:'' }}" placeholder="Enter Password..."
                            required>
                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        <span class="text-theme-6">
                            @error('email')
                            {{$message}}
                            @enderror
                        </span>
                    </div>
                    <script>
                        $(".toggle-password").click(function() {

                            $(this).toggleClass("fa-eye fa-eye-slash");
                           var input = $('#password');
                            if (input.attr("type") == "password") {
                            input.attr("type", "text");
                            } else {
                            input.attr("type", "password");
                            }
                        });
                    </script>


                    <div class="intro-y col-span-12 sm:col-span-12 px-2">
                        <td>
                            <select name="cat_id" id="" class="input w-full border flex-1" aria-label>
                                <option disabled selected>Select Service Category</option>
                                @foreach($categories as $cat)

                                <option value="{{ $cat->id }}" <?php if(isset($agent)) if($agent->cat_id == $cat->id) { echo 'selected'; } ?>
                                    >{{ $cat->category_name}}</option>

                                @endforeach
                            </select>
                            <span class="text-theme-6">
                                @error('cat_id')
                                {{ $message }}
                                @enderror
                            </span>
                        </td>
                    </div>
                    <div class="intro-y col-span-12 sm:col-span-12 px-2">

                        <td>
                            <select name="subcat_id" id="" class="input w-full border flex-1" aria-label>
                                <option disabled selected>Select Service Sub-Category</option>
                                @foreach($subcategories as $sub)

                                <option value="{{ $sub->id }}" <?php if(isset($agent)) if($agent->subcat_id ==  $sub->id) { echo 'selected'; } ?>
                                    >{{ $sub->subcategory_name}}</option>

                                @endforeach
                            </select>
                            <span class="text-theme-6">
                                @error('subcat_id')
                                {{ $message }}
                                @enderror
                            </span>
                        </td>

                    </div>

                    <div class="intro-y col-span-12 items-center justify-center sm:justify-end mt-5">
                        <button class="button w-full justify-center block bg-theme-1 text-white ml-2">{{$text}}</button>
                    </div>
                </div>
        </form>
    </div>
</div>

<!-- ------------------------Google API key.---------------------------------------------- -->
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHV-XgmBdUHICr4CzBrgDNNET1-qhjIPQ&callback=initMap&libraries=places">
    </script>

<!-------------------------- /Google Map through google Api Key ----------------------------->
<script type="text/javascript">
    var map;
    function initMap() {
        var myLatlng = new google.maps.LatLng(29.498684, 71.730617);
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: myLatlng,
            mapTypeId: map,
        });
        //---------------------------------Marker--------------------------------------------
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            draggable: true,
            title: "Marker"
        });

        //-------------------------------Find Current Location--------------------------------
        let infoWindow;
        infoWindow = new google.maps.InfoWindow();
        const locationButton = document.createElement("span");
        locationButton.textContent = "(+)";
        locationButton.classList.add("custom-map-control-button");
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
        locationButton.addEventListener("click", () => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                        };
                        infoWindow.open(map);
                        map.setCenter(pos);
                        marker.setPosition(pos);
                        $("#txtLat").val(marker.getPosition().lat().toFixed(6));
                        $("#txtLng").val(marker.getPosition().lng().toFixed(6));
                    },
                    () => {
                        handleLocationError(true, infoWindow, map.getCenter());
                    }
                );

            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
        });
        //------------------Get Lat and Long by dragable marker ----------------------------------------
        marker.addListener("dragend", () => {
            map.setZoom(18);
            map.setCenter(marker.getPosition());
            //-----------------------Move Marker And Get Lat Long --------------------------------------
            $("#txtLat").val(marker.getPosition().lat().toFixed(6));
            $("#txtLng").val(marker.getPosition().lng().toFixed(6));
        });
        //----------------------Set user Current Location By Default-------------------------------------
        if (navigator.geolocation) {
            /*
             * getCurrentPosition() takes a function as a callback argument
             * The callback takes the position object returned as an argument
             */
            navigator.geolocation.getCurrentPosition(function (position) {
                /**
                 * pos will contain the latlng object
                 * This must be passed into the setCenter instead of two float values
                 */
                var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                map.setCenter(pos); //center the map based on users location
                marker.setPosition(pos);
            }, function () {
                //client supports navigator object, but does not share their geolocation
            });
        } else {
            //client doesn't support the navigator object
        }
        //---------------------------------search Box----------------------------------------------------
        const input = document.getElementById("pac-input");
        const searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        // Bias the SearchBox results towards current map's viewport.
        map.addListener("bounds_changed", () => {
            searchBox.setBounds(map.getBounds());
        });
        let markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }
            // Clear out the old markers.
            markers.forEach((marker) => {
                marker.setMap(null);
            });
            markers = [];
            // For each place, get the icon, name and location.
            const bounds = new google.maps.LatLngBounds();
            places.forEach((place) => {
                if (!place.geometry || !place.geometry.location) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                // Create a marker for each place.
                marker.setPosition(place.geometry.location);
                $("#txtLat").val(marker.getPosition().lat().toFixed(6));
                $("#txtLng").val(marker.getPosition().lng().toFixed(6));
                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });
    }
</script>
@include('layouts.footer')