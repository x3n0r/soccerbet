//(function () {
    'use strict';

    angular
    .module('registerUser').
    component('registerUser', {
        templateUrl: 'register-user/register-user.template.html',
    	controller: function RegisterController(UserService, $location, $rootScope, FlashService) {
        var vm = this;

        vm.register = register;

        function register() {
            vm.dataLoading = true;
            UserService.Create(vm.user)
                .then(function (response) {
                    if (response.success) {
                        FlashService.Success('Registration successful', true);
                        $location.path('/login');
                        $scope.tab = 1;
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
        }
    }
    });

//})();
