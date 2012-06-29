/**
 * Define the main module Seif that holds routing config
 */
angular.module('seif', [
	'service', 'instance', 'serviceFilterDescription', 'noServiceDescription'
	]).config(function($routeProvider) {
		$routeProvider.
		when('/', {
			controller:ServiceList, templateUrl:'/assets/partials/services.html'}).
		when('/service/:name', {
			controller:ServiceController, templateUrl:'/assets/partials/service.html'}).
		otherwise({redirectTo:'/'});
});

/**
 * Controller for handling the services list
 */
function ServiceList($scope, Service) {
	$scope.services = Service.all();
}

function ServiceController($scope, $location, $routeParams, Service) {
	var self = this;

	Service.get({name: $routeParams.name}, function(service) {
		self.original = service;
		$scope.service = new Service(self.original);
	});

	$scope.destroy = function() {
		self.original.destroy(function() {
			$location.path('/');
		});
	};

	$scope.save = function() {
		self.service.update(function() {
			$location.path('/');
		});
	};
}

function InstanceList($scope) {
	$scope.instances = Instance.query();
}

/**
 * Filters to make information more human readable
 */
angular.module('serviceFilterDescription', []).filter('filter_description', function() {
  return function(input) {
    return input ? input : 'all';
  };
});

angular.module('noServiceDescription', []).filter('no_services_description', function() {
  return function(input) {
    return (input.length > 0) ? '' : 'No services running.';
  };
});
