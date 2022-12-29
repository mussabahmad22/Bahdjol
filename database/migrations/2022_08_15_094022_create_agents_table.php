<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAgentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cat_id')->constrained('all_categories')->default("");
            $table->foreignId('subcat_id')->constrained('sub_categories')->default("");
            $table->string('agent_name');
            $table->double('lat');
            $table->double('longitude');
            $table->string('agent_phone');
            $table->string('agent_email')->unique();
            $table->string('password');
            $table->string('device_token');
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
        Schema::dropIfExists('agents');
    }
}
