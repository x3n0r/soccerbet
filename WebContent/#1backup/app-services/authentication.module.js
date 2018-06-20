'use strict';

// Define the `login` module
//angular.module('login', [ 'AuthenticationService', 'FlashService']);
angular.module('core.authentication', ['$http', '$cookies', '$rootScope', '$timeout', 'core.User']);