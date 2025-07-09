<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('menu_id');
            $table->unsignedBigInteger('order_id');
            $table->integer('qty')->nullable();
            $table->decimal('harga',10,2)->nullable();
            $table->decimal('total',10,2)->nullable();
            $table->timestamps();

            $table->foreign('menu_id')->references('id_item')->on('menus')->onDelete('cascade');
            $table->foreign('order_id')->references('id_pesanan')->on('orders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
