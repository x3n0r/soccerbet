'use strict';

// Register `visualizeData` component, along with its associated controller and template
angular.
  module('visualizeData').
  component('visualizeData', {
    templateUrl: 'visualize-data/visualize-data.template.html',
	controller: [ '$http', 
	  function VisualizeDataController($http) {
		var self = this;
		//test get
		$http.get('test-data/matches/matches.json');
//		$http.get('test-data/matches/matches.json').then(function(response) {
//			self.matches = response.data;
//			$http.get('test-data/teams/' + self.matches[0].HostTeam + '.json').then(function(response) {
//				self.hostteam = response.data;
//			});
//			$http.get('test-data/teams/' + self.matches[0].GuestTeam + '.json').then(function(response) {
//				self.guestteam = response.data;
//			});
//		});
      }]
  });
