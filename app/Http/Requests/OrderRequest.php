<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'phone' => 'required|numeric',
            'address' => 'required',
            'fullname' => 'required',
            // 'order_detail' => 'required',
            // 'order_detail.*.product_id' => 'required',
            // 'order_detail.*.quantity' => 'required|numeric',
        ];
    }

    function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'validate' => $validator->errors(),
        ]));
    }
}
