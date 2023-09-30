<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Category::class => CategoryPolicy::class,
        Product::class => ProductPolicy::class,
        User::class => UserPolicy::class,
        \Spatie\Permission\Models\Permission::class => \App\Policies\PermissionPolicy::class,
        \Spatie\Permission\Models\Role::class => \App\Policies\RolePolicy::class
   ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();
        \Illuminate\Support\Facades\Gate::before(function (\App\Models\User $user, string $ability) {
            return $user->isSuperAdmin() ? true: null;
        });
    }
}
