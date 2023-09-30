<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use App\Notifications\VerifyEmail;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Filament\Notifications\Notification;

class RegisterController extends Controller
{
    public function register(RegisterRequest $request)
    {
        try {
            DB::beginTransaction();

            $user = User::create($request->all());
            $token = $user->createToken($request->name);

            $respone = [
                'data' => $user,
                'token' => $token->plainTextToken,
            ];

            $code = random_int(10000, 99999);
            $user->update(['code' => $code]);
            $user->notify(new VerifyEmail($code));

            Notification::make()
                ->title('New order')
                ->icon('heroicon-o-shopping-bag')
                ->sendToDatabase($user);
            
            DB::commit();

            return response()->json($respone);
        } catch (\Exception $e) {
            DB::rollBack();

            return response($e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function verify(Request $request)
    {
        $user = User::where('code', $request->code);

        if (!$user) {
            return response()->json(['message' => 'Code is invalid'], Response::HTTP_BAD_REQUEST);
        }
        $user->update(['code' => null, 'email_verified_at' => now()]);

        return response()->json(['message' => 'Verify Successfully'], Response::HTTP_OK);
    }
}