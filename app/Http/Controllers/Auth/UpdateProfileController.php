<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UpdateProfileController extends Controller
{
    public function update(Request $request)
    {
        $user = User::where('email', $request->email);

        $user->update($request->all());

        return response()->json(['message' => 'Update Profile Successfully']);
    }
}
