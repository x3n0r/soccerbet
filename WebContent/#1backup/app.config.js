'use strict';

angular.
  module('soccerApp').
  config(['$locationProvider' ,'$routeProvider',
    function config($locationProvider, $routeProvider) {
      $locationProvider.hashPrefix('!');

      $routeProvider.
        when('/matches', {
          template: '<match-list></match-list>'
        }).
        when('/login', {
        	template: '<login-user></login-user>'
        }).
        when('/register', {
        	template: '<register-user></register-user>'
        }).
        when('/home', {
        	template: '<home-user></home-user>'
        }).
        otherwise('/home');
    }
  ]);
