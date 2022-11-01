<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SuperAdmin;
use App\Models\Admin;
use App\Models\Provider;
use App\Models\Patient;
use Faker;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

       // insert data into super_admin table
        SuperAdmin::create([
            'name' => 'Super Admin',
            'email' => 'superadmin@live.com',
            'password' => bcrypt('12345678'),
        ]);

        // insert data into admin table
        Admin::create([
            'name' => 'Admin',
            'email' => 'admin@live.com',
            'password' => bcrypt('12345678'),
        ]);

        // insert data into provider table
        Provider::create([
            'name' => 'Provider',
            'email' => 'provider@gmail.com',
            'password' => bcrypt('12345678'),
        ]);
 
    
    $faker = Faker\Factory::create();
        foreach (range(1, 100) as $index) {
            DB::table('patients')->insert([
                'patient_name' => $faker->name,
                'address' => $faker->address,
                'phone' => $faker->phoneNumber,
                'disease' => $faker->sentence,
            ]);
        }

        

    }
}
