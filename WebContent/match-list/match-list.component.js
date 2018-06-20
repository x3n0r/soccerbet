'use strict';

// Register `matchList` component, along with its associated controller and template
angular.
  module('matchList').
  component('matchList', {
    templateUrl: 'match-list/match-list.template.html',
	controller: [ '$http', 
	              function MatchListController($http) {
		var self = this;
		$http.get('test-data/matches/matches.json').then(function(response) {
			self.matches = response.data;
			$http.get('test-data/teams/' + self.matches[0].HostTeam + '.json').then(function(response) {
				self.hostteam = response.data;
			});
			$http.get('test-data/teams/' + self.matches[0].GuestTeam + '.json').then(function(response) {
				self.guestteam = response.data;
			});
		});
      }]
  });
