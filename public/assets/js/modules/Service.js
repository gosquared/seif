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