<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use App\Models\Addon;
use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        User::create([
            'nama' => 'Super Admin',
            'email' => 'admin@admin.com',
            'username' => 'admin',
            'password' => bcrypt('admin123'),
            'role' => 'admin',
            'no_telepon' => '08123456789',
            'created_at' => now(),
            'updated_at' => now()
        ]);
        
        User::create([
            'nama' => 'Customer Test',
            'email' => 'customer@test.com',
            'username' => 'customer',
            'password' => bcrypt('password'),
            'role' => 'user',
            'no_telepon' => '08987654321',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        $kategoris = [
            ['nama_kategori' => 'Pancong Original'],
            ['nama_kategori' => 'Pancong Manis'],
            ['nama_kategori' => 'Pancong Asin'],
            ['nama_kategori' => 'Pancong Spesial'],
            ['nama_kategori' => 'Minuman']
        ];

        foreach ($kategoris as $kategori) {
            Category::create($kategori);
        }

        $menus = [
            [
                'nama_item' => 'Pancong Original',
                'harga' => 8000,
                'kategori_id' => 1,
            ],
            [
                'nama_item' => 'Pancong Keju',
                'harga' => 12000,
                'kategori_id' => 3,
            ],
            [
                'nama_item' => 'Pancong Coklat',
                'harga' => 10000,
                'kategori_id' => 2,
            ],
        ];

        foreach($menus as $menu) {
            DB::table('menus')->insert(array_merge($menu, [
                'created_at' => now(),
                'updated_at' => now()
            ]));
        }

        $addons = [
            [
                'nama_addon' => 'Keju Cheddar',
                'harga_addon' => 3000,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Coklat Nutella',
                'harga_addon' => 4000,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Strawberry Jam',
                'harga_addon' => 2500,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Susu Kental Manis',
                'harga_addon' => 2000,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Meses Coklat',
                'harga_addon' => 1500,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Mentega',
                'harga_addon' => 1000,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Pisang',
                'harga_addon' => 3500,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Kacang Tanah',
                'harga_addon' => 2000,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Oreo Crumble',
                'harga_addon' => 3500,
                'is_active' => true
            ],
            [
                'nama_addon' => 'Es Krim Vanilla',
                'harga_addon' => 5000,
                'is_active' => false
            ]
        ];

        foreach ($addons as $addon) {
            Addon::firstOrCreate(
                ['nama_addon' => $addon['nama_addon']],
                $addon
            );
        }
    }
}
