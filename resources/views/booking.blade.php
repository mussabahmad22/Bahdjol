<?php
$pagename="booking";
?>
@include('layouts.header')

<div class="intro-y flex flex-col sm:flex-row items-center mt-8">
    <h2 class="text-lg font-medium mr-auto ml-2">
        Booking List of Users
    </h2>

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
                        Status</th>
                    <th class="border-b-2  whitespace-no-wrap">
                        View Details</th>

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
                        <?= $que->name ?>
                    </td>
                    <td>
                        <?= $que->booking_desc ?>
                    </td>
                    <td>
                        <?= $que->category_name ?>
                    </td>
                    <td>
                        <?= $que->subcategory_name ?>
                    </td>
                    <td>
                        <select name="status" onchange="changeStatus({{$que->id}},this.value)" class=" border-0 " id=""
                            class="category" aria-label value="">
                            <option value="0" name="status_value" <?php echo ( $que->status ==
                                0)?'selected' : ""; ?> >Pending</option>

                            <option value="1" <?php echo ( $que->status == 1) ? 'selected' : "" ; ?>
                                >Confirmed
                            </option>

                            <option value="2" <?php echo ( $que->status == 2) ? 'selected' : "" ; ?>
                                >Cancelled
                            </option>
                            <option value="3" <?php echo ( $que->status == 3) ? 'selected' : "" ; ?>
                                >Completed
                            </option>
                        </select>
                    </td>
                    <td>
                        <a class="flex items-center text-theme-1 mr-3  text-primary" href="{{route('booking_details',['id' => $que->id])}}">
                            <i data-feather="eye" class="w-4 h-4 mr-1"></i> view </a>
                    </td>
                    <td>
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
    <!-- Modal -->

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
                <form type="submit" action="{{route('delete_booking')}}" method="post">
                    @csrf
                    @method('DELETE')
                    <input type="hidden" name="delete_book_id" id="deleting_id"></input>
                    <button type="button" data-dismiss="modal"
                        class="button w-24 border text-gray-700 mr-1">Cancel</button>
                    <button type="submit" class="button w-24 bg-theme-6 text-white p-3 pl-5 pr-5">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function () {
        $('#myTable').DataTable();
    });

    function changeStatus(id, val) {
        console.log(id);
        console.log(val);
        $.ajax({
            url: "{{route('status')}}",
            data: {
                id: id,
                val: val
            },
            success: function (result) {
                swal({
                    title: "Status Changed",
                    text: "You have Successfully Change this Status",
                    icon: "success",
                    button: "OK",
                });
            }
        });
    }

    $(document).on('click', '.deletebtn', function () {
        var book_id = $(this).val();
        $('#deleting_id').val(book_id);
    });
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
@include('layouts.footer')