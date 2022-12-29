<?php
$pagename="booking";
?>
@include('layouts.header')

<div class="intro-y flex items-center mt-8">
    <h2 class="text-lg font-medium ml-3">
        Booking Details
    </h2>
</div>

<div class="intro-y box pb-10">
    <div class="px-5 sm:px-20 mt-10 pt-10 border-t border-gray-200">
        <h1 class="text-lg font-bold ">
            Customer Information :-
        </h1>
        <div class="card-header pb-0 px-0 mt-5">
            <h7> <strong>Customer Name :-</strong> </h7> &nbsp;&nbsp;&nbsp;&nbsp;
            <?= $query->name ?><br>
            <h7> <strong>Last Name :-</strong> </h7> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <?= $query->last_name ?><br>
            <h7> <strong>Address :-</strong> </h7> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <?= $query->address ?><br>
            <h7> <strong>Contact Number :-</strong> </h7> &nbsp;&nbsp;&nbsp;
            <?= $query->phone ?><br>
            <h7> <strong>Customer Email :- </strong></h7> &nbsp;&nbsp;&nbsp;&nbsp;
            <?= $query->email ?> <br>
            <h7> <strong>Order Date :- </strong></h7> &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <?= $query->date ?><br>
            <h7> <strong>Order Time :- </strong></h7> &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <?= $query->time ?>
        </div>
    </div>
</div>

<div class="table-responsive p-0">

    <!-- BEGIN: Datatable -->
    <div class="intro-y datatable-wrapper box p-5 mt-1">
        <table id="myTable" class="table table-report table-report--bordered display w-full ">
            <thead>
                <tr>
                    <th class="border-b-2  whitespace-no-wrap">
                        Sr.</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        User Name</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Booking Description*</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Service Category*</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Service Subcategory*</th>

                    <th class="border-b-2  whitespace-no-wrap">
                        Booking Price $</th>
                    <th class="border-b-2  whitespace-no-wrap">
                        Agent</th>
                    <th class="border-b-2  whitespace-no-wrap">
                        User Rating</th>
                    <th class="border-b-2  whitespace-no-wrap">
                        Agent Rating</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <th scope="row">1</th>
                    <td>
                        <?= $query->name ?>
                    </td>
                    <td>
                        <?= $query->booking_desc ?>
                    </td>
                    <td>
                        <?= $query->category_name ?>
                    </td>
                    <td>
                        <?= $query->subcategory_name ?>
                    </td>
                    <td>
                        <?= $query->booking_price ?> $
                    </td>
                    <!-- <td>
                        <select name="status" onchange="changeStatus({{$query->id}},this.value)" class=" border-0 "
                            id="" class="category" aria-label value="">
                            <option disabled selected>Select Agent</option>
                            @foreach($agents as $agent)

                            <option value="{{ $agent->id }}" <?php echo ( $query->agent_id == $agent->id ) ? 'selected'
                                : ""; ?>>{{
                                $agent->agent_name}}</option>

                            @endforeach
                        </select>
                    </td> -->
                    <td>
                        <select name="status" class=" border-0 "
                            id="" class="category" aria-label value="">
                            <option disabled selected>Select Agent</option>
                            @foreach($agents as $agent)

                            <option value="{{ $agent->id }}" <?php echo ( $query->agent_id == $agent->id ) ? 'selected'
                                : ""; ?>>{{
                                $agent->agent_name}}</option>

                            @endforeach
                        </select>
                    </td>
                  
                    <td>
                        <?= is_null($user_rate) ? '0' : $user_rate->ratings ?>  &starf;
                    </td>
                    <td>
                        <?= is_null($agent_rate) ? '0' : $agent_rate->ratings ?> &starf;
                    </td>
                </tr>
            </tbody>

        </table>
    </div>
    <!-- <script>
        function changeStatus(id, val) {
            console.log(id);
            console.log(val);
            $.ajax({
                url: "{{route('agent_assign')}}",
                data: {
                    id: id,
                    val: val
                },
                success: function (result) {
                    swal({
                        title: "Assigned Agent",
                        text: "You have Successfully Assigned Agent",
                        icon: "success",
                        button: "OK",
                    });
                }
            });
        }


    </script> -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    @include('layouts.footer')