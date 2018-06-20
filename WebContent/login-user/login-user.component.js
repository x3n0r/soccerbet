//(function () {
    'use strict';

    angular
        .module('loginUser').
        component('loginUser', {
            templateUrl: 'login-user/login-user.template.html',
        	controller: function LoginController($location, AuthenticationService, FlashService) {
                var vm = this;

                vm.login = login;

                (function initController() {
                    // reset login status
                    AuthenticationService.ClearCredentials();
                })();

                function login() {
                    vm.dataLoading = true;
                    AuthenticationService.Login(vm.username, vm.password, function (response) {
                        if (response.success) {
                            AuthenticationService.SetCredentials(vm.username, vm.password);
                            $location.path('/');
                            $rootScope.username;
                        } else {
                            FlashService.Error(response.message);
                            vm.dataLoading = false;
                        }
                    });
                };
            }
        });
    /*
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$location', 'AuthenticationService', 'FlashService'];
    function LoginController($location, AuthenticationService, FlashService) {
        var vm = this;

        vm.login = login;

        (function initController() {
            // reset login status
            AuthenticationService.ClearCredentials();
        })();

        function login() {
            vm.dataLoading = true;
            AuthenticationService.Login(vm.username, vm.password, function (response) {
                if (response.success) {
                    AuthenticationService.SetCredentials(vm.username, vm.password);
                    $location.path('/');
                } else {
                    FlashService.Error(response.message);
                    vm.dataLoading = false;
                }
            });
        };
    }
*/
//})();
