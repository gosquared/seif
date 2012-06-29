/**
 * Service module handles interaction with the API
 */
angular.module('service', ['ngResource']).factory('Service', function($resource) {
	var Service = $resource('/v1/services/:name',
		{}, // query parameters, i.e. auth
		{
			update:  { method: 'PUT' },
			destroy: { method: 'DELETE' },
			all:     { method:'GET', isArray:true }
		}
	);

	Service.prototype.update = function(callback) {
		//return Service.update()
	};

	return Service;
});

/**
 * Controllers for handling the services views
 */
function ServiceList($scope, Service) {
	$scope.services = Service.all();
}

function ServiceController($scope, $location, $routeParams, Service) {
	Service.get({name: $routeParams.name}, function(service) {
		$scope.service = new Service(service);
	});
}

function EditServiceController($scope, $location, $routeParams, Service) {
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