<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class UpdateProfileController extends Controller
{
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return $validator->messages()->toJson();
        }

        $user = User::where('email', $request->email);

        if ($request->hasFile('avatar')) {
            $avatarName = time().'.'.$request->avatar->getClientOriginalExtension();
            $request->avatar->move(public_path('avatars'), $avatarName);

            $user->update(['avatar' => $avatarName]);
        }

        $user->update($request->except('avatar'));

        return response()->json(['message' => 'Update Profile Successfully']);
    }
}
