'use strict';

// Register `matchList` component, along with its associated controller and template
angular.
  module('testTab').
  component('testTab', {
    templateUrl: 'test-tab/test-tab.template.html',
	controller: [ '$http', '$scope', '$parse',
	function TestTabController($http,$scope,$parse) {
		$scope.records = [ 'asdf' , 'aaaa' ];
		$scope.invited = [];
		
		$scope.insertinvited = function(user) {
		    if(user.isChecked) {
		        $scope.invited.push(user.name);
		    } else {
		        var toDel = $scope.invited.indexOf(user);
		        $scope.invited.splice(toDel);
		    }
		}
     }]
  });