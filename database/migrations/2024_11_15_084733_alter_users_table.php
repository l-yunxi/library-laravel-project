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
        Schema::table('users', function (Blueprint $table) {
            $table->boolean('is_blocked')->default(false);
            $table->date('blocked_until')->nullable();
            $table->smallInteger('role')->nullable();
            $table->boolean('status')->default(true);
            $table->unsignedBigInteger('fk_personal_data')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('is_blocked');
            $table->dropColumn('blocked_until');
            $table->dropColumn('role');
            $table->dropColumn('status');
            $table->dropColumn('fk_personal_data');
        });
    }
};