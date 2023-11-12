<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Hash;

class GoogleController extends Controller
{
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        try {
      
            $user = Socialite::driver('google')->user();
            $existingUser = User::where('email', $user->email)->first();

            if($existingUser){
       
                // auth()->login($existingUser);
                $existingUser->tokens()->delete();
                $existingUser = $existingUser->createToken($existingUser->name);

                return response()->json($existingUser);
       
            } else {
                $newUser = User::create([
                    'name' => $user->name,
                    'email' => $user->email,
                    'provider_id'=> $user->id,
                    'email_verified_at' => now(),
                    'password' => Hash::make('12345678'),
                ]);
                $newUser = $newUser->createToken($newUser->name);
      
                return response()->json($newUser);
            }
      
        } catch (Exception $e) {
            return $e->getMessage();
        }

    }
}
