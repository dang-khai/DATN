<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\TestBroadcast;
use Filament\Notifications\Events\DatabaseNotificationsSent;
use Filament\Notifications\Notification;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => 'User is not registered'], Response::HTTP_UNAUTHORIZED);
        } elseif (!Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Password is incorrect'], Response::HTTP_UNAUTHORIZED);
        } elseif ($user->email_verified_at == null) {
            return response()->json(['message' => 'Please verify email first'], Response::HTTP_UNAUTHORIZED);
        }

        $user->tokens()->delete();
        $user->token = $user->createToken($user->fullname);

        // event(new \App\Events\testBroadcast($user));   
        $userAdmin = User::where('fullname', 'admin')->first();
        // Notification::make()
        //     ->title('cc')
        //     ->broadcast($userAdmin);
        
        return response()->json($user);
    }
}