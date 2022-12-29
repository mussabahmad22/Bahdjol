<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->default("");
            $table->foreignId('cat_id')->constrained('all_categories')->default("");
            $table->foreignId('subcat_id')->constrained('sub_categories')->default("");
            $table->String('booking_desc');
            $table->double('lat');
            $table->double('long');
            $table->integer('status')->default('0');
            $table->String('date');
            $table->String('time');
            $table->String('booking_price');
            $table->foreignId('agent_id')->constrained('agents')->default(NULL);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
}
